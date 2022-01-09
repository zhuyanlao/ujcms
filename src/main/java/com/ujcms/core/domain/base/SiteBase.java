package com.ujcms.core.domain.base;

import org.springframework.lang.Nullable;

/**
 * This class was generated by MyBatis Generator.
 *
 * @author MyBatis Generator
 */
public class SiteBase {
    /**
     * 数据库表名
     */
    public static final String TABLE_NAME = "site";

    /**
     * 站点ID
     */
    private int id = 0;

    /**
     * 上级站点ID
     */
    @Nullable
    private Integer parentId;

    /**
     * 组织ID
     */
    private int orgId = 0;

    /**
     * 模型ID
     */
    @Nullable
    private Integer modelId;

    /**
     * 附件发布点ID
     */
    @Nullable
    private Integer storageId;

    /**
     * 静态页发布点ID
     */
    @Nullable
    private Integer htmlStorageId;

    /**
     * 手机端静态页发布点ID
     */
    @Nullable
    private Integer mobileStorageId;

    /**
     * 名称
     */
    private String name = "";

    /**
     * 协议(http,https)
     */
    private String protocol = "";

    /**
     * 域名
     */
    private String domain = "";

    /**
     * 子目录
     */
    @Nullable
    private String subDir;

    /**
     * 主题
     */
    private String theme = "";

    /**
     * 手机端主题
     */
    private String mobileTheme = "";

    /**
     * 每页条数
     */
    private short pageSize = 20;

    /**
     * LOGO
     */
    @Nullable
    private String logo;

    /**
     * SEO标题
     */
    @Nullable
    private String seoTitle;

    /**
     * SEO关键词
     */
    @Nullable
    private String seoKeywords;

    /**
     * SEO描述
     */
    @Nullable
    private String seoDescription;

    /**
     * 水印设置
     */
    @Nullable
    private String watermarkSettings;

    /**
     * 层级
     */
    private short depth = 1;

    /**
     * 排序
     */
    private short order = 32767;

    /**
     * 状态(0:正常,1:关闭)
     */
    private short status = 0;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Nullable
    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(@Nullable Integer parentId) {
        this.parentId = parentId;
    }

    public int getOrgId() {
        return orgId;
    }

    public void setOrgId(int orgId) {
        this.orgId = orgId;
    }

    @Nullable
    public Integer getModelId() {
        return modelId;
    }

    public void setModelId(@Nullable Integer modelId) {
        this.modelId = modelId;
    }

    @Nullable
    public Integer getStorageId() {
        return storageId;
    }

    public void setStorageId(@Nullable Integer storageId) {
        this.storageId = storageId;
    }

    @Nullable
    public Integer getHtmlStorageId() {
        return htmlStorageId;
    }

    public void setHtmlStorageId(@Nullable Integer htmlStorageId) {
        this.htmlStorageId = htmlStorageId;
    }

    @Nullable
    public Integer getMobileStorageId() {
        return mobileStorageId;
    }

    public void setMobileStorageId(@Nullable Integer mobileStorageId) {
        this.mobileStorageId = mobileStorageId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProtocol() {
        return protocol;
    }

    public void setProtocol(String protocol) {
        this.protocol = protocol;
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    @Nullable
    public String getSubDir() {
        return subDir;
    }

    public void setSubDir(@Nullable String subDir) {
        this.subDir = subDir;
    }

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public String getMobileTheme() {
        return mobileTheme;
    }

    public void setMobileTheme(String mobileTheme) {
        this.mobileTheme = mobileTheme;
    }

    public short getPageSize() {
        return pageSize;
    }

    public void setPageSize(short pageSize) {
        this.pageSize = pageSize;
    }

    @Nullable
    public String getLogo() {
        return logo;
    }

    public void setLogo(@Nullable String logo) {
        this.logo = logo;
    }

    @Nullable
    public String getSeoTitle() {
        return seoTitle;
    }

    public void setSeoTitle(@Nullable String seoTitle) {
        this.seoTitle = seoTitle;
    }

    @Nullable
    public String getSeoKeywords() {
        return seoKeywords;
    }

    public void setSeoKeywords(@Nullable String seoKeywords) {
        this.seoKeywords = seoKeywords;
    }

    @Nullable
    public String getSeoDescription() {
        return seoDescription;
    }

    public void setSeoDescription(@Nullable String seoDescription) {
        this.seoDescription = seoDescription;
    }

    @Nullable
    public String getWatermarkSettings() {
        return watermarkSettings;
    }

    public void setWatermarkSettings(@Nullable String watermarkSettings) {
        this.watermarkSettings = watermarkSettings;
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

    public short getStatus() {
        return status;
    }

    public void setStatus(short status) {
        this.status = status;
    }
}