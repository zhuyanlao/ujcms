package com.ujcms.core.domain.base;

/**
 * This class was generated by MyBatis Generator.
 *
 * @author MyBatis Generator
 */
public class UserRoleBase {
    /**
     * 数据库表名
     */
    public static final String TABLE_NAME = "user_role";

    /**
     * 用户ID
     */
    private int userId = 0;

    /**
     * 角色ID
     */
    private int roleId = 0;

    /**
     * 角色排序
     */
    private short order = 9999;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public short getOrder() {
        return order;
    }

    public void setOrder(short order) {
        this.order = order;
    }
}