package com.ujcms.core.domain.base;

import org.springframework.lang.Nullable;

/**
 * This class was generated by MyBatis Generator.
 *
 * @author MyBatis Generator
 */
public class ChannelBase {
    /**
     * 数据库表名
     */
    public static final String TABLE_NAME = "channel";

    /**
     * 栏目ID
     */
    private int id = 0;

    /**
     * 站点ID
     */
    private int siteId = 0;

    /**
     * 上级栏目ID
     */
    @Nullable
    private Integer parentId;

    /**
     * 栏目模型ID
     */
    private int channelModelId = 0;

    /**
     * 文章模型ID
     */
    private int articleModelId = 0;

    /**
     * 名称
     */
    private String name = "";

    /**
     * 别名
     */
    private String alias = "";

    /**
     * 是否导航菜单
     */
    private boolean nav = true;

    /**
     * 类型(1:常规栏目,2:单页栏目,3:转向链接,4:链接到第一篇文章,5:链接到第一个子栏目)
     */
    private short type = 1;

    /**
     * 层级
     */
    private short depth = 1;

    /**
     * 排列顺序
     */
    private short order = 32767;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSiteId() {
        return siteId;
    }

    public void setSiteId(int siteId) {
        this.siteId = siteId;
    }

    @Nullable
    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(@Nullable Integer parentId) {
        this.parentId = parentId;
    }

    public int getChannelModelId() {
        return channelModelId;
    }

    public void setChannelModelId(int channelModelId) {
        this.channelModelId = channelModelId;
    }

    public int getArticleModelId() {
        return articleModelId;
    }

    public void setArticleModelId(int articleModelId) {
        this.articleModelId = articleModelId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public boolean isNav() {
        return nav;
    }

    public void setNav(boolean nav) {
        this.nav = nav;
    }

    public short getType() {
        return type;
    }

    public void setType(short type) {
        this.type = type;
    }

    public short getDepth() {
        return depth;
    }

    public void setDepth(short depth) {
        this.depth = depth;
    }

    public short getOrder() {
        return order;
    }

    public void setOrder(short order) {
        this.order = order;
    }
}