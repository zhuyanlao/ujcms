package com.ujcms.core.domain.base;

/**
 * This class was generated by MyBatis Generator.
 *
 * @author MyBatis Generator
 */
public class SiteBufferBase {
    /**
     * 数据库表名
     */
    public static final String TABLE_NAME = "site_buffer";

    /**
     * 站点ID
     */
    private int id = 0;

    /**
     * 浏览次数
     */
    private long views = 0;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public long getViews() {
        return views;
    }

    public void setViews(long views) {
        this.views = views;
    }
}