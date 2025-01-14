package com.ujcms.cms.core.web.backendapi;

import com.google.common.collect.ImmutableMap;
import com.ujcms.cms.core.domain.Attachment;
import com.ujcms.cms.core.domain.Config;
import com.ujcms.cms.core.domain.Site;
import com.ujcms.cms.core.domain.User;
import com.ujcms.cms.core.service.AttachmentService;
import com.ujcms.cms.core.service.ConfigService;
import com.ujcms.cms.core.support.Contexts;
import com.ujcms.cms.core.support.UrlConstants;
import com.ujcms.util.file.FileHandler;
import com.ujcms.util.image.ImageHandler;
import com.ujcms.util.image.Images;
import com.ujcms.util.image.ResizeMode;
import com.ujcms.util.misc.MediaUtils;
import com.ujcms.util.web.PathResolver;
import com.ujcms.util.web.Responses;
import com.ujcms.util.web.Uploads;
import com.ujcms.util.web.exception.Http400Exception;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.validator.routines.DomainValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;
import ws.schild.jave.EncoderException;
import ws.schild.jave.MultimediaObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.URL;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import static com.ujcms.cms.core.domain.Config.Security.SSRF_WILDCARD;
import static com.ujcms.util.web.Uploads.*;

/**
 * 上传 Controller
 *
 * @author PONY
 */
@RestController("backendUploadController")
@RequestMapping(UrlConstants.BACKEND_API)
public class UploadController extends AbstractUploadController {
    private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

    private final ConfigService configService;

    public UploadController(AttachmentService attachmentService, PathResolver pathResolver, ImageHandler imageHandler,
                            ConfigService configService) {
        super(attachmentService, imageHandler, pathResolver);
        this.configService = configService;
    }

    /**
     * 上传图片。缩略图宽度、高度同时存在时，才生成缩略图
     *
     * @param maxWidth        图片最大宽度
     * @param maxHeight       图片最大高度
     * @param isWatermark     是否加水印
     * @param thumbnailWidth  缩略图宽度
     * @param thumbnailHeight 缩略图高度
     */
    @PostMapping("image-upload")
    @PreAuthorize("hasAnyAuthority('backend','*')")
    public Map<String, Object> imageUpload(Integer maxWidth, Integer maxHeight, String resizeMode, Boolean isWatermark,
                                           Integer thumbnailWidth, Integer thumbnailHeight, HttpServletRequest request)
            throws IOException, EncoderException {
        Config.Upload upload = configService.getUnique().getUpload();
        ExtraHandle extraHandle = (tempFile, baseName, extension, pathname, fileHandler, site, userId, result) -> {
            // 图片压缩。全局设置大于一定像素的图片进行压缩。
            int imageMaxWidth = maxWidth != null ? maxWidth : upload.getImageMaxWidth();
            int imageMaxHeight = maxHeight != null ? maxHeight : upload.getImageMaxHeight();
            if (imageMaxWidth > 0 || imageMaxHeight > 0) {
                ResizeMode mode = resizeMode == null ? ResizeMode.normal : ResizeMode.valueOf(resizeMode);
                imageHandler.resize(tempFile.getAbsolutePath(), tempFile.getAbsolutePath(),
                        imageMaxWidth, imageMaxHeight, mode);
            }
            // 图片水印
            Site.Watermark watermark = site.getWatermark();
            String overlay = watermark.getOverlay();
            boolean isNeedWatermark = site.getWatermark().isEnabled() && overlay != null
                    && (isWatermark != null && isWatermark);
            if (isNeedWatermark) {
                // 水印图片可能位于远程服务器，需要获取到本地
                Optional.ofNullable(fileHandler.getName(overlay)).map(fileHandler::getFile).ifPresent(overlayFile -> {
                    // 全局设置大于多少的图片加水印
                    imageHandler.watermark(tempFile.getAbsolutePath(), tempFile.getAbsolutePath(),
                            overlayFile.getAbsolutePath(), watermark.getPosition(), watermark.getDissolve(),
                            watermark.getMinWidth(), watermark.getMinHeight());
                    FileUtils.deleteQuietly(overlayFile);
                });
            }
            // 缩略图。图集需要缩略图，其他一般不需要。
            thumbnail(imageHandler, fileHandler, tempFile, Uploads.getThumbnailName(pathname),
                    extension, thumbnailWidth, thumbnailHeight);
        };
        return doUpload(request, upload.getImageLimitByte(), upload.getImageTypes(), IMAGE_TYPE, extraHandle);
    }

    @PostMapping("video-upload")
    @PreAuthorize("hasAnyAuthority('backend','*')")
    public Map<String, Object> videoUpload(HttpServletRequest request) throws IOException, EncoderException {
        Config.Upload upload = configService.getUnique().getUpload();
        ExtraHandle extraHandle = (tempFile, baseName, extension, pathname, fileHandler, site, userId, result) -> {
            MultimediaObject multimediaObject = new MultimediaObject(tempFile);
            long duration = MediaUtils.getDuration(multimediaObject);
            result.put("duration", duration / 1000);
            String ext = "jpg";
            File imageFile = Files.createTempFile(null, "." + ext).toFile();
            try {
                MediaUtils.renderOneImage(multimediaObject, duration, imageFile);
                String path = site.getBasePath("/" + IMAGE_TYPE) + Uploads.getRandomFilename(ext);
                String url = fileHandler.getDisplayPrefix() + path;
                fileHandler.store(path, imageFile);
                attachmentService.insert(new Attachment(site.getId(), userId, baseName + "." + ext,
                        path, url, imageFile.length()));
                result.put("image", url);
            } finally {
                FileUtils.deleteQuietly(imageFile);
            }
        };
        return doUpload(request, upload.getVideoLimitByte(), upload.getVideoTypes(), VIDEO_TYPE, extraHandle);
    }

    @PostMapping("audio-upload")
    @PreAuthorize("hasAnyAuthority('backend','*')")
    public Map<String, Object> audioUpload(HttpServletRequest request) throws IOException, EncoderException {
        Config.Upload upload = configService.getUnique().getUpload();
        ExtraHandle extraHandle = (tempFile, baseName, extension, pathname, fileHandler, site, userId, result) ->
                result.put("duration", MediaUtils.getDuration(new MultimediaObject(tempFile)) / 1000);
        return doUpload(request, upload.getAudioLimitByte(), upload.getAudioTypes(), AUDIO_TYPE, extraHandle);
    }

    @PostMapping("doc-upload")
    @PreAuthorize("hasAnyAuthority('backend','*')")
    public Map<String, Object> docUpload(HttpServletRequest request) throws IOException, EncoderException {
        Config.Upload upload = configService.getUnique().getUpload();
        return doUpload(request, upload.getDocLimitByte(), upload.getDocTypes(), DOC_TYPE, null);
    }

    @PostMapping("file-upload")
    @PreAuthorize("hasAnyAuthority('backend','*')")
    public Map<String, Object> fileUpload(HttpServletRequest request) throws IOException, EncoderException {
        Config.Upload upload = configService.getUnique().getUpload();
        return doUpload(request, upload.getFileLimitByte(), upload.getFileTypes(), FILE_TYPE, null);
    }

    @PostMapping("avatar-upload")
    @PreAuthorize("hasAnyAuthority('backend','*')")
    public Map<String, Object> avatarUpload(HttpServletRequest request) throws EncoderException, IOException {
        Config config = configService.getUnique();
        Config.Upload upload = config.getUpload();
        return doUpload(request, upload.getImageLimitByte(), upload.getImageTypes(), AVATAR_TYPE, null);
    }

    @PostMapping("avatar-crop")
    @PreAuthorize("hasAnyAuthority('backend','*')")
    public Map<String, Object> avatarCrop(@RequestBody CropParams params) throws IOException {
        Config config = configService.getUnique();
        return doAvatarCrop(config, params);
    }

    @PostMapping("image-crop")
    @PreAuthorize("hasAnyAuthority('backend','*')")
    public Map<String, Object> imageCrop(@RequestBody CropParams params) throws IOException {
        Site site = Contexts.getCurrentSite();
        User user = Contexts.getCurrentUser();
        FileHandler fileHandler = site.getConfig().getUploadStorage().getFileHandler(pathResolver);
        String src = fileHandler.getName(params.url);
        if (src == null) {
            throw new Http400Exception("external url not support: " + params.url);
        }
        // 图片裁剪。图片任意裁剪，生成新图片。
        String extension = FilenameUtils.getExtension(src);
        String pathname = site.getBasePath("/" + IMAGE_TYPE) + Uploads.getRandomFilename(extension);
        String url = fileHandler.getDisplayPrefix() + pathname;
        File file = fileHandler.getFile(src);
        if (file == null) {
            throw new Http400Exception("file not found: " + src);
        }
        File tempFile = Files.createTempFile(null, "." + extension).toFile();
        try {
            // 裁剪
            crop(fileHandler, file, tempFile, pathname, params);
            // 缩略图。图集需要缩略图，其他一般不需要。
            thumbnail(imageHandler, fileHandler, tempFile, Uploads.getThumbnailName(pathname), extension,
                    params.thumbnailWidth, params.thumbnailHeight);
            String name = src.substring(src.lastIndexOf("/") + 1);
            attachmentService.insert(new Attachment(site.getId(), user.getId(),
                    name, pathname, url, tempFile.length()));
            Map<String, Object> result = new HashMap<>(4);
            result.put("url", url);
            return result;
        } finally {
            if (file.exists()) {
                FileUtils.deleteQuietly(file);
            }
            if (tempFile.exists()) {
                FileUtils.deleteQuietly(tempFile);
            }
        }
    }

    /**
     * 抓取远程图片
     */
    @PostMapping(value = "image-fetch", consumes = "text/plain")
    @PreAuthorize("hasAnyAuthority('backend','*')")
    public ResponseEntity<Responses.Body> imageFetch(@RequestBody String source) {
        Config config = configService.getUnique();
        FileHandler fileHandler = config.getUploadStorage().getFileHandler(pathResolver);
        Site site = Contexts.getCurrentSite();
        Config.Security security = config.getSecurity();
        List<String> whiteList = security.getSsrfList();
        try {
            URL src = new URL(source);
            // 只支持 http 和 https 协议
            String protocol = src.getProtocol();
            String httpProtocol = "http", httpsProtocol = "https";
            if (!httpProtocol.equals(protocol) && !httpsProtocol.equals(protocol)) {
                return Responses.failure("Only supports http and https protocols: " + protocol);
            }
            // 只允许默认端口
            int port = src.getPort();
            if (port != -1) {
                return Responses.failure("Only default port is allowed: " + port);
            }
            String host = src.getHost();
            // 域名是否合法
            if (!DomainValidator.getInstance(true).isValid(host)) {
                return Responses.failure("Host is not valid: " + host);
            }
            // 是否在白名单内
            boolean inWhiteList = false;
            for (String domain : whiteList) {
                // 允许使用顶级域名
                if (domain.equals(SSRF_WILDCARD) || host.equals(domain) || host.endsWith("." + domain)) {
                    inWhiteList = true;
                    break;
                }
            }
            if (!inWhiteList) {
                return Responses.failure("Host not in whitelist: " + host);
            }
            // 禁止访问本地网络
            InetAddress inetAddress = InetAddress.getByName(host);
            if (inetAddress.isSiteLocalAddress() || inetAddress.isAnyLocalAddress() ||
                    inetAddress.isLoopbackAddress() || inetAddress.isLinkLocalAddress()) {
                return Responses.failure("Block access to local network: " + host);
            }
            // 使用UriComponentsBuilder重新构建url，防止攻击
            src = UriComponentsBuilder.newInstance().scheme(protocol).host(host)
                    .path(src.getPath()).query(src.getQuery()).build().toUri().toURL();
            HttpURLConnection conn = (HttpURLConnection) src.openConnection();
            conn.setInstanceFollowRedirects(false);
            // responseCode 必须为 200
            int responseCode = conn.getResponseCode();
            if (responseCode != HttpServletResponse.SC_OK) {
                return Responses.failure("Response code error: " + responseCode);
            }
            // contentType 只支持 image/jpeg image/gif image/png image/bmp image/webp
            String contentType = conn.getContentType();
            String extension = Images.getImageExtension(contentType);
            if (extension == null) {
                return Responses.failure("Only supports image contentType: " + contentType);
            }
            // 获得存储路径和显示路径
            String pathname = site.getBasePath("/" + IMAGE_TYPE) + Uploads.getRandomFilename(extension);
            String url = fileHandler.getDisplayPrefix() + pathname;
            try (InputStream is = conn.getInputStream()) {
                fileHandler.store(pathname, is);
            }
            return Responses.ok(ImmutableMap.of("src", source, "url", url));
        } catch (Exception e) {
            logger.error("Image cache error!", e);
            return Responses.failure("Image cache error!");
        }
    }
}
