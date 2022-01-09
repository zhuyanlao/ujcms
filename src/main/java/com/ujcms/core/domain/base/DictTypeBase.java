package com.ujcms.core.domain.base;

import org.springframework.lang.Nullable;

/**
 * This class was generated by MyBatis Generator.
 *
 * @author MyBatis Generator
 */
public class DictTypeBase {
    /**
     * 数据库表名
     */
    public static final String TABLE_NAME = "dict_type";

    /**
     * 数据字典类型ID
     */
    private int id = 0;

    /**
     * 站点ID
     */
    private int siteId = 0;

    /**
     * 名称
     */
    private String name = "";

    /**
     * 别名
     */
    private String alias = "";

    /**
     * 备注
     */
    @Nullable
    private String remark;

    /**
     * 共享范围(0:本站私有,1:子站点共享,2:全局共享)
     */
    private short scope = 0;

    /**
     * 排列顺序
     */
    private short order = 32767;

    /**
     * 是否系统字典
     */
    private boolean sys = false;

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

    @Nullable
    public String getRemark() {
        return remark;
    }

    public void setRemark(@Nullable String remark) {
        this.remark = remark;
    }

    public short getScope() {
        return scope;
    }

    public void setScope(short scope) {
        this.scope = scope;
    }

    public short getOrder() {
        return order;
    }

    public void setOrder(short order) {
        this.order = order;
    }

    public boolean isSys() {
        return sys;
    }

    public void setSys(boolean sys) {
        this.sys = sys;
    }
}