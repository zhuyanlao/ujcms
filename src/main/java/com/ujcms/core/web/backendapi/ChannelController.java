package com.ujcms.core.web.backendapi;

import com.ujcms.core.domain.Channel;
import com.ujcms.core.domain.Site;
import com.ujcms.core.domain.base.GroupBase;
import com.ujcms.core.service.ChannelService;
import com.ujcms.core.service.GroupService;
import com.ujcms.core.support.Contexts;
import com.ujcms.core.support.Props;
import com.ofwise.util.query.QueryUtils;
import com.ofwise.util.web.Entities;
import com.ofwise.util.web.Responses;
import com.ofwise.util.web.Responses.Body;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static com.ujcms.core.support.Constants.TEMPLATE_SUFFIX;
import static com.ujcms.core.support.UrlConstants.BACKEND_API;

/**
 * 栏目 Controller
 *
 * @author PONY
 */
@RestController("backendChannelController")
@RequestMapping(BACKEND_API + "/core/channel")
public class ChannelController {
    private GroupService groupService;
    private ChannelService service;
    private ResourceLoader resourceLoader;
    private Props props;

    public ChannelController(GroupService groupService, ChannelService service,
                             ResourceLoader resourceLoader, Props props) {
        this.groupService = groupService;
        this.service = service;
        this.resourceLoader = resourceLoader;
        this.props = props;
    }

    @GetMapping
    @RequiresPermissions("channel:list")
    public Object list(HttpServletRequest request) {
        Site site = Contexts.getCurrentSite();
        Map<String, Object> queryMap = QueryUtils.getQueryMap(request.getQueryString());
        queryMap.put("EQ_siteId_Int", String.valueOf(site.getId()));
        return service.selectList(queryMap, null);
    }

    @GetMapping("{id}")
    @RequiresPermissions("channel:show")
    public Object show(@PathVariable int id) {
        Channel bean = service.select(id);
        if (bean == null) {
            return Responses.notFound("Channel not found. ID = " + id);
        }
        return bean;
    }

    @PostMapping
    @RequiresPermissions("channel:create")
    public ResponseEntity<Body> create(@RequestBody Channel bean) {
        Site site = Contexts.getCurrentSite();
        bean.setSiteId(site.getId());
        Channel channel = Entities.copy(bean, new Channel());
        List<Integer> groupIds = bean.getGroupIds();
        // 未设置用户组浏览权限，则默认给所有用户组权限。
        if (groupIds == null) {
            groupIds = groupService.selectList(null).stream().map(GroupBase::getId).collect(Collectors.toList());
        }
        service.insert(channel, channel.getExt(), groupIds, bean.getCustomList());
        return Responses.ok();
    }

    @PutMapping
    @RequiresPermissions("channel:update")
    public ResponseEntity<Body> update(@RequestBody Channel bean) {
        Channel channel = service.select(bean.getId());
        if (channel == null) {
            return Responses.notFound("Channel not found. ID = " + bean.getId());
        }
        Entities.copy(bean, channel, "siteId", "parentId", "order");
        service.update(channel, channel.getExt(), bean.getParentId(), bean.getGroupIds(), bean.getCustomList());
        return Responses.ok();
    }

    @PutMapping("order")
    @RequiresPermissions("org:update")
    public ResponseEntity<Body> updateOrder(@RequestBody int[] ids) {
        List<Channel> list = new ArrayList<>();
        for (int id : ids) {
            Channel bean = service.select(id);
            if (bean == null) {
                return Responses.notFound("Org not found. ID = " + id);
            }
            list.add(bean);
        }
        service.updateOrder(list);
        return Responses.ok();
    }

    @DeleteMapping
    @RequiresPermissions("channel:delete")
    public ResponseEntity<Body> delete(@RequestBody List<Integer> ids) {
        service.delete(ids);
        return Responses.ok();
    }

    @GetMapping("channel-templates")
    @RequiresPermissions("channel:list")
    public List<String> channelTemplate() throws IOException {
        Site site = Contexts.getCurrentSite();
        return getTemplates(site.getTheme(), "channel");
    }

    @GetMapping("article-templates")
    @RequiresPermissions("channel:list")
    public List<String> articleTemplate() throws IOException {
        Site site = Contexts.getCurrentSite();
        return getTemplates(site.getTheme(), "article");
    }

    private List<String> getTemplates(String theme, String startWitch) throws IOException {
        List<String> themeList = new ArrayList<>();
        File file = resourceLoader.getResource(props.getTemplatePath() + theme).getFile();
        if (!file.exists()) {
            return themeList;
        }
        File[] themeFiles = file.listFiles((dir, name) ->
                name.startsWith(startWitch) && name.endsWith(TEMPLATE_SUFFIX));
        if (themeFiles == null) {
            return themeList;
        }
        for (File themeFile : themeFiles) {
            String name = themeFile.getName();
            themeList.add(themeFile.getName().substring(0, name.indexOf(TEMPLATE_SUFFIX)));
        }
        return themeList;
    }
}