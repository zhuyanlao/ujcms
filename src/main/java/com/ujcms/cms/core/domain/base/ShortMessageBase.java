package com.ujcms.cms.core.domain.base;

import java.time.OffsetDateTime;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;

/**
 * This class was generated by MyBatis Generator.
 *
 * @author MyBatis Generator
 */
public class ShortMessageBase {
    /**
     * 数据库表名
     */
    public static final String TABLE_NAME = "short_message";

    /**
     * 短信ID
     */
    @NotNull
    private Integer id = 0;

    /**
     * 类型(1:手机短信,2:邮件短信)
     */
    @NotNull
    private Short type = 1;

    /**
     * 接收人(手机号码或邮件地址)
     */
    @Length(max = 100)
    @NotNull
    private String receiver = "";

    /**
     * 验证码
     */
    @Length(max = 10)
    @NotNull
    private String code = "";

    /**
     * 发送时间
     */
    @NotNull
    private OffsetDateTime sendDate = OffsetDateTime.now();

    /**
     * 尝试次数
     */
    @NotNull
    private Short attempts = 0;

    /**
     * IP地址
     */
    @Length(max = 45)
    @NotNull
    private String ip = "";

    /**
     * 用途(0:测试,1:注册,2:登录,3:双因子登录,4:找回密码,5:修改手机号码,6:修改邮箱地址)
     */
    @NotNull
    private Short usage = 0;

    /**
     * 状态(0:未使用,1:验证正确,2:验证错误,3:已过期)
     */
    @NotNull
    private Short status = 0;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Short getType() {
        return type;
    }

    public void setType(Short type) {
        this.type = type;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public OffsetDateTime getSendDate() {
        return sendDate;
    }

    public void setSendDate(OffsetDateTime sendDate) {
        this.sendDate = sendDate;
    }

    public Short getAttempts() {
        return attempts;
    }

    public void setAttempts(Short attempts) {
        this.attempts = attempts;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public Short getUsage() {
        return usage;
    }

    public void setUsage(Short usage) {
        this.usage = usage;
    }

    public Short getStatus() {
        return status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }
}