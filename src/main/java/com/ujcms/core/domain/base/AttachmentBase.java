package com.ujcms.core.domain.base;

import java.time.OffsetDateTime;

/**
 * This class was generated by MyBatis Generator.
 *
 * @author MyBatis Generator
 */
public class AttachmentBase {
    /**
     * 数据库表名
     */
    public static final String TABLE_NAME = "attachment";

    /**
     * 附件ID
     */
    private int id = 0;

    /**
     * 站点ID
     */
    private int siteId = 0;

    /**
     * 用户ID
     */
    private int userId = 0;

    /**
     * 文件名称
     */
    private String name = "";

    /**
     * 存储路径
     */
    private String path = "";

    /**
     * 访问路径
     */
    private String url = "";

    /**
     * 文件长度
     */
    private long length = 0;

    /**
     * 创建时间
     */
    private OffsetDateTime created = OffsetDateTime.now();

    /**
     * 是否使用
     */
    private boolean used = false;

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

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public long getLength() {
        return length;
    }

    public void setLength(long length) {
        this.length = length;
    }

    public OffsetDateTime getCreated() {
        return created;
    }

    public void setCreated(OffsetDateTime created) {
        this.created = created;
    }

    public boolean isUsed() {
        return used;
    }

    public void setUsed(boolean used) {
        this.used = used;
    }
}