package com.ujcms.cms.core.domain.base;

import io.swagger.v3.oas.annotations.media.Schema;
import java.io.Serializable;
import java.time.OffsetDateTime;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;
import org.springframework.lang.Nullable;

/**
 * This class was generated by MyBatis Generator.
 *
 * @author MyBatis Generator
 */
public class MessageBoardBase implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 数据库表名
     */
    public static final String TABLE_NAME = "message_board";

    /**
     * 留言ID
     */
    @NotNull
    @Schema(description="留言ID")
    private Integer id = 0;

    /**
     * 站点ID
     */
    @NotNull
    @Schema(description="站点ID")
    private Integer siteId = 0;

    /**
     * 留言用户
     */
    @NotNull
    @Schema(description="留言用户")
    private Integer userId = 0;

    /**
     * 回复用户
     */
    @Nullable
    @Schema(description="回复用户")
    private Integer replyUserId;

    /**
     * 类型
     */
    @NotNull
    @Schema(description="类型")
    private Integer typeId = 0;

    /**
     * 留言标题
     */
    @Length(max = 150)
    @NotNull
    @Schema(description="留言标题")
    private String title = "";

    /**
     * 创建日期
     */
    @NotNull
    @Schema(description="创建日期")
    private OffsetDateTime created = OffsetDateTime.now();

    /**
     * 回复日期
     */
    @Nullable
    @Schema(description="回复日期")
    private OffsetDateTime replyDate;

    /**
     * 事发地点
     */
    @Length(max = 150)
    @Nullable
    @Schema(description="事发地点")
    private String place;

    /**
     * 联系人
     */
    @Length(max = 30)
    @Nullable
    @Schema(description="联系人")
    private String contact;

    /**
     * 昵称
     */
    @Length(max = 30)
    @Nullable
    @Schema(description="昵称")
    private String nickname;

    /**
     * 电话号码
     */
    @Length(max = 50)
    @Nullable
    @Schema(description="电话号码")
    private String phone;

    /**
     * 电子邮箱
     */
    @Length(max = 50)
    @Nullable
    @Schema(description="电子邮箱")
    private String email;

    /**
     * 联系地址
     */
    @Length(max = 150)
    @Nullable
    @Schema(description="联系地址")
    private String address;

    /**
     * 职业
     */
    @Length(max = 50)
    @Nullable
    @Schema(description="职业")
    private String profession;

    /**
     * 用户类型(1:个人,2:法人)
     */
    @NotNull
    @Schema(description="用户类型(1:个人,2:法人)")
    private Short userType = 1;

    /**
     * 是否公开
     */
    @NotNull
    @Schema(description="是否公开")
    private Boolean open = true;

    /**
     * IP地址
     */
    @Length(max = 45)
    @NotNull
    @Schema(description="IP地址")
    private String ip = "";

    /**
     * 是否回复
     */
    @NotNull
    @Schema(description="是否回复")
    private Boolean replied = false;

    /**
     * 是否推荐
     */
    @NotNull
    @Schema(description="是否推荐")
    private Boolean recommended = false;

    /**
     * 状态(0:已审核,1:未审核,2:已屏蔽)
     */
    @NotNull
    @Schema(description="状态(0:已审核,1:未审核,2:已屏蔽)")
    private Short status = 1;

    /**
     * 留言内容
     */
    @Nullable
    @Schema(description="留言内容")
    private String text;

    /**
     * 回复内容
     */
    @Nullable
    @Schema(description="回复内容")
    private String replyText;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSiteId() {
        return siteId;
    }

    public void setSiteId(Integer siteId) {
        this.siteId = siteId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    @Nullable
    public Integer getReplyUserId() {
        return replyUserId;
    }

    public void setReplyUserId(@Nullable Integer replyUserId) {
        this.replyUserId = replyUserId;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public OffsetDateTime getCreated() {
        return created;
    }

    public void setCreated(OffsetDateTime created) {
        this.created = created;
    }

    @Nullable
    public OffsetDateTime getReplyDate() {
        return replyDate;
    }

    public void setReplyDate(@Nullable OffsetDateTime replyDate) {
        this.replyDate = replyDate;
    }

    @Nullable
    public String getPlace() {
        return place;
    }

    public void setPlace(@Nullable String place) {
        this.place = place;
    }

    @Nullable
    public String getContact() {
        return contact;
    }

    public void setContact(@Nullable String contact) {
        this.contact = contact;
    }

    @Nullable
    public String getNickname() {
        return nickname;
    }

    public void setNickname(@Nullable String nickname) {
        this.nickname = nickname;
    }

    @Nullable
    public String getPhone() {
        return phone;
    }

    public void setPhone(@Nullable String phone) {
        this.phone = phone;
    }

    @Nullable
    public String getEmail() {
        return email;
    }

    public void setEmail(@Nullable String email) {
        this.email = email;
    }

    @Nullable
    public String getAddress() {
        return address;
    }

    public void setAddress(@Nullable String address) {
        this.address = address;
    }

    @Nullable
    public String getProfession() {
        return profession;
    }

    public void setProfession(@Nullable String profession) {
        this.profession = profession;
    }

    public Short getUserType() {
        return userType;
    }

    public void setUserType(Short userType) {
        this.userType = userType;
    }

    public Boolean getOpen() {
        return open;
    }

    public void setOpen(Boolean open) {
        this.open = open;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public Boolean getReplied() {
        return replied;
    }

    public void setReplied(Boolean replied) {
        this.replied = replied;
    }

    public Boolean getRecommended() {
        return recommended;
    }

    public void setRecommended(Boolean recommended) {
        this.recommended = recommended;
    }

    public Short getStatus() {
        return status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    @Nullable
    public String getText() {
        return text;
    }

    public void setText(@Nullable String text) {
        this.text = text;
    }

    @Nullable
    public String getReplyText() {
        return replyText;
    }

    public void setReplyText(@Nullable String replyText) {
        this.replyText = replyText;
    }
}