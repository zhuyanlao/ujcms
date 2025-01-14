package com.ujcms.cms.core.web.backendapi;

import com.ujcms.cms.core.domain.Site;
import com.ujcms.cms.core.service.SiteService;
import com.ujcms.cms.core.service.args.SiteArgs;
import com.ujcms.cms.core.support.Constants;
import com.ujcms.cms.core.support.Contexts;
import com.ujcms.cms.core.support.UrlConstants;
import com.ujcms.util.web.Responses;
import com.ujcms.util.web.exception.Http404Exception;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.core.io.ResourceLoader;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import static com.ujcms.cms.core.support.Constants.validLimit;
import static com.ujcms.cms.core.support.Constants.validOffset;
import static com.ujcms.util.query.QueryUtils.getQueryMap;

/**
 * 站点 Controller
 *
 * @author PONY
 */
@RestController("backendSiteController")
@RequestMapping(UrlConstants.BACKEND_API + "/core/site")
public class SiteController {
    private final SiteService service;
    private final ResourceLoader resourceLoader;

    public SiteController(SiteService service, ResourceLoader resourceLoader) {
        this.service = service;
        this.resourceLoader = resourceLoader;
    }

    @GetMapping
    @PreAuthorize("hasAnyAuthority('site:list','*')")
    public Object list(@RequestParam(defaultValue = "false") boolean current,
                       @RequestParam(defaultValue = "false") boolean currentOrg,
                       @Nullable Integer parentId, @Nullable Integer fullOrgId,
                       @Nullable Integer offset, @Nullable Integer limit, HttpServletRequest request) {
        Site currentSite = Contexts.getCurrentSite();
        if (current && parentId == null) {
            parentId = currentSite.getId();
        }
        if (currentOrg && fullOrgId == null) {
            fullOrgId = currentSite.getOrgId();
        }
        SiteArgs args = SiteArgs.of(getQueryMap(request.getQueryString()))
                .parentId(parentId).fullOrgId(fullOrgId);
        return service.selectList(args, validOffset(offset), validLimit(limit));
    }

    @GetMapping("{id}")
    @PreAuthorize("hasAnyAuthority('site:show','*')")
    public Object show(@PathVariable Integer id) {
        Site bean = service.select(id);
        if (bean == null) {
            return Responses.notFound("Site not found. ID = " + id);
        }
        return bean;
    }

    @GetMapping("/theme")
    @PreAuthorize("hasAnyAuthority('site:list','*')")
    public Object currentTheme() throws IOException {
        return getThemeList(Contexts.getCurrentSite());
    }

    @GetMapping("{id}/theme")
    @PreAuthorize("hasAnyAuthority('site:list','*')")
    public List<String> theme(@PathVariable Integer id) throws IOException {
        Site site = service.select(id);
        if (site == null) {
            throw new Http404Exception("Site not found. ID = " + id);
        }
        return getThemeList(site);
    }

    private List<String> getThemeList(Site site) throws IOException {
        List<String> themeList = new ArrayList<>();
        String globalShare = "/" + Constants.TEMPLATE_SHARE;
        String storagePath = site.getConfig().getTemplateStorage().getPath();
        appendTheme(themeList, storagePath, globalShare);
        String templateBase = site.getBasePath("");
        appendTheme(themeList, storagePath, templateBase);
        return themeList;
    }

    private void appendTheme(List<String> themeList, String path, String base) throws IOException {
        File file = resourceLoader.getResource(path + base).getFile();
        if (!file.exists()) {
            return;
        }
        File[] themeFiles = file.listFiles(File::isDirectory);
        if (themeFiles == null) {
            return;
        }
        for (File themeFile : themeFiles) {
            themeList.add(base + "/" + themeFile.getName());
        }
    }
}