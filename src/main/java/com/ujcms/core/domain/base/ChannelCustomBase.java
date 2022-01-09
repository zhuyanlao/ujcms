package com.ujcms.core.domain.base;

import org.springframework.lang.Nullable;

/**
 * This class was generated by MyBatis Generator.
 *
 * @author MyBatis Generator
 */
public class ChannelCustomBase {
    /**
     * 数据库表名
     */
    public static final String TABLE_NAME = "channel_custom";

    /**
     * 文章ID
     */
    private int channelId = 0;

    /**
     * 名称
     */
    private String name = "";

    /**
     * 值
     */
    @Nullable
    private String value;

    public int getChannelId() {
        return channelId;
    }

    public void setChannelId(int channelId) {
        this.channelId = channelId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Nullable
    public String getValue() {
        return value;
    }

    public void setValue(@Nullable String value) {
        this.value = value;
    }
}