CREATE TABLE ujcms_article
(
    id_               int        NOT NULL COMMENT '文章ID',
    site_id_          int        NOT NULL COMMENT '站点ID',
    org_id_           int        NOT NULL COMMENT '组织ID',
    channel_id_       int        NOT NULL COMMENT '栏目ID',
    user_id_          int        NOT NULL COMMENT '创建用户ID',
    modified_user_id_ int        NULL     DEFAULT NULL COMMENT '修改用户ID',
    publish_date_     datetime   NOT NULL COMMENT '发布日期',
    with_image_       tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有图片',
    sticky_           tinyint    NOT NULL DEFAULT 0 COMMENT '置顶',
    status_           tinyint    NOT NULL DEFAULT 0 COMMENT '状态(0:正常)',
    PRIMARY KEY (id_),
    INDEX idx_aritcle_channel (channel_id_),
    INDEX idx_article_website (site_id_),
    INDEX idx_article_user_modified (modified_user_id_),
    INDEX idx_article_user (user_id_),
    INDEX idx_article_org (org_id_),
    INDEX idx_article_publish_date (publish_date_)
) COMMENT = '文章表';

CREATE TABLE ujcms_article_buffer
(
    id_            int    NOT NULL COMMENT '文章ID',
    comments_      int    NOT NULL DEFAULT 0 COMMENT '评论次数',
    downloads_     int    NOT NULL DEFAULT 0 COMMENT '下载次数',
    favorites_     int    NOT NULL DEFAULT 0 COMMENT '收藏次数',
    ups_           int    NOT NULL DEFAULT 0 COMMENT '顶',
    downs_         int    NOT NULL DEFAULT 0 COMMENT '踩',
    views_         bigint NOT NULL DEFAULT 0 COMMENT '浏览次数',
    day_views_     int    NOT NULL DEFAULT 0 COMMENT '日浏览次数',
    week_views_    int    NOT NULL DEFAULT 0 COMMENT '周浏览次数',
    month_views_   int    NOT NULL DEFAULT 0 COMMENT '月浏览次数',
    quarter_views_ int    NOT NULL DEFAULT 0 COMMENT '季浏览次数',
    year_views_    bigint NOT NULL DEFAULT 0 COMMENT '年浏览次数',
    stat_day_      int    NOT NULL DEFAULT 0 COMMENT '统计日',
    PRIMARY KEY (id_)
) COMMENT = '文章缓冲表';

CREATE TABLE ujcms_article_custom
(
    article_id_ int         NOT NULL COMMENT '文章ID',
    name_       varchar(50) NOT NULL COMMENT '名称',
    value_      mediumtext  NULL COMMENT '值',
    INDEX idx_articlecustom_article (article_id_)
) COMMENT = '文章自定义表';

CREATE TABLE ujcms_article_ext
(
    id_                 int           NOT NULL COMMENT '文章ID',
    title_              varchar(150)  NOT NULL COMMENT '标题',
    subtitle_           varchar(150)  NULL COMMENT '副标题',
    full_title_         varchar(150)  NULL COMMENT '完整标题',
    alias_              varchar(150)  NULL     DEFAULT NULL COMMENT '别名',
    link_url_           varchar(255)  NULL     DEFAULT NULL COMMENT '转向链接地址',
    target_blank_       tinyint(1)    NOT NULL DEFAULT 0 COMMENT '是否新窗口打开',
    seo_keywords_       varchar(150)  NULL     DEFAULT NULL COMMENT 'SEO关键词',
    seo_description_    varchar(1000) NULL     DEFAULT NULL COMMENT '摘要',
    author_             varchar(50)   NULL     DEFAULT NULL COMMENT '作者',
    editor_             varchar(50)   NULL COMMENT '编辑',
    source_             varchar(50)   NULL     DEFAULT NULL COMMENT '来源',
    offline_date_       datetime      NULL     DEFAULT NULL COMMENT '下线日期',
    sticky_date_        datetime      NULL     DEFAULT NULL COMMENT '置顶时间',
    image_              varchar(255)  NULL     DEFAULT NULL COMMENT '图片',
    video_              varchar(255)  NULL     DEFAULT NULL COMMENT '视频',
    video_time_         varchar(10)   NULL     DEFAULT NULL COMMENT '视频时长',
    file_               varchar(255)  NULL COMMENT '文件',
    file_name_          varchar(100)  NULL COMMENT '文件名称',
    file_length_        bigint        NULL COMMENT '文件大小',
    doc_                varchar(255)  NULL     DEFAULT NULL COMMENT '文库',
    doc_name_           varchar(100)  NULL     DEFAULT NULL COMMENT '文库名称',
    doc_length_         bigint        NULL     DEFAULT NULL COMMENT '文库大小',
    article_template_   varchar(255)  NULL     DEFAULT NULL COMMENT '独立模板',
    allow_comment_      tinyint(1)    NOT NULL DEFAULT 1 COMMENT '是否允许评论',
    static_file_        varchar(255)  NULL     DEFAULT NULL COMMENT '静态页文件',
    mobile_static_file_ varchar(255)  NULL     DEFAULT NULL COMMENT '手机端静态页文件',
    created_            datetime      NOT NULL COMMENT '创建日期',
    modified_           datetime      NULL     DEFAULT NULL COMMENT '修改日期',
    text_               mediumtext    NULL COMMENT '正文',
    PRIMARY KEY (id_)
) COMMENT = '文章扩展表';

CREATE TABLE ujcms_article_file
(
    article_id_ int          NOT NULL COMMENT '文章ID',
    name_       varchar(100) NOT NULL COMMENT '文件名称',
    url_        varchar(255) NOT NULL COMMENT '文件URL',
    length_     bigint       NOT NULL DEFAULT 0 COMMENT '文件大小',
    order_      smallint     NOT NULL DEFAULT 32767 COMMENT '排序',
    INDEX idx_articlefile_article (article_id_)
) COMMENT = '文章附件集表';

CREATE TABLE ujcms_article_image
(
    article_id_  int           NOT NULL COMMENT '文章ID',
    url_         varchar(255)  NOT NULL COMMENT '图片URL',
    description_ varchar(2000) NOT NULL COMMENT '图片描述',
    order_       smallint      NOT NULL DEFAULT 32767 COMMENT '排序',
    INDEX idx_articleimage_article (article_id_)
) COMMENT = '文章图片集表';

CREATE TABLE ujcms_article_stat
(
    article_id_ int NOT NULL COMMENT '文章ID',
    stat_day_   int NOT NULL DEFAULT 0 COMMENT '统计日',
    views_      int NOT NULL DEFAULT 0 COMMENT '浏览次数',
    INDEX idx_articlestat_article (article_id_)
);

CREATE TABLE ujcms_article_tag
(
    article_id_ int      NOT NULL COMMENT '文章ID',
    tag_id_     int      NOT NULL COMMENT 'TagID',
    order_      smallint NULL COMMENT '排序',
    PRIMARY KEY (article_id_, tag_id_),
    INDEX idx_articletag_tag (tag_id_)
) COMMENT = '文章与Tag关联表';

CREATE TABLE ujcms_attachment
(
    id_      int          NOT NULL COMMENT '附件ID',
    site_id_ int          NOT NULL COMMENT '站点ID',
    user_id_ int          NOT NULL COMMENT '用户ID',
    name_    varchar(100) NOT NULL COMMENT '文件名称',
    path_    varchar(100) NOT NULL COMMENT '存储路径',
    url_     varchar(100) NOT NULL COMMENT '访问路径',
    length_  bigint       NOT NULL COMMENT '文件长度',
    created_ datetime     NOT NULL COMMENT '创建时间',
    used_    tinyint(1)   NOT NULL DEFAULT 0 COMMENT '是否使用',
    PRIMARY KEY (id_),
    UNIQUE INDEX uk_attachment_url (url_),
    INDEX idx_attachment_site (site_id_),
    INDEX idx_attachment_user (user_id_)
) COMMENT = '附件表';

CREATE TABLE ujcms_attachment_refer
(
    attachment_id_ int         NOT NULL COMMENT '附件ID',
    refer_type_    varchar(20) NOT NULL COMMENT '引用类型',
    refer_id_      int         NOT NULL COMMENT '引用ID',
    PRIMARY KEY (attachment_id_, refer_type_, refer_id_),
    INDEX idx_attachmentrefer_type_id (refer_type_, refer_id_)
);

CREATE TABLE ujcms_block
(
    id_                  int         NOT NULL COMMENT '区块ID',
    site_id_             int         NOT NULL COMMENT '站点ID',
    name_                varchar(50) NOT NULL COMMENT '名称',
    alias_               varchar(50) NOT NULL COMMENT '别名',
    scope_               tinyint     NOT NULL DEFAULT 0 COMMENT '共享范围(0:本站私有,1:子站点共享,2:全局共享)',
    with_description_    tinyint(1)  NOT NULL DEFAULT 0 COMMENT '是否有摘要',
    with_image_          tinyint(1)  NOT NULL DEFAULT 0 COMMENT '是否有图片',
    image_width_         int         NOT NULL DEFAULT 300 COMMENT '图片宽度',
    image_height_        int         NOT NULL DEFAULT 200 COMMENT '图片高度',
    with_mobile_image_   tinyint(1)  NOT NULL COMMENT '是否有手机端图片',
    mobile_image_width_  int         NOT NULL DEFAULT 300 COMMENT '手机端图片宽度',
    mobile_image_height_ int         NOT NULL DEFAULT 200 COMMENT '手机端图片高度',
    enabled_             tinyint(1)  NOT NULL DEFAULT 1 COMMENT '是否启用',
    order_               smallint    NOT NULL DEFAULT 32767 COMMENT '排序',
    PRIMARY KEY (id_),
    INDEX idx_block_site (site_id_)
) COMMENT = '区块表';

CREATE TABLE ujcms_block_item
(
    id_           int           NOT NULL COMMENT '区块项ID',
    site_id_      int           NOT NULL COMMENT '站点ID',
    block_id_     int           NOT NULL COMMENT '区块ID',
    article_id_   int           NULL COMMENT '文章ID',
    title_        varchar(150)  NULL COMMENT '标题',
    description_  varchar(1000) NULL COMMENT '描述',
    link_url_     varchar(255)  NULL COMMENT '链接',
    image_        varchar(255)  NULL COMMENT '图片',
    mobile_image_ varchar(255)  NULL COMMENT '手机端图片',
    enabled_      tinyint(1)    NOT NULL DEFAULT 1 COMMENT '是否启用',
    order_        smallint      NOT NULL DEFAULT 32767 COMMENT '排序',
    PRIMARY KEY (id_),
    INDEX idx_blockitem_block (block_id_),
    INDEX idx_blockitem_site (site_id_),
    UNIQUE INDEX uk_blockitem_block_article (article_id_, block_id_)
) COMMENT = '区块条目表';

CREATE TABLE ujcms_channel
(
    id_               int         NOT NULL COMMENT '栏目ID',
    site_id_          int         NOT NULL COMMENT '站点ID',
    parent_id_        int         NULL     DEFAULT NULL COMMENT '上级栏目ID',
    channel_model_id_ int         NOT NULL COMMENT '栏目模型ID',
    article_model_id_ int         NOT NULL COMMENT '文章模型ID',
    name_             varchar(50) NOT NULL COMMENT '名称',
    alias_            varchar(50) NOT NULL COMMENT '别名',
    nav_              tinyint(1)  NOT NULL DEFAULT 1 COMMENT '是否导航菜单',
    type_             tinyint     NOT NULL DEFAULT 1 COMMENT '类型(1:常规栏目,2:单页栏目,3:转向链接,4:链接到第一篇文章,5:链接到第一个子栏目)',
    depth_            smallint    NOT NULL DEFAULT 1 COMMENT '层级',
    order_            smallint    NOT NULL DEFAULT 32767 COMMENT '排列顺序',
    PRIMARY KEY (id_),
    INDEX idx_channel_model_article (article_model_id_),
    INDEX idx_channel_model_channel (channel_model_id_),
    INDEX idx_channel_parent (parent_id_),
    INDEX idx_channel_site (site_id_),
    UNIQUE INDEX uk_channel_alias_site (alias_, site_id_)
) COMMENT = '栏目表';

CREATE TABLE ujcms_channel_buffer
(
    id_    int    NOT NULL COMMENT '栏目ID',
    views_ bigint NOT NULL DEFAULT 0 COMMENT '浏览次数',
    PRIMARY KEY (id_)
) COMMENT = '栏目缓冲表';

CREATE TABLE ujcms_channel_custom
(
    channel_id_ int         NOT NULL COMMENT '文章ID',
    name_       varchar(50) NOT NULL COMMENT '名称',
    value_      mediumtext  NULL COMMENT '值',
    INDEX idx_channelcustom_channel (channel_id_)
) COMMENT = '栏目自定义表';

CREATE TABLE ujcms_channel_ext
(
    id_                 int           NOT NULL COMMENT '栏目ID',
    seo_title_          varchar(150)  NULL COMMENT 'SEO标题',
    seo_keywords_       varchar(150)  NULL     DEFAULT NULL COMMENT 'SEO关键词',
    seo_description_    varchar(1000) NULL     DEFAULT NULL COMMENT 'SEO描述',
    article_template_   varchar(255)  NULL     DEFAULT NULL COMMENT '文章模板',
    channel_template_   varchar(255)  NULL     DEFAULT NULL COMMENT '栏目模板',
    page_size_          smallint      NOT NULL DEFAULT 20 COMMENT '每页条数',
    image_              varchar(255)  NULL     DEFAULT NULL COMMENT '图片',
    link_url_           varchar(255)  NULL     DEFAULT NULL COMMENT '转向链接地址',
    target_blank_       tinyint(1)    NOT NULL DEFAULT 0 COMMENT '是否新窗口打开',
    allow_comment_      tinyint(1)    NOT NULL DEFAULT 1 COMMENT '是否允许评论',
    allow_contribute_   tinyint(1)    NOT NULL DEFAULT 0 COMMENT '是否允许投稿',
    allow_search_       tinyint(1)    NOT NULL DEFAULT 1 COMMENT '是否允许搜索',
    static_file_        varchar(255)  NULL     DEFAULT NULL COMMENT '静态页文件',
    mobile_static_file_ varchar(255)  NULL     DEFAULT NULL COMMENT '手机端静态页文件',
    text_               mediumtext    NULL COMMENT '正文',
    PRIMARY KEY (id_)
) COMMENT = '栏目扩展表';

CREATE TABLE ujcms_channel_group
(
    channel_id_ int NOT NULL COMMENT '栏目ID',
    group_id_   int NOT NULL COMMENT '用户组ID',
    PRIMARY KEY (group_id_, channel_id_),
    INDEX idx_channelgroup_channel (channel_id_)
) COMMENT = '栏目用户组关联表';

CREATE TABLE ujcms_channel_role
(
    channel_id_ int NOT NULL COMMENT '栏目ID',
    role_id_    int NOT NULL COMMENT '角色ID',
    PRIMARY KEY (channel_id_, role_id_),
    INDEX idx_channelrole_role (role_id_)
) COMMENT = '栏目角色关联表';

CREATE TABLE ujcms_channel_tree
(
    ancestor_id_   int NOT NULL COMMENT '祖先ID',
    descendant_id_ int NOT NULL COMMENT '后代ID',
    PRIMARY KEY (ancestor_id_, descendant_id_),
    INDEX idx_channeltree_descendant (descendant_id_)
) COMMENT = '栏目树形闭包表';

CREATE TABLE ujcms_dict
(
    id_        int          NOT NULL COMMENT '字典ID',
    type_id_   int          NOT NULL COMMENT '数据字典类型ID',
    parent_id_ int          NULL     DEFAULT NULL COMMENT '上级ID',
    name_      varchar(50)  NOT NULL COMMENT '名称',
    value_     varchar(50)  NOT NULL COMMENT '值',
    remark_    varchar(255) NULL     DEFAULT NULL COMMENT '备注',
    order_     smallint     NOT NULL DEFAULT 32767 COMMENT '排列顺序',
    enabled_   tinyint(1)   NOT NULL DEFAULT 1 COMMENT '是否启用',
    PRIMARY KEY (id_),
    INDEX idx_dict_dicttype (type_id_),
    INDEX idx_dict_parent (parent_id_)
) COMMENT = '字典表';

CREATE TABLE ujcms_dict_type
(
    id_      int          NOT NULL COMMENT '数据字典类型ID',
    site_id_ int          NOT NULL COMMENT '站点ID',
    name_    varchar(50)  NOT NULL COMMENT '名称',
    alias_   varchar(50)  NOT NULL COMMENT '别名',
    remark_  varchar(255) NULL     DEFAULT NULL COMMENT '备注',
    scope_   tinyint      NOT NULL DEFAULT 0 COMMENT '共享范围(0:本站私有,1:子站点共享,2:全局共享)',
    order_   smallint     NOT NULL DEFAULT 32767 COMMENT '排列顺序',
    sys_     tinyint(1)   NOT NULL DEFAULT 0 COMMENT '是否系统字典',
    PRIMARY KEY (id_),
    INDEX idx_dicttype_site (site_id_)
) COMMENT = '数据字典类型';

CREATE TABLE ujcms_global
(
    id_                int           NOT NULL COMMENT 'ID',
    context_path_      varchar(50)   NULL COMMENT '上下文路径',
    port_              int           NULL COMMENT '端口号',
    default_site_id_   int           NOT NULL COMMENT '默认站点ID',
    channel_url_       varchar(50)   NULL COMMENT '栏目URL地址',
    article_url_       varchar(50)   NULL COMMENT '文章URL地址',
    upload_settings_   varchar(1000) NULL DEFAULT NULL COMMENT '上传设置',
    register_settings_ varchar(1000) NULL COMMENT '注册设置',
    email_settings_    varchar(1000) NULL COMMENT '邮件设置',
    customs_settings_  mediumtext    NULL COMMENT '自定义设置',
    PRIMARY KEY (id_)
) COMMENT = '全局配置表';

CREATE TABLE ujcms_group
(
    id_          int          NOT NULL COMMENT '用户组ID',
    name_        varchar(50)  NOT NULL COMMENT '名称',
    description_ varchar(255) NULL     DEFAULT NULL COMMENT '描述',
    type_        tinyint      NOT NULL DEFAULT 2 COMMENT '类型(1:系统,2:常规,3:IP组)',
    order_       smallint     NOT NULL DEFAULT 32767 COMMENT '排序',
    PRIMARY KEY (id_)
) COMMENT = '用户组表';

CREATE TABLE ujcms_model
(
    id_      int         NOT NULL COMMENT '模型ID',
    site_id_ int         NULL COMMENT '站点ID',
    name_    varchar(50) NOT NULL COMMENT '名称',
    type_    varchar(20) NOT NULL COMMENT '类型(,article:文章,channel:栏目,user:用户,site:站点设置,global:全局设置)',
    scope_   tinyint     NOT NULL DEFAULT 0 COMMENT '共享范围(0:本站私有,1:子站点共享,2:全局共享)',
    order_   smallint    NOT NULL DEFAULT 32767 COMMENT '排列顺序',
    mains_   mediumtext  NULL COMMENT '主字段集',
    asides_  mediumtext  NULL COMMENT '右侧字段集',
    customs_ mediumtext  NULL COMMENT '自定义字段集',
    PRIMARY KEY (id_),
    INDEX idx_model_site (site_id_)
) COMMENT = '模型表';

CREATE TABLE ujcms_org
(
    id_        int          NOT NULL COMMENT '组织ID',
    parent_id_ int          NULL     DEFAULT NULL COMMENT '上级组织ID',
    name_      varchar(50)  NOT NULL COMMENT '名称',
    phone_     varchar(100) NULL     DEFAULT NULL COMMENT '电话',
    address_   varchar(255) NULL     DEFAULT NULL COMMENT '地址',
    contacts_  varchar(100) NULL     DEFAULT NULL COMMENT '联系人',
    depth_     smallint     NOT NULL DEFAULT 1 COMMENT '层级',
    order_     smallint     NOT NULL DEFAULT 32767 COMMENT '排序',
    PRIMARY KEY (id_),
    INDEX idx_org_parent (parent_id_)
) COMMENT = '组织表';

CREATE TABLE ujcms_org_tree
(
    ancestor_id_   int NOT NULL COMMENT '祖先ID',
    descendant_id_ int NOT NULL COMMENT '后代ID',
    PRIMARY KEY (ancestor_id_, descendant_id_),
    INDEX idx_orgtree_descendant (descendant_id_)
) COMMENT = '组织树形结构表';

CREATE TABLE ujcms_push
(
    id_              int      NOT NULL COMMENT '推送ID',
    from_article_id_ int      NOT NULL COMMENT '源文章ID',
    to_article_id_   int      NOT NULL COMMENT '目标文章ID',
    from_site_id_    int      NOT NULL COMMENT '源站点ID',
    to_site_id_      int      NOT NULL COMMENT '目标站点ID',
    user_id_         int      NOT NULL COMMENT '推送用户',
    created_         datetime NOT NULL COMMENT '推送时间',
    type_            tinyint  NOT NULL DEFAULT 1 COMMENT '推送类型(1:复制,2:映射,3:引用)',
    scope_           tinyint  NOT NULL DEFAULT 1 COMMENT '推送范围(1:站内,2:站外)',
    PRIMARY KEY (id_),
    INDEX idx_push_article_from (from_article_id_),
    INDEX idx_push_article_to (to_article_id_),
    INDEX idx_push_site_from (from_site_id_),
    INDEX idx_push_site_to (to_site_id_),
    INDEX idx_push_user (user_id_)
) COMMENT = '推送表';

CREATE TABLE ujcms_role
(
    id_          int          NOT NULL COMMENT '角色ID',
    site_id_     int          NULL     DEFAULT NULL COMMENT '站点ID',
    name_        varchar(50)  NOT NULL COMMENT '名称',
    description_ varchar(255) NULL     DEFAULT NULL COMMENT '描述',
    permission_  mediumtext   NULL COMMENT '功能权限',
    rank_        smallint     NOT NULL DEFAULT 32767 COMMENT '等级',
    order_       smallint     NOT NULL DEFAULT 32767 COMMENT '排序',
    PRIMARY KEY (id_),
    INDEX idx_role_site (site_id_)
) COMMENT = '角色表';

CREATE TABLE ujcms_seq
(
    name_       varchar(50) NOT NULL COMMENT '序列名称(通常为表名)',
    next_val_   bigint      NOT NULL DEFAULT 1 COMMENT '下一个值',
    cache_size_ int         NOT NULL DEFAULT 0 COMMENT '缓存数量(大于0时有效，等于0则由程序确定大小)',
    PRIMARY KEY (name_)
) COMMENT = '主键序列表';

CREATE TABLE ujcms_site
(
    id_                 int           NOT NULL COMMENT '站点ID',
    parent_id_          int           NULL     DEFAULT NULL COMMENT '上级站点ID',
    org_id_             int           NOT NULL COMMENT '组织ID',
    model_id_           int           NULL COMMENT '模型ID',
    storage_id_         int           NULL     DEFAULT NULL COMMENT '附件发布点ID',
    html_storage_id_    int           NULL     DEFAULT NULL COMMENT '静态页发布点ID',
    mobile_storage_id_  int           NULL     DEFAULT NULL COMMENT '手机端静态页发布点ID',
    name_               varchar(50)   NOT NULL COMMENT '名称',
    protocol_           varchar(20)   NOT NULL COMMENT '协议(http,https)',
    domain_             varchar(50)   NOT NULL COMMENT '域名',
    sub_dir_            varchar(50)   NULL COMMENT '子目录',
    theme_              varchar(50)   NOT NULL COMMENT '主题',
    mobile_theme_       varchar(50)   NOT NULL COMMENT '手机端主题',
    page_size_          smallint      NOT NULL DEFAULT 20 COMMENT '每页条数',
    logo_               varchar(255)  NULL     DEFAULT NULL COMMENT 'LOGO',
    seo_title_          varchar(150)  NULL COMMENT 'SEO标题',
    seo_keywords_       varchar(150)  NULL     DEFAULT NULL COMMENT 'SEO关键词',
    seo_description_    varchar(1000) NULL     DEFAULT NULL COMMENT 'SEO描述',
    watermark_settings_ varchar(255)  NULL     DEFAULT NULL COMMENT '水印设置',
    depth_              smallint      NOT NULL DEFAULT 1 COMMENT '层级',
    order_              smallint      NOT NULL DEFAULT 32767 COMMENT '排序',
    status_             tinyint       NOT NULL DEFAULT 0 COMMENT '状态(0:正常,1:关闭)',
    PRIMARY KEY (id_),
    INDEX idx_site_parent (parent_id_),
    INDEX idx_site_org (org_id_)
) COMMENT = '站点表';

CREATE TABLE ujcms_site_buffer
(
    id_    int    NOT NULL COMMENT '站点ID',
    views_ bigint NOT NULL DEFAULT 0 COMMENT '浏览次数',
    PRIMARY KEY (id_)
) COMMENT = '站点缓冲表';

CREATE TABLE ujcms_site_custom
(
    site_id_ int         NOT NULL COMMENT '站点ID',
    name_    varchar(50) NOT NULL COMMENT '名称',
    value_   mediumtext  NULL COMMENT '值',
    INDEX idx_sitecustom_site (site_id_)
) COMMENT = '站点自定义字符串表';

CREATE TABLE ujcms_site_tree
(
    ancestor_id_   int NOT NULL COMMENT '祖先ID',
    descendant_id_ int NOT NULL COMMENT '后代ID',
    PRIMARY KEY (ancestor_id_, descendant_id_),
    INDEX idx_sitetree_descendant (descendant_id_)
) COMMENT = '站点树形结构表';

CREATE TABLE ujcms_storage
(
    id_          int           NOT NULL COMMENT '发布点ID',
    site_id_     int           NULL COMMENT '站点ID',
    name_        varchar(50)   NOT NULL COMMENT '名称',
    description_ varchar(255)  NULL     DEFAULT NULL COMMENT '描述',
    type_        tinyint       NOT NULL COMMENT '类型(1:HTML存储,2:附件存储)',
    mode_        tinyint       NOT NULL DEFAULT 0 COMMENT '存储模式(0:本地服务器,1:FTP,2:MinIO,3:阿里云,4:腾讯云,5:七牛云)',
    scope_       tinyint       NOT NULL DEFAULT 0 COMMENT '共享范围(0:本站私有,1:子站点共享,2:全局共享)',
    path_        varchar(255)  NULL     DEFAULT NULL COMMENT '存储路径',
    url_         varchar(255)  NULL     DEFAULT NULL COMMENT '访问路径',
    attrs_       varchar(1000) NULL     DEFAULT NULL COMMENT '属性集',
    order_       smallint      NOT NULL DEFAULT 32767 COMMENT '排列顺序',
    PRIMARY KEY (id_),
    INDEX idx_storage_site (site_id_)
) COMMENT = '存储点表';

CREATE TABLE ujcms_tag
(
    id_          int           NOT NULL COMMENT 'TagID',
    site_id_     int           NOT NULL COMMENT '站点ID',
    user_id_     int           NOT NULL COMMENT '创建用户ID',
    name_        varchar(50)   NOT NULL COMMENT '名称',
    description_ varchar(1000) NULL COMMENT '描述',
    created_     datetime      NOT NULL COMMENT '创建时间',
    refers_      int           NOT NULL DEFAULT 0 COMMENT '引用数量',
    PRIMARY KEY (id_),
    INDEX idx_tag_site (site_id_),
    INDEX idx_tag_user (user_id_)
) COMMENT = 'Tag标签表';

CREATE TABLE ujcms_user
(
    id_           int          NOT NULL COMMENT '用户ID',
    group_id_     int          NOT NULL COMMENT '用户组ID',
    org_id_       int          NOT NULL COMMENT '组织ID',
    username_     varchar(50)  NOT NULL COMMENT '用户名',
    password_     varchar(128) NOT NULL DEFAULT '0' COMMENT '密码',
    salt_         varchar(32)  NOT NULL DEFAULT '0' COMMENT '密码混淆码',
    email_        varchar(50)  NULL     DEFAULT NULL COMMENT '电子邮箱',
    mobile_       varchar(50)  NULL     DEFAULT NULL COMMENT '手机号码',
    alias_        varchar(50)  NULL     DEFAULT NULL COMMENT '博客地址',
    display_name_ varchar(50)  NULL COMMENT '显示名',
    avatar_       varchar(255) NULL     DEFAULT NULL COMMENT '头像URL',
    rank_         smallint     NOT NULL DEFAULT 999 COMMENT '等级',
    status_       tinyint      NOT NULL DEFAULT 0 COMMENT '状态(0:正常,1:锁定)',
    PRIMARY KEY (id_),
    UNIQUE INDEX uk_username (username_),
    INDEX idx_user_org (org_id_),
    INDEX idx_user_group (group_id_)
) COMMENT = '用户表';

CREATE TABLE ujcms_user_ext
(
    id_          int           NOT NULL COMMENT '用户ID',
    real_name_   varchar(50)   NULL     DEFAULT NULL COMMENT '真实姓名',
    gender_      char(1)       NOT NULL DEFAULT 'm' COMMENT '性别(m:男,f:女,n:保密)',
    birthday_    datetime      NULL     DEFAULT NULL COMMENT '出生日期',
    location_    varchar(255)  NULL     DEFAULT NULL COMMENT '居住地',
    bio_         varchar(2000) NULL     DEFAULT NULL COMMENT '自我介绍',
    created_     datetime      NOT NULL COMMENT '创建日期',
    login_date_  datetime      NOT NULL COMMENT '最后登录日期',
    login_ip_    varchar(39)   NOT NULL DEFAULT 'localhost' COMMENT '最后登录IP',
    login_count_ int           NOT NULL DEFAULT 0 COMMENT '登录次数',
    error_date_  datetime      NOT NULL COMMENT '登录错误日期',
    error_count_ int           NOT NULL DEFAULT 0 COMMENT '登录错误次数',
    PRIMARY KEY (id_)
) COMMENT = '用户扩展表';

CREATE TABLE ujcms_user_openid
(
    user_id_          int          NOT NULL COMMENT '用户ID',
    provider_         varchar(20)  NOT NULL COMMENT '提供商',
    openid_           varchar(50)  NOT NULL COMMENT 'OPEN ID',
    unionid_          varchar(50)  NULL     DEFAULT NULL COMMENT '微信统一ID',
    display_name_     varchar(50)  NULL     DEFAULT NULL COMMENT '显示名',
    gender_           char(1)      NOT NULL DEFAULT 'm' COMMENT '性别(m:男,f:女,n:保密)',
    avatar_url_       varchar(255) NULL     DEFAULT NULL COMMENT '头像URL',
    large_avatar_url_ varchar(255) NULL     DEFAULT NULL COMMENT '大头像URL',
    PRIMARY KEY (user_id_, provider_)
) COMMENT = '用户OpenID表';

CREATE TABLE ujcms_user_role
(
    user_id_ int      NOT NULL COMMENT '用户ID',
    role_id_ int      NOT NULL COMMENT '角色ID',
    order_   smallint NOT NULL DEFAULT 9999 COMMENT '角色排序',
    PRIMARY KEY (user_id_, role_id_),
    INDEX idx_userrole_role (role_id_)
) COMMENT = '用户角色关联表';

INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (3,1,1,8,1,1,'2021-06-27 14:34:35',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (4,1,1,9,1,1,'2021-06-28 08:00:21',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (5,1,1,9,1,1,'2021-07-05 03:14:29',0,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (6,1,1,8,1,1,'2021-07-05 07:04:27',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (7,1,1,8,1,1,'2021-08-14 14:12:18',0,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (8,1,1,8,1,1,'2021-08-14 14:12:34',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (9,1,1,8,1,1,'2021-08-14 14:12:48',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (10,1,1,8,1,1,'2021-08-14 14:12:58',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (11,1,1,8,1,1,'2021-08-14 14:13:07',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (12,1,1,8,1,1,'2021-08-14 14:13:20',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (13,1,1,8,1,1,'2021-08-14 14:13:31',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (14,1,1,8,1,1,'2021-08-14 14:13:31',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (15,1,1,8,1,1,'2021-08-14 14:13:53',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (22,1,1,8,1,1,'2021-09-06 06:48:03',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (23,1,1,8,1,1,'2021-09-11 06:26:12',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (24,1,1,9,1,1,'2021-11-04 23:28:40',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (25,1,1,36,1,1,'2021-11-08 19:06:21',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (26,1,1,28,1,1,'2021-11-10 11:24:27',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (27,1,1,29,1,1,'2021-11-10 11:25:57',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (28,1,1,30,1,1,'2021-11-10 12:03:07',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (29,1,1,29,1,1,'2021-11-10 12:09:27',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (30,1,1,29,1,1,'2021-11-10 12:13:33',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (31,1,1,37,1,1,'2021-11-11 10:58:05',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (32,1,1,36,1,1,'2021-11-11 10:59:41',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (33,1,1,36,1,1,'2021-11-11 11:00:36',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (34,1,1,36,1,1,'2021-11-11 11:01:21',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (35,1,1,36,1,1,'2021-11-11 11:03:05',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (36,1,1,37,1,1,'2021-11-11 11:04:00',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (37,1,1,27,1,1,'2021-11-12 18:13:00',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (38,1,1,25,1,1,'2021-11-12 18:19:18',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (39,1,1,25,1,1,'2021-11-12 18:27:30',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (40,1,1,25,1,1,'2021-11-12 18:30:02',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (41,1,1,25,1,1,'2021-11-12 18:32:07',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (42,1,1,26,1,1,'2021-11-12 18:33:55',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (43,1,1,31,1,1,'2021-11-14 17:56:12',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (44,1,1,31,1,1,'2021-11-14 18:11:06',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (45,1,1,31,1,1,'2021-11-14 18:15:37',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (46,1,1,32,1,1,'2021-11-14 18:31:45',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (47,1,1,32,1,1,'2021-11-14 21:25:33',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (48,1,1,33,1,1,'2021-11-14 21:36:32',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (49,1,1,33,1,1,'2021-11-14 21:37:50',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (50,1,1,33,1,1,'2021-11-14 21:39:09',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (51,1,1,33,1,1,'2021-11-14 21:40:41',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (52,1,1,33,1,1,'2021-11-14 21:42:07',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (53,1,1,34,1,1,'2021-11-14 22:17:20',1,0,0);
INSERT INTO ujcms_article (id_, site_id_, org_id_, channel_id_, user_id_, modified_user_id_, publish_date_, with_image_, sticky_, status_) VALUES (54,1,1,35,1,1,'2021-11-15 21:15:41',1,0,0);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (3,0,0,0,0,0,13,5,16,16,16,16,18948);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (4,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (5,0,0,0,0,0,4,1,5,5,5,5,18997);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (6,0,0,0,0,0,6,3,5,5,5,5,18947);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (7,0,0,0,0,0,5,5,4,4,4,4,18947);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (8,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (9,0,0,0,0,0,5,1,6,6,6,6,18951);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (10,0,0,0,0,0,1,1,0,0,0,0,18951);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (11,0,0,0,0,0,1,1,0,0,0,0,18936);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (12,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (13,0,0,0,0,0,10,1,1,1,1,1,18997);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (14,0,0,0,0,0,20,1,14,14,14,14,18997);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (15,0,0,0,0,0,10,2,9,9,9,9,18997);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (22,0,0,0,10,6,49,4,13,13,13,13,18997);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (23,0,0,0,0,0,25,2,13,13,13,13,18997);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (24,0,0,0,0,0,114,16,204,204,204,204,18952);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (25,0,0,0,0,0,2,2,2,2,2,2,18947);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (26,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (27,0,0,0,0,0,2,1,1,1,1,1,18952);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (28,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (29,0,0,0,0,0,2,1,1,1,1,1,18952);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (30,0,1,0,1,1,24,5,41,41,44,44,18952);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (31,0,0,0,0,0,1,1,0,0,0,0,18951);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (32,0,0,0,0,0,1,1,0,0,0,0,18949);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (33,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (34,0,0,0,0,0,4,4,3,3,3,3,18949);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (35,0,0,0,0,0,3,2,2,2,2,2,18949);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (36,0,0,0,0,0,10,2,16,16,16,16,18952);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (37,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (38,0,0,0,0,0,1,1,0,0,0,0,18949);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (39,0,0,0,0,0,5,5,4,4,4,4,18949);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (40,0,0,0,0,0,14,1,24,24,24,24,18952);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (41,0,0,0,0,0,8,2,9,9,9,9,18997);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (42,0,0,0,0,0,8,3,11,11,11,11,18952);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (43,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (44,0,0,0,0,0,1,1,0,0,0,0,18952);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (45,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (46,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (47,0,0,0,0,0,3,3,2,2,2,2,18949);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (48,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (49,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (50,0,0,0,0,0,2,2,1,1,1,1,18949);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (51,0,0,0,0,0,5,1,7,7,7,7,18952);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (52,0,0,0,0,0,25,3,45,45,45,45,18952);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (53,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO ujcms_article_buffer (id_, comments_, downloads_, favorites_, ups_, downs_, views_, day_views_, week_views_, month_views_, quarter_views_, year_views_, stat_day_) VALUES (54,0,0,0,0,0,21,2,38,38,38,38,18952);
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (34,'area','欧洲');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (34,'type','悲剧');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (33,'area','美国');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (33,'type','爱情');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (31,'area','日本');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (31,'type','喜剧');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (25,'area','美国');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (25,'type','动作');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (32,'area','华语');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (32,'type','爱情');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (30,'license','免费软件');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (30,'system','win7');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (30,'system','win10');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (30,'system','linux');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (30,'system','unix');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (30,'system','mac');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (30,'star','★★★★★');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (30,'language','英文');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (30,'type','国外软件');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (29,'license','免费软件');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (29,'system','win7');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (29,'system','win10');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (29,'star','★★★★☆');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (29,'language','简体中文');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (29,'type','国产软件');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (28,'license','收费软件');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (28,'system','win7');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (28,'system','win10');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (28,'star','★★★★☆');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (28,'language','简体中文');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (28,'type','国产软件');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (27,'license','免费软件');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (27,'system','win7');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (27,'system','win10');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (27,'system','linux');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (27,'system','mac');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (27,'star','★☆☆☆☆');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (27,'language','简体中文');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (27,'type','国产软件');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (26,'license','免费软件');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (26,'system','win7');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (26,'system','win10');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (26,'star','★★★★☆');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (26,'language','简体中文');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (26,'type','国产软件');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (52,'price','17299');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (52,'guidePrice','17699');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (52,'type','变焦');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (52,'specifications','<table class=\"spec_table\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr class=\"tab_gray01\">\n<td>镜头焦距</td>\n<td class=\"noright\">70-200mm</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>镜头结构</td>\n<td class=\"noright\">13组17片</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>光圈叶片</td>\n<td class=\"noright\">9片（圆形光圈）</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>最小光圈</td>\n<td class=\"noright\">32</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>最近对焦距离</td>\n<td class=\"noright\">约0.7米</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>最大放大倍率</td>\n<td class=\"noright\">约0.23倍(200mm时)</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>驱动系统</td>\n<td class=\"noright\">NANO USM超声波马达</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>手抖动补偿效果</td>\n<td class=\"noright\">5级（基于CIPA测试标准，200mm焦距端，使用EOS R时）</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>滤镜直径</td>\n<td class=\"noright\">77毫米</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>最大直径及长度</td>\n<td class=\"noright\">约&Phi;89.9&times;146毫米</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>重量</td>\n<td class=\"noright\">约1070克(不含三脚架座)</td>\n</tr>\n</tbody>\n</table>');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (52,'mount','RF');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (51,'price','14999');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (51,'guidePrice','15299');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (51,'type','变焦');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (51,'specifications','<table class=\"spec_table\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr class=\"tab_gray01\">\n<td>镜头焦距</td>\n<td class=\"noright\">24-70mm</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>镜头结构</td>\n<td class=\"noright\">15组21片</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>光圈叶片</td>\n<td class=\"noright\">9片（圆形光圈）</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>最小光圈</td>\n<td class=\"noright\">22</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>最近对焦距离</td>\n<td class=\"noright\">广角端：约0.21米，远摄端：约0.38米</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>最大放大倍率</td>\n<td class=\"noright\">约0.24倍（24mm时），约0.3倍（32mm时），约0.22倍（70mm时）</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>驱动系统</td>\n<td class=\"noright\">NANO USM超声波马达</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>手抖动补偿效果</td>\n<td class=\"noright\">5级（基于CIPA测试标准，70mm焦距端，使用EOS R时）</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>滤镜直径</td>\n<td class=\"noright\">82毫米</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>最大直径及长度</td>\n<td class=\"noright\">约&Phi;88.5&times;125.7毫米</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>重量</td>\n<td class=\"noright\">约900克</td>\n</tr>\n</tbody>\n</table>');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (51,'mount','RF');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (50,'price','13999');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (50,'guidePrice','14999');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (50,'type','定焦');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (50,'specifications','<table class=\"spec_table\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr class=\"tab_gray01\">\n<td>镜头焦距</td>\n<td class=\"noright\">50mm</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>镜头结构</td>\n<td class=\"noright\">9组15片</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>光圈叶片</td>\n<td class=\"noright\">10片（圆形光圈）</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>最小光圈</td>\n<td class=\"noright\">16</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>最近对焦距离</td>\n<td class=\"noright\">约0.4米</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>最大放大倍率</td>\n<td class=\"noright\">约0.19倍</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>驱动系统</td>\n<td class=\"noright\">环形USM超声波马达</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>手抖动补偿效果</td>\n<td class=\"noright\">-</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>滤镜直径</td>\n<td class=\"noright\">77毫米</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>最大直径及长度</td>\n<td class=\"noright\">约&Phi;89.8&times;108毫米</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>重量</td>\n<td class=\"noright\">约950克</td>\n</tr>\n</tbody>\n</table>');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (50,'mount','RF');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (49,'price','3299');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (49,'guidePrice','3499');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (49,'type','定焦');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (49,'specifications','<table class=\"spec_table\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr class=\"tab_gray01\">\n<td>镜头焦距</td>\n<td class=\"noright\">35mm</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>镜头结构</td>\n<td class=\"noright\">9组11片</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>光圈叶片</td>\n<td class=\"noright\">9片（圆形光圈）</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>最小光圈</td>\n<td class=\"noright\">22</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>最近对焦距离</td>\n<td class=\"noright\">约0.17米</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>最大放大倍率</td>\n<td class=\"noright\">约0.5倍</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>驱动系统</td>\n<td class=\"noright\">STM +齿轮型单元</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>手抖动补偿效果</td>\n<td class=\"noright\">5级（基于CIPA测试标准，使用EOS R时）</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>滤镜直径</td>\n<td class=\"noright\">52毫米</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>最大直径及长度</td>\n<td class=\"noright\">约&Phi;74.4&times;62.8毫米</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>重量</td>\n<td class=\"noright\">约305克</td>\n</tr>\n</tbody>\n</table>');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (49,'mount','RF');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (48,'price','1299');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (48,'guidePrice','1399');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (48,'type','定焦');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (48,'specifications','<table class=\"spec_table\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr class=\"tab_gray01\">\n<td>镜头焦距</td>\n<td class=\"noright\">50mm</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>镜头结构</td>\n<td class=\"noright\">5组6片</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>光圈叶片</td>\n<td class=\"noright\">7片（圆形光圈）</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>最小光圈</td>\n<td class=\"noright\">22</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>最近对焦距离</td>\n<td class=\"noright\">约0.3米</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>最大放大倍率</td>\n<td class=\"noright\">约0.25倍</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>驱动系统</td>\n<td class=\"noright\">STM + 齿轮型单元</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>手抖动补偿效果</td>\n<td class=\"noright\">-</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>滤镜直径</td>\n<td class=\"noright\">43毫米</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>最大直径及长度</td>\n<td class=\"noright\">约&Phi;69.2&times;40.5毫米（收纳状态）</td>\n</tr>\n<tr class=\"tab_gray01\">\n<td>重量</td>\n<td class=\"noright\">约160克</td>\n</tr>\n</tbody>\n</table>');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (48,'mount','RF');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (47,'price','23800');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (47,'guidePrice','24900');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (47,'type','山地车');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (47,'specifications','<div class=\"specs_text\">下表为最新配置，取代任何打印或PDF格式的信息。规格和价格如有变更，恕不另行通知。</div>\n<div class=\"specs_box spreadmore_shadow\">\n<div class=\"specs_box_table\">\n<table cellspacing=\"0\" cellpadding=\"0\">\n<thead>\n<tr>\n<th colspan=\"2\">FRAME/车架</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>尺寸</td>\n<td>S, M, L</td>\n</tr>\n<tr>\n<td>颜色</td>\n<td>Chameleon Neptune</td>\n</tr>\n<tr>\n<td>车架</td>\n<td>Advanced SL-Grade Composite</td>\n</tr>\n<tr>\n<td>前叉</td>\n<td>RockShox SID SL Select, 100mm, Charger 2 RL damper, 44mm offset, 15x110 Maxle Stealth, remote lockout</td>\n</tr>\n</tbody>\n</table>\n&nbsp;\n<table cellspacing=\"0\" cellpadding=\"0\">\n<thead>\n<tr>\n<th colspan=\"2\">Components/组件</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>车把</td>\n<td>Giant Contact SL XC Flat, 750x31.8</td>\n</tr>\n<tr>\n<td>车首竖杆</td>\n<td>Giant Contact SL</td>\n</tr>\n<tr>\n<td>座垫杆</td>\n<td>Giant Contact Switch, 100mm, 30.9, Shimano remote</td>\n</tr>\n<tr>\n<td>座垫</td>\n<td>Giant Contact SL (neutral)</td>\n</tr>\n</tbody>\n</table>\n&nbsp;\n<table cellspacing=\"0\" cellpadding=\"0\">\n<thead>\n<tr>\n<th colspan=\"2\">Drivetrain/传动系统</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>变速把手</td>\n<td>Shimano Deore XT</td>\n</tr>\n<tr>\n<td>后变速器</td>\n<td>Shimano Deore XT</td>\n</tr>\n<tr>\n<td>刹车</td>\n<td>Shimano Deore XT</td>\n</tr>\n<tr>\n<td>刹车握把</td>\n<td>Shimano Deore XT</td>\n</tr>\n<tr>\n<td>飞轮</td>\n<td>Shimano Deore XT, 10x51</td>\n</tr>\n<tr>\n<td>链条</td>\n<td>KMC X-12</td>\n</tr>\n<tr>\n<td>大齿盘</td>\n<td>Shimano Deore XT, 34t</td>\n</tr>\n<tr>\n<td>中轴</td>\n<td>Shimano, press fit</td>\n</tr>\n</tbody>\n</table>\n&nbsp;\n<table cellspacing=\"0\" cellpadding=\"0\">\n<thead>\n<tr>\n<th colspan=\"2\">Wheels/轮组</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>辐条</td>\n<td>Giant XCR-1 29 WheelSystem</td>\n</tr>\n<tr>\n<td>轮圈</td>\n<td>Giant XCR-1 29 WheelSystem</td>\n</tr>\n<tr>\n<td>花鼓</td>\n<td>Giant XCR-1 29 WheelSystem</td>\n</tr>\n<tr>\n<td>轮胎</td>\n<td>Maxxis Aspen 29x2.25, foldable, TLR, EXO, tubeless</td>\n</tr>\n</tbody>\n</table>\n&nbsp;\n<table cellspacing=\"0\" cellpadding=\"0\">\n<thead>\n<tr>\n<th colspan=\"2\">Other/其它</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>其他</td>\n<td>tubeless prepared</td>\n</tr>\n</tbody>\n</table>\n</div>\n</div>');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (46,'price','42800');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (46,'guidePrice','45600');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (46,'type','公路车');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (46,'specifications','<div class=\"specs_text\">下表为最新配置，取代任何打印或PDF格式的信息。规格和价格如有变更，恕不另行通知。</div>\n<div class=\"specs_text\">&nbsp;</div>\n<div class=\"specs_box spreadmore_shadow\">\n<div class=\"specs_box_table\">\n<table cellspacing=\"0\" cellpadding=\"0\">\n<thead>\n<tr>\n<th colspan=\"2\">FRAME/车架</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>车架</td>\n<td>Advanced SL-Grade Composite, Integrated Seatpost</td>\n</tr>\n<tr>\n<td>前叉</td>\n<td>Advanced SL-Grade Composite, Full-Composite OverDrive 2 Steerer</td>\n</tr>\n</tbody>\n</table>\n&nbsp;\n<table cellspacing=\"0\" cellpadding=\"0\">\n<thead>\n<tr>\n<th colspan=\"2\">Components/组件</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>车把</td>\n<td>New Giant Contact SLR</td>\n</tr>\n<tr>\n<td>车首竖杆</td>\n<td>New Giant Contact SLR</td>\n</tr>\n<tr>\n<td>座垫杆</td>\n<td>Advanced SL-Grade Composite, Integrated Design</td>\n</tr>\n<tr>\n<td>座垫</td>\n<td>Giant Fleet SLR</td>\n</tr>\n</tbody>\n</table>\n&nbsp;\n<table cellspacing=\"0\" cellpadding=\"0\">\n<thead>\n<tr>\n<th colspan=\"2\">Drivetrain/传动系统</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>前变速器</td>\n<td>SRAM RED eTap AXS</td>\n</tr>\n<tr>\n<td>前变速器</td>\n<td>SRAM RED eTap AXS</td>\n</tr>\n<tr>\n<td>后变速器</td>\n<td>SRAM RED eTap AXS</td>\n</tr>\n<tr>\n<td>刹车</td>\n<td>SRAM RED eTap AXS HRD (hydraulic road disc)</td>\n</tr>\n<tr>\n<td>飞轮</td>\n<td>SRAM RED, 12-speed, 10x28</td>\n</tr>\n<tr>\n<td>链条</td>\n<td>SRAM RED D1, 12-speed</td>\n</tr>\n<tr>\n<td>大齿盘</td>\n<td>SRAM RED D1 DUB , 35/48 with integrated Quaq Dzero Power Meter</td>\n</tr>\n<tr>\n<td>中轴</td>\n<td>SRAM DUB, Press Fit</td>\n</tr>\n</tbody>\n</table>\n&nbsp;\n<table cellspacing=\"0\" cellpadding=\"0\">\n<thead>\n<tr>\n<th colspan=\"2\">Wheels/轮组</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>轮胎</td>\n<td>Cadex Road Race Tubeless, 700x28mm (25c),170 TPI, Folding</td>\n</tr>\n<tr>\n<td>轮圈</td>\n<td>Cadex L1, 42mm Disc Wheel Hookless + Carbon spoke System with GIANT patented DBL (Dynamic Balanced Lacing) technology</td>\n</tr>\n</tbody>\n</table>\n&nbsp;\n<table cellspacing=\"0\" cellpadding=\"0\">\n<thead>\n<tr>\n<th colspan=\"2\">Other/其它</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>其他</td>\n<td>Computer Mount with Giant, Garmin, Wahoo tray</td>\n</tr>\n</tbody>\n</table>\n</div>\n</div>');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (45,'price','18388');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (45,'screen','6.5英寸以上');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (45,'guidePrice','18499');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (45,'storage','1TB');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (45,'specifications','<div class=\"Ptable\">\n<div class=\"Ptable-item\">\n<h3>主体</h3>\n<dl class=\"clearfix\">\n<dt>型号</dt>\n<dd>MVVJ2CH/A</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>认证型号</dt>\n<dd class=\"Ptable-tips\"></dd>\n<dd>A2141</dd>\n</dl>\n</div>\n<div class=\"Ptable-item\">\n<h3>机器规格</h3>\n<dl class=\"clearfix\">\n<dt>产品尺寸（mm）</dt>\n<dd>35.79cmX24.59cmX1.62cm</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>产品净重</dt>\n<dd>2kg</dd>\n</dl>\n</div>\n<div class=\"Ptable-item\">\n<h3>内存</h3>\n<dl class=\"clearfix\">\n<dt>内存类型</dt>\n<dd class=\"Ptable-tips\"></dd>\n<dd>其他</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>最大支持容量</dt>\n<dd>其他</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>内存频率</dt>\n<dd>其他</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>插槽数量</dt>\n<dd>其他</dd>\n</dl>\n</div>\n<div class=\"Ptable-item\">\n<h3>音效系统</h3>\n<dl class=\"clearfix\">\n<dt>内置麦克风</dt>\n<dd>内置麦克风</dd>\n</dl>\n</div>\n<div class=\"Ptable-item\">\n<h3>端口</h3>\n<dl class=\"clearfix\">\n<dt>显示端口</dt>\n<dd>其他</dd>\n</dl>\n</div>\n<div class=\"Ptable-item\">\n<h3>处理器</h3>\n<dl class=\"clearfix\">\n<dt>处理器加速频率</dt>\n<dd>其他</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>核心数</dt>\n<dd>六核</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>处理器基准频率</dt>\n<dd>其他</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>线程数</dt>\n<dd>其他</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>CPU集成显卡</dt>\n<dd>其他</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>CPU型号</dt>\n<dd>其他</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>CPU类型</dt>\n<dd>第九代智能英特尔酷睿i7处理器</dd>\n</dl>\n</div>\n<div class=\"Ptable-item\">\n<h3>显卡</h3>\n<dl class=\"clearfix\">\n<dt>显存容量</dt>\n<dd>其他</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>显存位宽</dt>\n<dd>其他</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>显存类型</dt>\n<dd>其他</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>类型</dt>\n<dd>独立显卡</dd>\n</dl>\n</div>\n<div class=\"Ptable-item\">\n<h3>硬盘</h3>\n<dl class=\"clearfix\">\n<dt>M.2接口数量</dt>\n<dd>其他</dd>\n</dl>\n</div>\n<div class=\"Ptable-item\">\n<h3>网络传输</h3>\n<dl class=\"clearfix\">\n<dt>局域网</dt>\n<dd>其他</dd>\n</dl>\n</div>\n<div class=\"Ptable-item\">\n<h3>其它设备</h3>\n<dl class=\"clearfix\">\n<dt>摄像头</dt>\n<dd>有摄像头</dd>\n</dl>\n</div>\n<div class=\"Ptable-item\">\n<h3>电源</h3>\n<dl class=\"clearfix\">\n<dt>电池容量</dt>\n<dd>100Wh</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>电源适配器</dt>\n<dd>其他</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>理论续航时间</dt>\n<dd>5-8小时, 具体时间视使用环境而定</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>电池芯数</dt>\n<dd>其他</dd>\n</dl>\n</div>\n<div class=\"Ptable-item\">\n<h3>输入设备</h3>\n<dl class=\"clearfix\">\n<dt>键盘</dt>\n<dd>全尺寸键盘</dd>\n</dl>\n</div>\n<div class=\"Ptable-item\">\n<h3>显示器</h3>\n<dl class=\"clearfix\">\n<dt>显示比例</dt>\n<dd>宽屏16：10</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>屏幕尺寸</dt>\n<dd>其他</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>屏幕类型</dt>\n<dd>LCD</dd>\n</dl>\n</div>\n</div>\n<div class=\"package-list\">\n<h3>包装清单</h3>\n<p>MacBook Pro&times; 1、电源适配器&times; 1、充电线&times; 1 三包凭证（保修卡）*1</p>\n</div>');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (44,'price','10688');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (44,'screen','6.5英寸以上');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (44,'guidePrice','10899');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (44,'storage','512GB');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (44,'specifications','<div class=\"Ptable\">\n<div class=\"Ptable-item\">\n<h3>主体</h3>\n<dl class=\"clearfix\">\n<dt>认证型号</dt>\n<dd class=\"Ptable-tips\"></dd>\n<dd>A2378</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>型号</dt>\n<dd>MHNH3CH/A</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>网络连接</dt>\n<dd>WiFi版</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>上市时间</dt>\n<dd>2021年4月</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>翻新类型</dt>\n<dd>全新</dd>\n</dl>\n</div>\n<div class=\"Ptable-item\">\n<h3>端口</h3>\n<dl class=\"clearfix\">\n<dt>USB接口</dt>\n<dd>Type-C</dd>\n</dl>\n</div>\n<div class=\"Ptable-item\">\n<h3>规格</h3>\n<dl class=\"clearfix\">\n<dt>产品净重（kg）</dt>\n<dd>0.682</dd>\n</dl>\n</div>\n<div class=\"Ptable-item\">\n<h3>功能</h3>\n<dl class=\"clearfix\">\n<dt>前置摄像头</dt>\n<dd>1200W</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>后置摄像头</dt>\n<dd>1200W</dd>\n</dl>\n</div>\n<div class=\"Ptable-item\">\n<h3>连接</h3>\n<dl class=\"clearfix\">\n<dt>连接方式</dt>\n<dd>Wi-Fi</dd>\n</dl>\n</div>\n<div class=\"Ptable-item\">\n<h3>配置</h3>\n<dl class=\"clearfix\">\n<dt>显示芯片</dt>\n<dd>Apple M1 芯片</dd>\n</dl>\n</div>\n<div class=\"Ptable-item\">\n<h3>显示</h3>\n<dl class=\"clearfix\">\n<dt>屏幕类型</dt>\n<dd>Liquid 视网膜 XDR 显示屏</dd>\n</dl>\n</div>\n<div class=\"Ptable-item\">\n<h3>音效</h3>\n<dl class=\"clearfix\">\n<dt>扬声器数量</dt>\n<dd>4个</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>麦克风</dt>\n<dd>5个麦克风</dd>\n</dl>\n</div>\n<div class=\"Ptable-item\">\n<h3>电源</h3>\n<dl class=\"clearfix\">\n<dt>续航时间</dt>\n<dd>使用无线局域网浏览网页，或观看视频，使用时间最长可达 10 小时</dd>\n</dl>\n</div>\n</div>\n<div class=\"package-list\">\n<h3>包装清单</h3>\n<p>iPad&nbsp;Pro USB-C 充电线 (1&nbsp;米) 20W USB-C 电源适配器</p>\n</div>');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (43,'price','9688');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (43,'screen','6.0-6.49英寸');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (43,'guidePrice','9799');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (43,'storage','256GB');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (43,'specifications','<div class=\"Ptable\">\n<div class=\"Ptable-item\">\n<div class=\"Ptable\">\n<div class=\"Ptable-item\">\n<h3>主体</h3>\n<dl class=\"clearfix\">\n<dt>入网型号</dt>\n<dd class=\"Ptable-tips\"></dd>\n<dd>A2644</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>上市月份</dt>\n<dd>9月</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>上市年份</dt>\n<dd>2021年</dd>\n</dl>\n</div>\n<div class=\"Ptable-item\">\n<h3>基本信息</h3>\n<dl class=\"clearfix\">\n<dt>运营商标志或内容</dt>\n<dd class=\"Ptable-tips\"></dd>\n<dd>无标志或内容</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>机身厚度(mm)</dt>\n<dd>7.65</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>机身宽度（mm）</dt>\n<dd>78.1</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>机身材质</dt>\n<dd>以官网信息为准</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>机身材质分类</dt>\n<dd>其他</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>机身长度（mm）</dt>\n<dd>160.8</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>机身重量（g）</dt>\n<dd>238</dd>\n</dl>\n</div>\n<div class=\"Ptable-item\">\n<h3>主芯片</h3>\n<dl class=\"clearfix\">\n<dt>CPU品牌</dt>\n<dd>以官网信息为准</dd>\n</dl>\n</div>\n<div class=\"Ptable-item\">\n<h3>屏幕</h3>\n<dl class=\"clearfix\">\n<dt>屏幕材质类型</dt>\n<dd>OLED</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>主屏幕尺寸</dt>\n<dd>6.7英寸</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>屏幕像素密度（ppi）</dt>\n<dd class=\"Ptable-tips\"></dd>\n<dd>458&nbsp;ppi</dd>\n</dl>\n</div>\n<div class=\"Ptable-item\">\n<h3>后置摄像头</h3>\n<dl class=\"clearfix\">\n<dt>后摄主摄光圈</dt>\n<dd>f/2.8</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>后摄主摄光学防抖</dt>\n<dd>支持光学防抖</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>后摄2摄像头功能</dt>\n<dd>超广角</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>后摄2摄光圈</dt>\n<dd>f/1.8</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>闪光灯</dt>\n<dd>其他</dd>\n</dl>\n</div>\n<div class=\"Ptable-item\">\n<h3>前置摄像头</h3>\n<dl class=\"clearfix\">\n<dt>前摄主摄光圈</dt>\n<dd>f/2.2</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>闪光灯</dt>\n<dd>屏幕补光</dd>\n</dl>\n</div>\n<div class=\"Ptable-item\">\n<h3>电池信息</h3>\n<dl class=\"clearfix\">\n<dt>电池可拆卸</dt>\n<dd class=\"Ptable-tips\"></dd>\n<dd>不可拆卸</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>无线充电</dt>\n<dd class=\"Ptable-tips\"></dd>\n<dd>支持无线充电</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>充电器</dt>\n<dd>其他</dd>\n</dl>\n</div>\n<div class=\"Ptable-item\">\n<h3>网络支持</h3>\n<dl class=\"clearfix\">\n<dt>SIM卡类型</dt>\n<dd class=\"Ptable-tips\"></dd>\n<dd>Nano SIM</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>5G网络</dt>\n<dd>移动5G；联通5G；电信5G</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>4G网络</dt>\n<dd class=\"Ptable-tips\"></dd>\n<dd>其他</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>3G/2G网络</dt>\n<dd>其他</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>网络频率(2G/3G)</dt>\n<dd>以官网信息为准</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>双卡机类型</dt>\n<dd>双卡双待</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>最大支持SIM卡数量</dt>\n<dd>2个</dd>\n</dl>\n</div>\n<div class=\"Ptable-item\">\n<h3>数据接口</h3>\n<dl class=\"clearfix\">\n<dt>耳机接口类型</dt>\n<dd>Lightning</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>NFC/NFC模式</dt>\n<dd>支持（读卡器模式）</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>充电接口类型</dt>\n<dd>Lightning（iPhone）</dd>\n</dl>\n<dl class=\"clearfix\">\n<dt>数据传输接口</dt>\n<dd>WIFI；蓝牙；NFC</dd>\n</dl>\n</div>\n<div class=\"Ptable-item\">\n<h3>辅助功能</h3>\n<dl class=\"clearfix\">\n<dt>常用功能</dt>\n<dd>计算器；屏幕录制器</dd>\n</dl>\n</div>\n</div>\n<div class=\"package-list\">\n<h3>包装清单</h3>\n<p>装有 iOS 15 的 iPhone*1 USB-C 转闪电连接线*1 资料*1</p>\n</div>\n</div>\n</div>');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (36,'area','美国');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (36,'type','动作');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (35,'area','华语');
INSERT INTO ujcms_article_custom (article_id_, name_, value_) VALUES (35,'type','悲剧');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (3,'夕阳下歼10起飞参加演习 画面超美',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211104222955607_po1m3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-07-04 21:38:04','2021-11-20 21:13:33','<p id=\"0BBGHPTJ\">10月10日&#xff0c;南部战区空军航空兵歼-10战斗机组织夜间飞行战斗训练&#xff0c;锤炼部队实战化能力。</p>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (4,'面临三重生存威胁 全球持续变暖马尔代夫恐将“消失”',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211104222746839_hjqth.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-07-04 21:38:07','2021-11-20 21:13:38','<p>受全球气候变化影响&#xff0c;马尔代夫正面临三重生存威胁。</p>\n<p>第一是海洋温度升高导致珊瑚死亡&#xff0c;珊瑚礁也在逐渐消失。未来10几年内&#xff0c;当地海洋生态系统会可能出现重大危机。</p>\n<p>第二是海平面在2020年一年内就上升了3-4毫米 。</p>\n<p>第三是随着气候变化&#xff0c;雨季和热带风暴都变得更频繁。</p>\n<p>面临三重生存威胁&#xff0c;科学家表示如果无法立即采取行动遏制全球变暖&#xff0c;马尔代夫未来可能将不复存在。</p>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (5,'阿富汗临时政府高等教育部：6万名大学生将获得学费减免',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-07-05 03:14:29','2022-01-05 22:00:56','<p class=\"contentFont\">中央广播电视总台CGTN报道员萨利姆·卡卡尔&#xff08;Saleem Kakar&#xff09;当地时间10月6日消息&#xff0c;阿富汗临时政府高等教育部当天在喀布尔举行发布会&#xff0c;内容涉及大学学费减免及入学政策。</p>\n<p class=\"contentFont\">高等教育部代理部长阿卜杜拉·巴奇·哈卡尼在发布会上表示&#xff0c;政府将为贫困学生提供学费折扣&#xff0c;这项政策即将落地。</p>\n<p class=\"contentFont\">私立大学联合会会长艾哈迈德·塔里克·卡迈勒介绍&#xff0c;阿富汗全国各地有90多所大学将提供学费折扣&#xff0c;有6万名学生将获得学费减免&#xff0c;其中大多数人攻读学士学位&#xff0c;也有一些人攻读硕士学位。他们就读于不同的院系&#xff0c;如医学、工程、法律、经济等。</p>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (6,'英姿飒爽！陆军首批10名女飞行学员完成首次单飞',NULL,NULL,NULL,NULL,0,NULL,NULL,'激活','健康和','人民网',NULL,NULL,'/uploads/1/image/2021/11/20211104222710636_nk33a.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2021-07-05 07:04:27','2021-11-20 21:13:57','<p>近日&#xff0c;陆军首批10名女飞行学员在陆航学院某旅机场驾驶直升机圆满完成首次单飞训练&#xff0c;初步具备独立飞行能力。</p>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (7,'驻美大使秦刚谈应对气候变化：美国想按时高分交卷，就不能再逃课',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-08-14 14:12:18','2022-01-05 22:12:31','<p class=\"one-p\">来源&#xff1a;中国驻美国大使馆网站</p>\n<p class=\"one-p\">11月2日&#xff0c;由中央广播电视总台北美总站&#xff08;CGTN&#xff09;主办的“全球行动倡议2021——气候变化”气候周特别活动开幕&#xff0c;秦刚大使线上出席开幕式&#xff0c;与中美青年一代对话&#xff0c;就当下备受关注的应对气候变化问题回答了来自美国纽约、旧金山、华盛顿特区和中国清华大学、浙江大学、北京师范大学等中美学生的提问&#xff08;答问全文&#xff09;。</p>\n<p class=\"one-p\">在回答关于“中国领导人为应对气候变化做了什么&#xff1f;中国政府如何降低汽车污染和减缓气候变化”等问题时&#xff0c;秦刚大使表示&#xff0c;中国领导人高度重视气候变化问题。去年9月&#xff0c;习近平主席郑重宣布&#xff0c;中国力争于2030年前达到二氧化碳排放峰值&#xff0c;2060年前实现碳中和。今年4月&#xff0c;习主席在领导人气候峰会上首次全面系统阐述了“人与自然生命共同体”理念。《联合国气候变化框架公约》第二十六次缔约方大会世界领导人峰会此时正在格拉斯哥举行&#xff0c;习主席在向峰会发表的书面致辞中呼吁各方维护多边共识&#xff0c;聚焦务实行动&#xff0c;加速绿色转型&#xff0c;携手应对气候变化挑战&#xff0c;合力保护人类共同的地球家园。</p>\n<p class=\"one-p\">秦大使说&#xff0c;中国在减少汽车尾气排放、坚持绿色出行方面做了很多努力。中国新能源汽车得到了大发展&#xff0c;总量达到600万辆。中国政府还鼓励老百姓选择公共交通和绿色出行方式。北京冬奥会也将成为历史上第一届全部使用绿色清洁能源的奥运会。绿色&#xff0c;将成为北京冬奥会最闪亮的底色。</p>\n<p class=\"one-p\">在回答关于“在气变领域&#xff0c;中美共同的责任和有所区别的责任是什么&#xff1f;中方有何计划与美国合作共同应对气候变化”等问题时&#xff0c;秦刚大使表示&#xff0c;应对气候变化是全球各国的共同责任&#xff0c;同时发达国家和发展中国家也面临不同的责任。发展中国家还面临发展经济、改善民生的任务&#xff0c;发达国家在应对气候变化上应担负起更多的责任&#xff0c;兑现为发展中国家提供资金和技术支持的承诺。中美两国作为应对气候变化的主要行动方&#xff0c;都应首先立足自身&#xff0c;完成好国家自主贡献。美国是个实力很强的学生&#xff0c;但中间曾“逃过课”、退出过《巴黎协定》&#xff0c;今后要想按时高分交卷&#xff0c;就不能再逃课了&#xff0c;也不能推迟提交作业。</p>\n<p class=\"one-p\">秦大使表示&#xff0c;中国碳排放将力争在2030年前达峰&#xff0c;2060年前实现碳中和&#xff0c;这意味着中国将完成全球最高碳排放强度的降幅。为实现上述目标&#xff0c;作为发展中国家&#xff0c;中国需比美国付出更大的牺牲和努力。应对气候变化更需要包括中美两国在内的各国开展密切合作。中美共同发表了《应对气候危机的联合声明》&#xff0c;重申加强合作。双方正在协力推动COP26取得成功。两国在电动汽车、可再生能源、绿色金融、数字经济等方面都有巨大的合作潜力&#xff0c;值得深入挖掘。中美还可以携手帮助易受气候影响的脆弱国家&#xff0c;开展第三方合作。我们期待中美以格拉斯哥气变大会为契机&#xff0c;着眼于全人类的共同利益&#xff0c;携手扭转当前阻碍两国合作的“政治小气候”&#xff0c;引领世界协力应对日益变暖的“全球大气候”&#xff0c;共同交上一份令人满意的答卷。</p>\n<p class=\"one-p\">在回答关于“是否有途径让年青一代广泛参与应对气候变化&#xff1f;是否可加强中美青年学生间交流与合作&#xff1f;”等问题时&#xff0c;秦刚大使表示&#xff0c;气候变化是全人类面临的共同挑战&#xff0c;地球的未来会是什么样&#xff1f;答案取决于我们每个人&#xff0c;特别是青年一代的选择和努力。青年人是应对气候变化的参与者、受益者&#xff0c;同时更应是生态文明的倡导者、引领者。我看到&#xff0c;中美两国有越来越多的年轻人把做“低碳青年”视为“更酷、更时尚”的生活方式。希望全球青年人都能参与到应对气变的努力中&#xff0c;从点滴做起、从自身做起、从衣食住行的方方面面做起&#xff0c;倡导和塑造绿色生活方式&#xff0c;让大家都成为应对气候变化的行动者、分享者。青年一代的才智、付出和努力终将汇聚成磅礴之力&#xff0c;推动呵护全人类共同的地球家园&#xff0c;实现世界的美好未来&#xff01;我本人和中国驻美使馆将积极支持并协助中美青年加强交流互动。</p>\n<p class=\"one-p\">此次气候周特别活动为期5天。中宣部副部长、中央广播电视总台台长慎海雄为活动致开幕辞&#xff0c;塞拉利昂总统比奥、冰岛总理雅各布斯多蒂尔等国家领导人以及联合国和世界自然基金会等国际组织官员出席活动。</p>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (8,'福布斯发布中国内地富豪榜：农夫山泉钟睒睒首度登顶、张一鸣第二',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211104232420442_dqx8h.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-08-14 14:12:34','2022-01-05 22:12:44','<p class=\"one-p\">文/福布斯中国</p>\n<p class=\"one-p\">11月4日&#xff0c;福布斯发布年度中国内地富豪榜。对于中国内地富豪榜的100名上榜者来说&#xff0c;尽管过去一年充满挑战&#xff0c;但他们仍收益颇多&#xff1a;上榜者总财富数从去年的1.33万亿美元增至1.48万亿美元。</p>\n<p class=\"one-p\">过去一年&#xff0c;中国的社会与经济环境可谓浪潮迭起。教育与科技领域的政策变化&#xff0c;以及部分房地产企业的债务问题&#xff0c;使多家大型民营企业的股价出现大幅下跌。另一方面&#xff0c;响应中国政府“共同富裕”理念&#xff0c;多家中国科技企业和其领导者相继宣布为此投入巨资。</p>\n<p class=\"one-p\">尽管挑战不断&#xff0c;但本次上榜者的总财富仍然较去年有所增长&#xff0c;其中涨幅最大的是那些从事包括锂电池在内的绿色能源产业的富豪。受益于中国在该产业的全球领导地位&#xff0c;其公司的销售业绩出现了强劲的增长。值得一提的是&#xff0c;中国除了是世界最大的<span class=\"linkNormal\">汽车</span>市场&#xff0c;还是世界上<span class=\"linkNormal\">电动汽车</span>销售的领先者。</p>\n<p class=\"one-p\"><strong>福布斯中国内地富豪榜的TOP 10</strong></p>\n<p class=\"one-p\"> </p>\n<p class=\"one-p\"><strong>财富来源: 农夫山泉/ 万泰生物</strong></p>\n<p class=\"one-p\"><strong>年龄: 66</strong></p>\n<p class=\"one-p\"><strong>居住地: 杭州</strong></p>\n<p class=\"one-p\"><strong>行业: 饮料、生物医药</strong></p>\n<p class=\"one-p\">凭借着两家上市公司股价的良好表现&#xff0c;农夫山泉创始人钟睒睒以4,244亿的财富值问鼎2021年中国内地富豪榜榜首。</p>\n<p class=\"one-p\"> </p>\n<p class=\"one-p\"><strong>财富来源: 字节跳动</strong></p>\n<p class=\"one-p\"><strong>年龄: 37</strong></p>\n<p class=\"one-p\"><strong>居住地: 北京</strong></p>\n<p class=\"one-p\"><strong>行业: 互联网、社交媒体</strong></p>\n<p class=\"one-p\">在今年5月辞去CEO一职后&#xff0c;字节跳动创始人张一鸣又于近日卸任公司董事长。此前&#xff0c;张一鸣曾表示&#xff0c;未来将放下公司日常管理&#xff0c;聚焦远景战略、企业文化和社会责任等长期重要事项&#xff0c;计划相对专注学习知识、系统思考、研究新事物、动手尝试和体验&#xff0c;以十年为期&#xff0c;为公司创造更多可能。</p>\n<p class=\"one-p\"> </p>\n<p class=\"one-p\"><strong>财富来源: 宁德时代</strong></p>\n<p class=\"one-p\"><strong>年龄: 52</strong></p>\n<p class=\"one-p\"><strong>居住地: 宁德</strong></p>\n<p class=\"one-p\"><strong>行业: 电池</strong></p>\n<p class=\"one-p\">随着全球双碳目标的设立&#xff0c;过去一年&#xff0c;宁德时代成为A股市场最受关注的上市公司之一&#xff0c;总市值突破万亿元&#xff0c;也助力创始人曾毓群跃升至榜单第三位。除已多年居全球动力电池装机量首位外&#xff0c;宁德时代正通过投资等方式&#xff0c;积极布局新能源汽车、锂电池、储能等各产业链&#xff0c;并将触角延伸至大出行领域。今年前三季度&#xff0c;宁德时代总营收超过700亿元&#xff0c;归母净利达77.5亿元。</p>\n<p class=\"one-p\"> </p>\n<p class=\"one-p\"><strong>财富来源: 腾讯</strong></p>\n<p class=\"one-p\"><strong>年龄: 50</strong></p>\n<p class=\"one-p\"><strong>居住地: 深圳</strong></p>\n<p class=\"one-p\"><strong>行业: 即时通讯、门户网站、网络游戏</strong></p>\n<p class=\"one-p\">随着全球科技行业监管趋紧&#xff0c;今年&#xff0c;中国互联网行业也进入强监管模式。这对整个行业在资本市场的表现带来压力&#xff0c;腾讯市值也随行业估值中枢下调。今年&#xff0c;腾讯宣布&#xff0c;将投入千亿元助力“共同富裕”</p>\n<p class=\"one-p\"> </p>\n<p class=\"one-p\"><strong>财富来源: 阿里巴巴</strong></p>\n<p class=\"one-p\"><strong>年龄: 57</strong></p>\n<p class=\"one-p\"><strong>居住地: 杭州</strong></p>\n<p class=\"one-p\"><strong>行业: 电子商务、金融科技</strong></p>\n<p class=\"one-p\">受互联网平台反垄断监管等因素影响&#xff0c;过去一年阿里巴巴股价跌幅超过40%。而自去年11月被叫停后&#xff0c;阿里旗下重要子公司<span class=\"linkNormal\">蚂蚁集团</span>的上市仍不明朗&#xff0c;这些都导致马云个人财富数较去年大幅减少。尽管如此&#xff0c;作为阿里巴巴面向未来的第二增长曲线&#xff0c;阿里云去年的销售额突破600亿元人民币&#xff0c;同比增长50%。</p>\n<p class=\"one-p\"> </p>\n<p class=\"one-p\"><strong>财富来源: 拼多多</strong></p>\n<p class=\"one-p\"><strong>年龄: 41</strong></p>\n<p class=\"one-p\"><strong>居住地: 上海</strong></p>\n<p class=\"one-p\"><strong>行业: 电子商务</strong></p>\n<p class=\"one-p\">今年3月&#xff0c;黄峥辞任拼多多董事长。他在内部信中表示&#xff0c;本人将致力于食品科学和生命科学领域的研究&#xff0c;并着眼于拼多多未来的长远发展&#xff0c;“去摸一摸10年后路上的石头”。此外&#xff0c;黄峥及拼多多创始团队还发起并捐赠成立浙江大学上海高等研究院繁星科学基金。未来3-5年&#xff0c;该基金将向浙江大学教育基金会捐助 1 亿美元&#xff0c;用于 “计算 &#43; 生物医疗”、“计算 &#43;<span class=\"linkNormal\">农业</span>食品” 和 “先进计算” 三个创新实验室的科学研究项目。</p>\n<p class=\"one-p\"> </p>\n<p class=\"one-p\"><strong>财富来源: 美的集团</strong></p>\n<p class=\"one-p\"><strong>年龄: 79</strong></p>\n<p class=\"one-p\"><strong>居住地: 佛山</strong></p>\n<p class=\"one-p\"><strong>行业: 日用电器制造、房地产</strong></p>\n<p class=\"one-p\">美的集团是中国第一家没有 “父传子” 的千亿级民营企业&#xff0c;创始人何享健离开一线但仍然继续关心、关注和全力支持美的集团的发展。6月23日&#xff0c;美的集团发布公告称&#xff0c;何享健已完成 8 亿元增持美的集团 的计划。自 2012 年辞去集团董事长后&#xff0c;何享健热心于慈善公益事业。去年&#xff0c;何享健曾减持美的集团股份&#xff0c;筹资建设医院、设立 “和衷共济” 小微企应急支援计划等公益项目。</p>\n<p class=\"one-p\"> </p>\n<p class=\"one-p\"><strong>财富来源: 长城汽车</strong></p>\n<p class=\"one-p\"><strong>年龄: 57</strong></p>\n<p class=\"one-p\"><strong>居住地: 保定</strong></p>\n<p class=\"one-p\"><strong>行业: 汽车</strong></p>\n<p class=\"one-p\">长城汽车董事长魏建军夫妇的财富数较一年前增加194亿美元&#xff0c;排名上升30位。魏建军称&#xff0c;长城汽车将在 2025 年实现全球年销售 400 万辆目标&#xff0c;其中 80% 将是新能源汽车。近年&#xff0c;魏建军还先后投建蜂巢能源、未势能源、极电光能等&#xff0c;布局新能源领域。</p>\n<p class=\"one-p\"> </p>\n<p class=\"one-p\"><strong>财富来源: 网易</strong></p>\n<p class=\"one-p\"><strong>年龄: 50</strong></p>\n<p class=\"one-p\"><strong>居住地: 杭州</strong></p>\n<p class=\"one-p\"><strong>行业: 互动娱乐、在线音乐、在线教育、电子商务、资讯传媒</strong></p>\n<p class=\"one-p\">今年10 月&#xff0c;丁磊首次提到音乐产业的 “共同富裕”。他预计&#xff0c;到 2025年中国将有超过80万独立音乐人&#xff0c;将扩大版权供给量&#xff0c;创造高几倍的产业价值。他呼吁行业应优化版权分配、持续扶持原创&#xff0c;让优秀的音乐人有所成&#xff0c;有所得。</p>\n<p class=\"one-p\">10月10日&#xff0c;网易宣布捐赠2000万元&#xff0c;驰援山西暴雨灾区。这是继今年7月紧急向河南暴雨灾区捐赠5000万元后&#xff0c;网易又一次重大社会捐赠行为。2021年&#xff0c;丁磊带领网易全面践行社会价值&#xff0c;结合自身技术能力和业务优势&#xff0c;在游戏未成年人保护、人才就业、绿色低碳、社会捐助、公益教育等多个领域加大投入&#xff0c;交出了一份互联网科技企业的“担当”答卷。</p>\n<p class=\"one-p\"> </p>\n<p class=\"one-p\"><strong>财富来源: 顺丰控股</strong></p>\n<p class=\"one-p\"><strong>年龄: 51</strong></p>\n<p class=\"one-p\"><strong>居住地: 深圳</strong></p>\n<p class=\"one-p\"><strong>行业: 物流</strong></p>\n<p class=\"one-p\">与去年相比&#xff0c;王卫的财富数减少34亿美元&#xff0c;排名跌出前五。今年一季度&#xff0c;顺丰控股亏损近10亿元&#xff0c;超出市场预期&#xff0c;拖累公司股价一路走低。尽管截止前三季度&#xff0c;顺丰控股实现净利润10.4亿元&#xff0c;但与去年同期相比仍下滑43.5%。</p>\n<p class=\"one-p\">《福布斯》杂志资深编辑、中国内地富豪榜榜单编辑范鲁贤&#xff08;Russell Flannery&#xff09;表示&#xff1a;“无论是电动汽车电池、太阳能设施&#xff0c;还是电池制造设备&#xff0c;这些应对气候变化的产品都有着不断增长的市场需求&#xff0c;并令众多的中国企业家从中获益。这是本榜单中一些企业家的财富实现大幅上涨的主要原因&#xff0c;同时也意味着新的商业投资机会。”</p>\n<p class=\"one-p\">继上半年实现利润增长后&#xff0c;中国瓶装水之王、农夫山泉董事长钟睒睒今年以659亿美元的财富首次登上榜首&#xff0c;其背后的主要原因在于疫情防控效果良好&#xff0c;中国消费支出得到提振。此外&#xff0c;钟睒睒的财富还得益于对北京万泰生物有限公司的成功投资&#xff0c;后者是一家于上交所上市的制药公司&#xff0c;其在10月中旬的股价较上年同期上涨了76%。</p>\n<p class=\"one-p\">位居榜单第二位的是字节跳动创始人张一鸣。作为全球社交媒体现象级应用软件TikTok的运营商&#xff0c;字节跳动帮助张一鸣成为了本榜单上财富数增加最多的富豪&#xff0c;从去年的277亿美元上升至594亿美元。榜单第三位是电池制造商宁德时代的董事长曾毓群。作为全球最大的电动汽车电池供应商&#xff0c;宁德时代的巨大成功帮助曾毓群成为了榜单中个人财富数增加第二多的富豪&#xff0c;从去年的201亿美元上涨至508亿美元。</p>\n<p class=\"one-p\">相比之下&#xff0c;腾讯CEO马化腾的财富从去年的552亿美元下滑至491亿美元&#xff0c;排名也滑落至榜单第四位。另外&#xff0c;由于阿里巴巴旗下金融服务子公司蚂蚁集团推迟上市&#xff0c;加上阿里巴巴本身股价下跌&#xff0c;去年位居榜首的马云今年跌至第五位&#xff0c;财富为415亿美元。</p>\n<p class=\"one-p\">今年前100位上榜者中的新面孔包括中伟新材料总裁邓伟明&#xff08;第63名&#xff0c;资产90.7亿美元&#xff09;、<span class=\"linkNormal\">东鹏饮料</span>总裁林木勤&#xff08;第84名&#xff0c;资产70.5亿美元&#xff09;&#xff0c;以及<span class=\"linkNormal\">锦浪科技</span>大股东王峻适、王一鸣父子&#xff08;第100名&#xff0c;57.4亿美元&#xff09;。而重新回到前100的富豪则包括<span class=\"linkNormal\">天齐锂业</span>董事长蒋卫平&#xff08;第79名&#xff0c;73.1亿美元&#xff09;。</p>\n<p class=\"one-p\">进入福布斯中国内地富豪榜100名所需的最低门槛从一年前的50.3亿美元增至57.4亿美元。</p>\n<p class=\"one-p\"><strong>制榜方法 :</strong></p>\n<p class=\"one-p\">该榜单基于股权及财务信息编制&#xff0c;信息来源包括上榜者家族、上市公司公开资料等。来自上市公司部分的财富统计&#xff0c;使用2021年10月15日的汇率及股票收盘价。私营企业估值基于财务数据基础上的同业比较评估所得。本榜单上榜者包含那些目前已非中国籍&#xff0c;但其主要财富仍来自中国大陆的企业家。</p>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (9,'世界第二富豪贝索斯：20亿美金拿去花，别再骂我不管地球了',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211104231836614_mefxh.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-08-14 14:12:48','2022-01-05 22:10:08','<p class=\"one-p\">亚马逊公司创始人贝索斯上周末坐着价值6500万美元的湾流G650ER喷气式飞机赴英国格拉斯哥参加联合国气候变化大会COP26。来自全球200多个国家和地区的人们将在这不到两周的时间碰撞对策&#xff0c;应对气候变暖的核心难题。</p>\n<p class=\"one-p\">不过&#xff0c;搭乘私人飞机来关心碳排放&#xff1f;这番操作让贝索斯人未到场先被嘲&#xff0c;但想必堂堂“世界第二富”绝不会感到尴尬&#xff0c;毕竟同行们也是这么干的&#xff0c;光是私人飞机就来了400多架&#xff0c;包括美国总统拜登的空军一号。拜登还得每天坐着大油耗的车队在格拉斯哥和爱丁堡之间30 英里路往返奔波。</p>\n<p class=\"one-p\">焦点继续回到贝索斯。这次他还真没空着手来——在11月2日的演讲上&#xff0c;他宣布通过贝索斯地球基金&#xff08;The Bezos Earth Fund&#xff09;为自然保护和改造粮食系统提供20亿美元。加上今年9月份承诺捐赠的&#xff0c;用于保护地球上30%的陆地和海洋的10亿美元&#xff0c;这些款项将均会在2030年交付。此番慷慨迅速登上了各大海外媒体的版面。至于捐款具体怎么使用还没有确切说法。北京时间11月4日&#xff0c;有消息证实贝索斯已经出售了大约20亿美元的亚马逊股票。此外&#xff0c;贝索斯的十分钟演讲中提到了亚马逊在2019年的气候承诺——2025年让可再生能源为所有业务提供动力&#xff0c;在2040年实现净零排放的目标。</p>\n<p class=\"one-p\">谈及捐款的初心&#xff0c;贝索斯终于提了一嘴自己的蓝色起源火箭&#xff0c;并表示&#xff0c;正是7月份这趟太空之旅让他对环保心有戚戚焉&#xff1a;“从高处回望地球&#xff0c;大气层似乎如此稀薄&#xff0c;世界如此有限&#xff0c;如此脆弱。” 而太空事业正是他此前被环保群体指责的由头——有那么多闲钱为什么不去保护地球&#xff0c;整天老想着“上天”&#xff0c;更别提火箭燃料对地球大气层的影响了。</p>\n<p class=\"one-p\">除了这20亿美金的捐款&#xff0c;贝索斯地球基金还和洛克菲勒基金会、宜家基金会“拉了个小群”——组建一个全球人类和地球能源联盟&#xff0c;帮助贫困国家实现可再生能源转型。地球基金承诺掏出5亿美元支持这个项目。据其官网介绍&#xff0c;该基金建立的基础是贝索斯承诺的100 亿美元赠款&#xff0c;这笔钱会在接下来的十年里发放。</p>\n<p class=\"one-p\">20亿的天价“赎罪券”&#xff1f;</p>\n<p class=\"one-p\">既然如此爽快地掏钱保护地球&#xff0c;为什么贝索斯仍被骂为富不仁&#xff1f;他冤不冤&#xff1f;</p>\n<p class=\"one-p\">作为一家由互联网电商业务驱动的科技巨头&#xff0c;可想而知亚马逊在碳足迹方面的“造诣”。毕竟数十亿件商品是需要坐着飞机、卡车和轮船才能从世界各个角落到达消费者家门口。美联社消息称&#xff0c;为了提高配送效率&#xff0c;亚马逊在今年1月宣布再购入11架飞机。</p>\n<p class=\"one-p\">亚马逊今年6月发布的年度可持续发展报告中指出&#xff0c;2020年其碳排放量为6064万吨&#xff0c;相当于烧了1.4亿桶石油&#xff0c;与2019年相比出现了15%的增长&#xff0c;化石燃料的排放量也猛增 69%。</p>\n<p class=\"one-p\">新冠疫情让全球的经济活动陷入凝滞。根据东英吉利大学等三所英国大学的研究&#xff0c;去年全球的碳排放量因此创下有记录以来最大幅度的削减——24亿吨&#xff0c;同比下降7%。</p>\n<p class=\"one-p\">然而&#xff0c;亚马逊却实实在在地从中受益。居家隔离带来的新需求让全球消费者越发依赖线上零售。2020年底亚马逊的财报显示&#xff0c;全年净销售额增长38%&#xff0c;达到3861亿美元的历史成绩。排放量也伴随着业务的扩张而增长。不过亚马逊方面辩解道&#xff0c;虽然排放总量上去了&#xff0c;但强度降低了&#xff0c;也就是说亚马逊每花费一美元所产生的碳排放量降低了16%。</p>\n<p class=\"one-p\">在气候议题上&#xff0c;亚马逊甚至和自家员工也闹得很难看。美国劳工官员发现亚马逊在去年4月解雇了两名加入了“亚马逊气候正义员工组织”的员工&#xff0c;怀疑此举是为了报复二人公开批评公司在环保和仓库安全问题的行为。该组织对亚马逊提出的目标包括&#xff1a;实现“2030年零排放”&#xff0c;限制和化石燃料公司之间的合作&#xff0c;拒绝出资支持那些不肯承认气候变化事实存在的政客。尽管公司方面不接受这一调查结果&#xff0c;坚称职员被解雇的因为他们“一再违反内部政策”&#xff0c;并非是因为得罪了雇主。</p>\n<p class=\"one-p\">有了之前的种种铺垫&#xff0c;不难理解贝索斯此时出来关怀地球的举动收获掌声寥寥&#xff0c;只被视为理所应当。</p>\n<p class=\"one-p\">另一方面&#xff0c;或许是与其他同等量级的富豪相比&#xff0c;他在慈善事业上的反应有点晚。比如&#xff0c;他并没有签署由巴菲特和盖茨在2010年的号召——让亿万富豪承诺把大部分财富投入慈善。不过&#xff0c;近年来贝索斯的慈善表态变得密集。根据彭博亿万富翁指数&#xff0c;贝索斯净资产高达1960亿美元&#xff08;仅次于马斯克&#xff09;&#xff0c;最新官宣的这20亿捐款占他净资产的1%左右。卸任亚马逊CEO后&#xff0c;他仍持有份额10%左右的股份。根据美国证券交易委员会(SEC) 的文件&#xff0c;贝索斯今年累计出售的股票规模约为86亿美元&#xff0c;部分原因在于为其私人航天公司“蓝色起源”造血。</p>\n<p class=\"one-p\">“这次&#xff0c;我想当个好人”</p>\n<p class=\"one-p\">贝索斯对气候慈善事业的贡献和影响毋庸置疑。接下来的关键是&#xff0c;贝索斯还想做什么&#xff1f;</p>\n<p class=\"one-p\">从亚马逊和贝索斯本人已有的行动&#xff0c;大致可分为慈善、亚马逊产业链和气候科技投资三个方面。</p>\n<p class=\"one-p\">首先是慈善领域。贝索斯称&#xff0c;在明年的会议上他的基金将着眼非洲。在COP26提出的20亿美元捐款的主要目标之一&#xff0c;正是改善粮食供应——通过解决非洲的土地退化问题&#xff0c;提高土壤肥力和产量&#xff0c;还能固碳&#xff0c;促进就业和经济发展。</p>\n<p class=\"one-p\">去年6月&#xff0c;亚马逊的气候承诺基金已经投资了11家气候技术公司&#xff0c;并将一些技术整合到亚马逊的业务链条中。比如&#xff0c;向电动货车和卡车制造商Rivian订购10万台电动货车&#xff0c;预计于2030年上路。据海外科技媒体Geek Wire报道&#xff0c;混凝土生产商CarbonCure Technologies、碳抵消验证平台Pachama、电动汽车电池回收商Redwood Materials、节能电机制造商商Turntide Technologies、电动飞机制造商BETA Technologies、电池软件公司Ion Energy以及氢电航空公司ZeroAvia等一众气候技术初创公司均得到了气候承诺基金的青睐。</p>\n<p class=\"one-p\">以货运业为例。货运是亚马逊最为关键的环节之一&#xff0c;却也是它实现脱碳目标的最大难关。用于运送消费品的船只通常比较旧&#xff0c;多采用传统化石燃料。所以&#xff0c;亚马逊就盯上了来自加州的初创公司Infinium。在最近的一轮融资中&#xff0c;亚马逊为Infinium联合领投了6900万美元的融资。Infinium正在开发超低碳燃料用来取代碳密集型柴油和喷气燃料&#xff0c;可以用于航运、海运以及重型卡车车队。这家公司还在研发由“绿色氢气”和废二氧化碳合成的“电子燃料”。</p>\n<p class=\"one-p\">“世界在过去的20年里已经被宠坏了&#xff0c;当时&#xff0c;由于互联网、软件和云&#xff0c;公司可以在六个月内从零增长到十亿美金&#xff0c;”亚马逊气候承诺基金的管理者彼得森指出&#xff0c;气候技术的问题很难、“它是原子而不是比特&#xff0c;因此他们的扩展要更困难&#xff0c;更需要时间。”</p>\n<p class=\"one-p\">除了亚马逊&#xff0c;气候科技的投资领域也不乏其他积极的身影&#xff0c;比如来自微软的10亿气候创新基金和比尔盖茨牵头的突破能源风险投资公司&#xff08;Breakthrough Energy Ventures&#xff09;等。</p>\n<p class=\"one-p\">至于贝索斯在未来的兴趣重点——太空旅行市场&#xff0c;或许才是会惹出更多争议的部分。贝索斯一直炫耀自家的蓝色起源用的是液态氢和液态氧推进器&#xff0c;比起维珍创始人理查德布兰森的VSS Unity用的混合推进剂更环保。</p>\n<p class=\"one-p\">燃烧推进剂为火箭升入太空提供能量&#xff0c;也会带来温室气体和空气污染物。太空咨询公司Northern Sky Research的首席分析师卡萨波斯基&#xff08;Dallas Kasaboski&#xff09;对Space.com表示&#xff0c;“科学界目前不知道、也没有足够的证据来判断火箭发射可能在什么时候开始对地球产生可衡量的影响。与此同时&#xff0c;随着火箭发射次数的增加&#xff0c;平流层已经发生了变化。”可是&#xff0c;“太空爱好者”贝索斯对太空旅行的增长潜力&#xff0c;显然还有蓬勃的野心。</p>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (10,'首都体育馆和五棵松体育中心将迎来测试赛和测试活动',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211104224550238_erko3.gif',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-08-14 14:12:58','2022-01-05 22:09:53','<p align=\"left\">　　新华社北京10月11日电&#xff08;记者赵建通、马邦杰、董意行、吉宁&#xff09;11日&#xff0c;“相约北京”系列冬季体育赛事北京赛区&#xff08;海淀&#xff09;新闻发布会在中关村国家自主创新示范区展示中心会议中心举行。海淀区相关部门以及首都体育馆场馆群、五棵松体育中心场馆运行团队分别介绍筹备及服务保障测试赛、测试活动相关情况。</p>\n<p>　　据了解&#xff0c;此次“相约北京”赛事海淀区涉及两个场馆、三项赛事。10月13日至17日&#xff0c;首都体育馆将举办亚洲花样滑冰公开赛&#xff0c;10月21日至24日将举办短道速滑世界杯。11月7日至10日&#xff0c;五棵松体育中心将举办冰球国内测试活动。目前&#xff0c;花样滑冰项目测试赛报名人数103人&#xff0c;其中运动员32人&#xff0c;中国运动员人数为17人&#xff1b;短道速滑测试赛报名人数395人&#xff0c;其中运动员248人&#xff0c;中国运动员人数为16人&#xff1b;冰球项目为国内测试活动&#xff0c;有国内4支冰球队伍参加。三项赛事各类入境人员预计494人。</p>\n<p>　　围绕上述三项赛事&#xff0c;海淀区组织辖区科技创新企业&#xff0c;共同设计、搭建科技防疫、机器人等多个科技冬奥应用场景&#xff0c;通过科技助力冬奥。赛场外围布设智慧感知设备&#xff0c;场馆、酒店入口及接驳车辆安装多验合一数字哨点&#xff0c;3秒即可通过“防疫卡”完成“扫码打卡”&#xff0c;每一次出入都将得到健康提醒&#xff1b;赛场入口处布设大规模测温设备&#xff0c;保障运动员快速入场&#xff1b;观众入场区域布设智慧出入管理系统&#xff0c;能够实现快速核验入场&#xff0c;避免人员聚集&#xff1b;智能测温贴可实现24小时体温管理&#xff1b;气溶胶新冠病毒监测系统可有效显示场馆、酒店的空气中是否含有新冠病毒&#xff1b;同时通过科技手段&#xff0c;加强对涉奥环境消杀&#xff0c;如布设消毒机器人&#xff0c;在场馆内的空调安装病原体空气消杀系统&#xff0c;通过无人化手段实现场馆、酒店的自动消杀。</p>\n<p>　　海淀区体育局局长张彦祥表示&#xff0c;组委会按照“一场一策”“一馆一策”的要求&#xff0c;不断细化人员流线&#xff0c;强化闭环管理安排。在住宿服务保障方面&#xff0c;对标冬奥组委赛时住宿保障要求&#xff0c;细化人员住宿分配方案&#xff0c;依据场馆闭环内不同风险程度的人群分类安排酒店集中居住闭环管理&#xff0c;依据“一店一策”的原则制定酒店疫情防控措施&#xff0c;严格“酒店&#43;场馆”两点一线进行闭环管控。</p>\n<p>　　据发布会介绍&#xff0c;海淀区在中关村国际自主创新示范区展示中心会议中心设立新闻中心。在“相约北京”系列冬季体育赛事期间&#xff0c;将为媒体记者提供海淀赛区相关图片、视频及文字等新闻素材。海淀区还将为测试赛、测试活动注册记者提供核酸检测和语言翻译等志愿服务&#xff0c;协调媒体采访、策划组织现场新闻发布及相关集体采访活动。</p>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (11,'比超级计算机快千万倍！中国量子计算研究获重要进展',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211104224056206_vdefr.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-08-14 14:13:07','2022-01-05 22:09:19','<p>　　近日&#xff0c;中科院量子信息与量子科技创新研究院科研团队在超导量子和光量子两种系统的量子计算方面取得重要进展&#xff0c;使我国成为目前世界上唯一在两种物理体系达到“量子计算优越性”里程碑的国家。</p>\n<p>　　经过研究攻关&#xff0c;超导量子计算研究团队构建了66比特可编程超导量子计算原型机“祖冲之二号”&#xff0c;实现了对“量子随机线路取样”任务的快速求解&#xff0c;比目前最快的超级计算机快一千万倍&#xff0c;计算复杂度比谷歌的超导量子计算原型机“悬铃木”高一百万倍&#xff0c;使得我国首次在超导体系达到了“量子计算优越性”里程碑。</p>\n<p>　　同时&#xff0c;光量子计算研究团队构建了113个光子144模式的量子计算原型机“九章二号”&#xff0c;处理特定问题的速度比超级计算机快亿亿亿倍&#xff0c;并增强了光量子计算原型机的编程计算能力。</p>\n<p>　　中国科学技术大学教授 陆朝阳&#xff1a;我们把之前的九章光量子计算机从之前的76个光子增加到了113个光子&#xff0c;比超级计算机快亿亿亿倍。</p>\n<p>　　超导量子比特与光量子比特是国际公认的有望实现可扩展量子计算的物理体系。量子计算机对特定问题的求解超越超级计算机即量子计算优越性&#xff0c;是量子计算发展的第一个里程碑。</p>\n<p>　　中国科学院院士 潘建伟&#xff1a;下一步我们希望能够通过4到5年的努力实现量子纠错&#xff0c;在使用量子纠错的基础之上&#xff0c;我们就可以来探索用一些专用的量子计算机或者量子模拟机来解决一些具有重大应用价值的科学问题。&#xff08;记者 帅俊全 安徽台 方田&#xff09;</p>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (12,'全国核酸检测机构超1.1万家 便民措施不断落地',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211104223810718_6a5ax.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-08-14 14:13:20','2022-01-05 22:08:49','<p>　　新华社北京10月30日电&#xff08;记者彭韵佳、董瑞丰&#xff09;国家卫生健康委医政医管局监察专员郭燕红30日在国务院联防联控机制新闻发布会上说&#xff0c;当前我国可开展核酸检测的机构数量已经达到11581家&#xff0c;比去年3月提高4.6倍。</p>\n<p>　　郭燕红介绍&#xff0c;目前每天能够检测的数量达到单管单检2910万份&#xff0c;比去年3月提高22.1倍&#xff0c;通过混检的方法&#xff0c;整体检测效率和能力还能实现倍增。</p>\n<p>　　核酸检测在及时发现感染者、锁定感染范围以及降低传播风险等方面具有重要意义。据介绍&#xff0c;为进一步提高核酸检测的服务便利程度&#xff0c;国家卫生健康委将聚焦布局合理化、信息公开化、服务便利化开展工作&#xff1a;</p>\n<p>　　地方以设区市为单位&#xff0c;对核酸检测点进行网格化布局&#xff0c;让老百姓能够就近获得核酸检测服务&#xff1b;</p>\n<p>　　卫生健康行政部门要通过官方网站、客户端、微信公众号以及公共服务的小程序向社会公布辖区内所有核酸检测机构的名称、工作时间等&#xff1b;</p>\n<p>　　核酸检测机构要向社会提供24小时检测服务&#xff0c;对“应检尽检”“愿检尽检”的人群要力争在6小时以内反馈结果。</p>\n<p>　　郭燕红表示&#xff0c;国家卫生健康委将结合疫情防控形势&#xff0c;适时对部分地区进行抽检&#xff0c;重点检查核酸能力的提升情况以及检测的优化情况。</p>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (13,'武夷山国家公园发现两栖动物、大型真菌新物种',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211104223701330_qupit.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-08-14 14:13:31','2022-01-05 22:05:34','<p>　　新华社福州10月31日电&#xff08;记者张华迎&#xff09;记者从福建省林业局获悉&#xff0c;近日科研人员在武夷山国家公园范围内开展生物资源本底调查过程中&#xff0c;发现两栖动物新物种“武夷林蛙”、大型真菌新物种“多形油囊蘑”。相关科研成果已分别在国际学术期刊《Zookeys》《MycoKeys》上发表。</p>\n<p>　　武夷林蛙发现者之一、生态环境部南京环境科学研究所助理研究员吴延庆说&#xff0c;武夷林蛙是趾沟蛙种组中的一员&#xff0c;体型与同区域分布的镇海林蛙相似。与镇海林蛙相比&#xff0c;武夷林蛙的四肢背侧有多行横向排列的细肤褶。据了解&#xff0c;去年8月以来&#xff0c;专家们先后多次在相关水域发现这种林蛙&#xff0c;经过实验室标本比对和基因测序&#xff0c;结果显示这是一种从未被描述过的林蛙&#xff0c;由于在武夷山地区首次发现&#xff0c;故命名为武夷林蛙。</p>\n<p>　　生态环境部南京环境科学研究所助理研究员胡亚萍介绍&#xff0c;油囊蘑属此前被记录分布在欧洲、北美洲的温带地区&#xff0c;武夷山国家公园属于亚热带地区&#xff0c;多形油囊蘑的发现&#xff0c;极大丰富了油囊蘑属的分布范围&#xff0c;为油囊蘑属物种的分布、起源、演化等研究提供了重要的基础数据。</p>\n<p>　　开展生物资源本底调查&#xff0c;摸清生物资源家底、掌握生物多样性状况是提升国家公园建设和管护水平的重要前提。今年4月以来&#xff0c;在上级部门的指导下&#xff0c;武夷山国家公园管理局组织生态环境部南京环境科学研究所等单位启动了为期3年的生物资源本底调查&#xff0c;以掌握区域内生物资源的种类、分布特征和动态变化。</p>\n<p>　　武夷山国家公园横跨福建、江西两省&#xff0c;生物资源丰富、生物多样性富集&#xff0c;保存着世界同纬度带最完整、最典型、面积最大的中亚热带原生性森林生态系统。据了解&#xff0c;自2016年以来&#xff0c;武夷山国家公园已发现雨神角蟾、福建天麻、武夷凤仙花、武夷山对叶兰、武夷山孩儿参等多个新物种。</p>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (14,'国家药品集采开展3年 老百姓用药便宜了多少？',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211104222620564_vor4h.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-08-14 14:13:43','2021-11-20 21:14:51','<p>　　2018年11月&#xff0c;中央全面深化改革委员会第五次会议审议通过了《国家组织药品集中采购试点方案》。随后&#xff0c;中国开始在全国4个直辖市和7个副省级城市进行带量采购试点&#xff0c;简称“4&#43;7”。</p>\n<p>　　如今&#xff0c;国家药品集采开展已经3年&#xff0c;成效如何&#xff1f;老百姓的药费降了吗&#xff1f;</p>\n<p>　<strong><span style=\"color:navy\">　五批集采覆盖218种药品 平均降价54%</span></strong></p>\n<p>　　2018年&#xff0c;伴随“4&#43;7”拉开大幕&#xff0c;药品提质降价成为主旋律。</p>\n<p>　　根据中国药学会和中国医疗保险研究会3日在北京发布的《中国医保药品管理改革进展与成效蓝皮书》&#xff0c;目前&#xff0c;国家组织药品集中带量采购已经成功开展五批&#xff0c;共覆盖218种药品&#xff0c;平均降价54%&#xff0c;中选药品价格从国际价格的2-3倍以上下降到与之相当的水平。</p>\n<p>　　数据显示&#xff0c;集采改革以来截至2021年9月&#xff0c;累计节约费用约2500亿元。</p>\n<p>　　从药品品类来看&#xff0c;国家组织药品集采已经覆盖高血压、糖尿病、高血脂、慢性乙肝等慢性病和常见病的主流用药。</p>\n<p>　　这其中&#xff0c;高血压用药21种&#xff0c;占降压药市场规模的50%以上&#xff0c;使用最广泛的苯磺酸氨氯地平片降价79%&#xff0c;年治疗费用从300元降至60元。</p>\n<p>　　糖尿病用药共有15种&#xff0c;涉及金额约占口服降糖药市场规模的60%以上&#xff0c;集采后平均降价69%&#xff0c;使用最广泛的盐酸二甲双胍片降价53%。</p>\n<p>　　乙肝治疗药物替诺福韦&#xff0c;集采前价格为10.61元/片&#xff0c;年治疗费用3800元&#xff0c;集采后价格降至平均0.38元/片&#xff0c;降幅高达96%&#xff0c;一年治疗费用降至137元。一线用药恩替卡韦和替诺福韦酯年均治疗费用也分别从5500元、6000元下降到70元、150元左右。</p>\n<p>　　在首都医科大学附属北京友谊医院肝病中心主任贾继东看来&#xff0c;随着医保目录的日益完善和药价降低&#xff0c;我国肝病药物选择更加合理&#xff0c;诊断和治疗率得到提高&#xff0c;从而减少肝硬化和肝癌的发生&#xff0c;实现了更优策略的保障目标。</p>\n<p><strong><span style=\"color:navy\">　　救命药可及性增强</span></strong></p>\n<p>　　2018年&#xff0c;电影《我不是药神》让外界对高价抗癌药的关注度提升。如今&#xff0c;通过一系列改革举措&#xff0c;抗癌药的可及性也在增强。</p>\n<p>　　以肿瘤治疗药物吉非替尼为例&#xff0c;集采前价格为132元/片&#xff0c;年治疗费用高达4.7万元以上&#xff0c;集采后价格降至平均41.8元/片&#xff0c;降幅达到69%&#xff0c;年治疗费被控制在了1.5万元左右&#xff0c;医保报销后患者个人仅承担约0.6万元&#xff0c;负担大大减轻。</p>\n<p>　　此外&#xff0c;国家药品准入谈判也提高了患者的用药水平。2018年谈判成功的17种抗癌药&#xff0c;2021年第一季度比谈判前&#xff0c;药品用量增加25.8倍、药品金额增加8.8倍。</p>\n<p>　　蓝皮书显示&#xff0c;2015年第一季度至2021年第一季度&#xff0c;医保药品中抗肿瘤药的金额占比呈上升趋势&#xff0c;从2015年第一季度的7.0%增长至2021年第一季度的13.9%。</p>\n<p>　　抗肿瘤药亚类的金额、用量及同比增长率在谈判药品的带动下都有明显提升。患者对抗肿瘤药的可及性和可负担性均获得较大程度提高。</p>\n<p>　　北京大学肿瘤医院医疗保险服务处处长冷家骅分析称&#xff0c;“随着国家医保局的成立和医保药品目录动态调整机制的建立和逐渐完善&#xff0c;肿瘤诊疗所需创新药物价格昂贵、使用途径不规范、市场供应有限的问题得到极大改善&#xff0c;救急救命的好药的大量引入&#xff0c;优化了目录结构&#xff0c;改善了医疗生态。”</p>\n<p><strong>　<span style=\"color:navy\">　原研药不再享受超国民待遇</span></strong></p>\n<p>　　国家组织药品集采还带来了群众用药质量水平大幅提升。</p>\n<p>　　带量采购将原研药与同等质量的仿制药放在同一平台公平竞争&#xff0c;竞争结果直接与销量挂钩。集采模式下&#xff0c;原研药不再享受超国民待遇&#xff0c;促进了优质仿制药对原研药的替代&#xff0c;大幅提升了群众用药的可及性。</p>\n<p>　　此次发布的蓝皮书显示&#xff0c;第一批集采药品原研药使用量占比从22%降至11%&#xff1b;其中&#xff0c;用量较大的阿托伐他汀钙片原研药占比在“4&#43;7”试点地区从50%降至25%&#xff0c;在其他地区从37%降至11%。</p>\n<p>　　从药品疗效来看&#xff0c;仿制药也没有令人失望。</p>\n<p>　　首都医科大学宣武医院药学部主任张兰根据真实世界研究得出&#xff0c;“4&#43;7”带量采购中标药品中&#xff0c;14个通过一致性评价的仿制药与原研药在临床上具有等效性&#xff0c;能够保障人民群众享受优质、价宜的药品。</p>\n<p>　　如今&#xff0c;为了享受改革红利、抢占市场&#xff0c;仿制药企业正不断加大一致性评价投入力度。</p>\n<p>　　来自蓝皮书的数据显示&#xff0c;截至2021年9月底&#xff0c;已有537个通用名品种、2696个产品通过一致性评价。</p>\n<p>　　分析认为&#xff0c;集采改革使得药品生产行业集中度进一步提升&#xff0c;头部药企将发展重心转向首仿、难仿药品的开发&#xff0c;提升了药品质量水平。</p>\n<p>　　而一系列举措背后&#xff0c;最终受益的将是每一位普通患者。&#xff08;记者 张尼&#xff09;</p>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (15,'教培机构如何转型？职教培训或是一条明路',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211104223430598_908j4.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-08-14 14:13:53','2022-01-05 22:04:43','<p>　　当前&#xff0c;“双减”政策落地&#xff0c;严控学科类培训&#xff0c;教育培训机构或可转型发力职业教育这一板块。</p>\n<p><strong>　　职业教育证书培训</strong></p>\n<p><strong>　　亟待教培机构深度参与</strong></p>\n<p>　　2019年&#xff0c;教育部等部门启动“1&#43;X证书”制度试点&#xff0c;要求职业院校学生毕业时要同时获得学历证书与若干技能等级证书。在政策推动下&#xff0c;在校学生职业技能培训或许是教育培训服务新的增长点。</p>\n<p>　　以浙江杭州的情形为例&#xff0c;31所中职学校已实现了“1&#43;X证书”培训全覆盖。目前看来&#xff0c;学校与教育培训机构的合作方式主要分为两类&#xff1a;一类是紧密合作型&#xff0c;通过共建产业学院等实体形式开展。证书培训纳入学校人才培养体系&#xff0c;学生和企业的认可度较高。另一类是购买服务型。部分学校通过购买培训视频、试题库等服务&#xff0c;并承担学生考证费、教师考评员费用&#xff0c;实现教育培训转移支付。</p>\n<p>　　教育培训机构进入职业教育证书培训领域&#xff0c;证书的含金量是关键。职业教育证书培训亟待更多规模型、领军型企业深度参与&#xff0c;不断增强社会对职业等级证书的认可度。</p>\n<p><strong>　　教培机构应转型&#xff0c;</strong></p>\n<p><strong>　　搭建职业技能人才供应桥梁</strong></p>\n<p>　　当前&#xff0c;中国教育普遍面临的困境是学校教育模式与众多企业实际需求的不匹配。此外&#xff0c;由于社会需求的多元化&#xff0c;新兴行业不断涌现&#xff0c;也需要岗位培训前置。搭建职业技能人才供应桥梁&#xff0c;探索职业教育需求下沉路径&#xff0c;应成为教育培训机构转型的着力点&#xff0c;是拓展职业教育服务领域的关键所在。</p>\n<p>　　具体而言&#xff0c;一方面通过与企业的合作&#xff0c;提供定向招募员工快速适岗培训服务&#xff0c;另一方面为院校提供课程体系、共建职业导向专业。教育培训企业的优势就在于可依托自身技术优势与教研能力&#xff0c;提供更有深度&#xff0c;更符合市场期待的培训解决方案。比如借助大数据分析&#xff0c;可做出行业就业人数预测模型&#xff0c;开展后备人才精准培训。至于发挥在线教育优势&#xff0c;提供适合成人的碎片化培训&#xff0c;更是教育培训企业大有可为的天地。</p>\n<p>　　此外&#xff0c;领军教育企业还可依托全球化布局的战略优势&#xff0c;引入海外先进的高端培训项目及更多国内有需求的国际技能证书&#xff0c;培养全球领先的技能型人才。</p>\n<p><strong>　　深耕合作新天地&#xff0c;</strong></p>\n<p><strong>　　正视行业老问题</strong></p>\n<p>　　职业教育为教育培训机构转型提供了新赛道&#xff0c;但一些现实存在的问题也需要正视。</p>\n<p>　　其一&#xff0c;如前所述&#xff0c;职业教育在校学生现阶段培训需求集中在考证上。相应地&#xff0c;获得教育部门认可的培训资质对于教培机构就尤为重要。由于“1&#43;X证书”体系是以企业为主导&#xff0c;机构难于凭一己之力获得职业教育细分领域的专业资质&#xff0c;如何取得相关企业背书&#xff0c;还需要政策性安排乃至制度性支持。</p>\n<p>　　其二&#xff0c;职业教育培训需要与学校深度合作。职业教育专业数量众多&#xff0c;学科内容分散&#xff0c;技能培训又多需设备支持。因此&#xff0c;无论是培训或是考证&#xff0c;都需要依托学校方可持续发展。目前&#xff0c;教育培训机构对职校教师的培训已有较多经验&#xff0c;接下来怎样拓展机构与学校合作领域&#xff0c;乃至探索共建“教研理事会”&#xff0c;以此推动职业教育类型化、个性化发展&#xff0c;值得教育培训机构深思。</p>\n<p>　　其三&#xff0c;短期就业培训亟待行业规范。此类培训&#xff0c;市场规范性较差&#xff0c;虚假宣传、收费过高等问题久受诟病。规模型教育培训机构如欲参与&#xff0c;当致力引导此类培训形成规范化机制&#xff0c;带动健康生态的培育。</p>\n<p>　　另外&#xff0c;在线教育有望成为职业教育培训主流&#xff0c;教育培训机构应利用自身相关技术与人才优势&#xff0c;有针对性地开发适合职业教育的培训内容&#xff0c;丰富职业教育在线学习的形式&#xff0c;为职业教育在“互联网&#43;”变革中找到高质量发展新模式&#xff0c;贡献独特的力量。</p>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (22,'国际奥委会北京冬奥会协调委员会召开第六次会议',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'新华社',NULL,NULL,'/uploads/1/image/2021/11/20211104222348689_qh9w7.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-09-06 06:48:03','2022-01-05 22:03:06','<p>　　新华社北京11月2日电 2日&#xff0c;国际奥委会北京2022年冬奥会协调委员会以视频形式召开第六次会议&#xff0c;就冬奥筹办最后阶段重点问题进行沟通协商。北京市委书记、北京冬奥组委主席蔡奇&#xff0c;国际奥委会北京2022年冬奥会协调委员会主席胡安·安·萨马兰奇通过视频致辞。</p>\n<p>　　11月2日&#xff0c;北京市委书记、北京冬奥组委主席蔡奇通过视频致辞。新华社记者鞠焕宗摄</p>\n<p>　　蔡奇在致辞中代表北京冬奥组委&#xff0c;向协调委员会各位委员长期以来给予北京冬奥会的支持帮助表示感谢。他说&#xff0c;北京2022年冬奥会和冬残奥会是我国重要历史节点的重大标志性活动。中国政府高度重视冬奥筹办工作&#xff0c;习近平主席多次深入赛区一线视察&#xff0c;召开专题会议研究部署&#xff0c;作出一系列重要指示&#xff0c;为我们做好筹办工作指明了方向。北京冬奥组委与国内外各方面紧密合作&#xff0c;全面落实绿色、共享、开放、廉洁的办奥理念&#xff0c;精益求精、稳步有序推进各项筹办任务。前不久&#xff0c;承载着奥林匹克精神的奥运火种顺利抵达北京&#xff0c;发布了《北京2022年冬奥会和冬残奥会防疫手册》&#xff0c;举办了北京冬奥会倒计时100天活动&#xff0c;公布了北京冬奥会和冬残奥会奖牌&#xff0c;赛事准备工作已基本准备就绪&#xff0c;正在举办系列国际测试赛进行全面检验。</p>\n<p>　　蔡奇说&#xff0c;当前&#xff0c;全球新冠肺炎疫情持续蔓延&#xff0c;给冬奥筹办工作带来挑战。希望国际奥委会和北京冬奥组委共同携手&#xff0c;心怀“一起向未来”的美好愿望&#xff0c;展现“更团结”的奥林匹克精神&#xff0c;引导各利益相关方遵守《防疫手册》规定。我们将努力克服各种困难挑战&#xff0c;圆满完成各项筹办任务&#xff0c;举办一届给世界留下深刻印象和美好回忆的奥运盛会。</p>\n<p>　　胡安·安·萨马兰奇在致辞中高度赞赏北京冬奥会和冬残奥会筹办工作。他说&#xff0c;国际测试赛正在进行中&#xff0c;赛事组织工作非常出色&#xff0c;参赛运动员和国际单项体育联合会对比赛场馆反馈极好。北京冬奥会宣传持续升温&#xff0c;冰雪运动和普及推广活动丰富多彩&#xff0c;“带动三亿人参与冰雪运动”的目标正在逐步实现。《防疫手册》的发布&#xff0c;更是为安全成功办赛作出贡献。国际奥委会将与北京冬奥组委保持沟通合作&#xff0c;共同克服各种困难&#xff0c;确保北京冬奥会成功举办。</p>\n<p>　　会议听取了北京冬奥会筹办工作最新进展和冬奥会防疫手册、测试赛及场馆、火炬传递、新闻宣传等内容的专题陈述。</p>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (23,'第一波“双11”数据背后，新消费的潜力有多大？',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211104223308496_acfyr.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-09-11 06:26:12','2022-01-05 22:02:07','<p id=\"ENAhO3AcQeYxURGy\">　　2021年的“双11”&#xff0c;比往年来得都要早。</p>\n<p id=\"ENAhO3AcQeYxURGy\"></p>\n<p id=\"18naz53YhvYr6v3w\">　　今年的“京东11.11全球热爱季”于10月31日晚8点全面启动&#xff0c;<strong>4个小时内累计售出商品超1.9亿件。</strong></p>\n<p id=\"gwaXcK3k2YQDhSJ1\">　　11月1日零时&#xff0c;天猫“双11”第一波正式开售&#xff0c;据不完全统计&#xff0c;<strong>天猫“双11”开售首小时&#xff0c;超2600个品牌的成交额超过去年11月1日全天。</strong>本季“双11”经历第一波“洪峰”&#xff0c;消费热情全面爆发。</p>\n<p id=\"WSdlEHpJF2GQbhOo\">　　“双11”从“光棍节”到“双节棍”再到全民狂欢&#xff0c;每一届的“双11”似乎都在拥抱变化&#xff0c;拥抱新的消费市场。与往年相比&#xff0c;今年“双11”有三大亮点&#xff1a;</p>\n<p id=\"ZOncgDqqSw7719sA\">　　<strong>一是直播带货已成为“双11”重要销售方式&#xff0c;改变了过去以“商品”为主的引流方式&#xff0c;向着以“内容”为主的引流方式转变。</strong>我们看到&#xff0c;除了短视频平台外&#xff0c;传统电商在今年“双11”都加大了直播渠道的营销投放力度&#xff0c;有更多的主播&#xff0c;更多的商家通过直播渠道来宣传“双11”的优惠商品和服务。</p>\n<p id=\"CC8u4GkP6ceeUETh\">　　<strong>二是消费者个性定制&#xff0c;从过去“商家卖什么&#xff0c;消费者买什么”&#xff0c;到现在“消费者要什么&#xff0c;商家生产什么”。</strong>平台可以根据海量用户数据&#xff0c;深度洞察消费者需求&#xff0c;与商家一起挖掘细分市场&#xff0c;打造单品爆款&#xff0c;实现供应链的智能化。消费者还可以根据个人喜好进行产品定制化生产&#xff0c;如私人订制的衬衫、家具等。</p>\n<p id=\"ATJHAHQz7S918OXM\">　　<strong>三是新国货成为“双11”重要的消费新增长点&#xff0c;消费者已从“只买国际大牌”到“要买国货潮牌”。</strong></p>\n<p id=\"F8evRgofRtjXpLpK\">　　从天猫“双11”开售首小时的数据来看&#xff0c;国货品牌的表现尤为抢眼。据中国经济网报道&#xff0c;鸿星尔克、五菱汽车、小鹏汽车、薇诺娜、云鲸、添可、林氏木业、牧高笛、回力、蕉下、褚橙、方回春堂、太平鸟、bosie等国货品牌&#xff0c;在1小时内就超过了去年全天的销售额。</p>\n<p id=\"BNwqmZfWMszX4BoM\">　　这里新国货既包括新生代品牌&#xff0c;也包括老品牌和老字号的焕新。新国货在美妆、家电、手机、汽车、服装等品类表现抢眼&#xff0c;尤其受到90后、00后年轻人的喜爱&#xff0c;正加速实现对国际品牌的全面赶超。新国货崛起靠的不是低价竞争&#xff0c;而是体现了消费者对商品性价比的追求。</p>\n<p>2020年11月10日&#xff0c;在中国邮政集团广州航空邮件处理中心&#xff0c;工作人员在总包待发区内作业。新华社记者 邓华 摄</p>\n<p id=\"qTAeEzwOvtEp4HD5\">　　在疫情防控进入新的平稳阶段下&#xff0c;作为线上最大的消费购物节&#xff0c;“双11”电商大促无疑对拉动消费具有积极作用。</p>\n<p id=\"g1VgOAwUwmEo5foU\">　　<strong>一是提振消费信心&#xff0c;助力经济增长。</strong>近年来&#xff0c;随着我国经济由高速增长阶段转向高质量发展阶段&#xff0c;消费作为经济增长“压舱石”的重要性日益凸显&#xff0c;消费日益成为拉动中国经济增长的第一动力。今年“双11”比往年开始得更早&#xff0c;将会对10月、11月两个月的实物商品网上零售额有明显的拉动作用。今年以来&#xff0c;我国网络零售市场继续保持稳步增长态势。前三季度&#xff0c;全国网上零售额达9.19万亿元&#xff0c;同比增长18.5%&#xff1b;其中&#xff0c;实物商品网上零售额7.5万亿元&#xff0c;同比增长15.2%&#xff0c;占社会消费品零售总额的比重为23.6%。</p>\n<p id=\"J49dY3wKTUv3dzyG\">　　预计“双11”将对10月、11月两个月的社会消费品零售总额增长有较大的带动作用&#xff0c;大大提振消费信心&#xff0c;彰显我国超大规模市场的无限潜力。</p>\n<p id=\"9jP3dRtmi3MAXGU1\">　　<strong>二是促进消费线上线下进一步融合&#xff0c;消费新模式、新业态层出不穷。</strong>“双11”有越来越多的平台和品牌重视线上和线下消费场景的整合。过去“双11”只是线上电商的“狂欢节”&#xff0c;近年来“双11”将营销进行了全渠道布局&#xff0c;实现了由线下门店体验向线上导流客源&#xff0c;再回到线下购买的数字营销&#xff0c;优化了消费者在线下门店的购物体验&#xff0c;助力了品牌私域流量打造。部分商家借“双11”推广与虚拟现实技术、物联网技术相融合的消费新业态&#xff0c;更多丰富、有趣的新消费形式&#xff0c;如无人超市、无人咖啡店等。</p>\n<p id=\"3ciBIx9wIjHPQDTU\">　　当前&#xff0c;消费已成为我国经济发展的主引擎&#xff0c;在扩大内需的背景下&#xff0c;把超大规模市场优势和消费潜力充分激发出来&#xff0c;是构建新发展格局的必然要求。进一步挖掘新经济拉动消费的潜力&#xff0c;一是要顺应消费升级趋势&#xff0c;借助新一代信息技术&#xff0c;提升传统消费&#xff0c;培育新型消费。积极推动线上线下消费有机融合&#xff0c;平台需要进一步赋能和服务实体经济。二是创新数字产品和服务供给&#xff0c;推动数字消费、服务消费快速发展。促进消费向绿色、健康、安全发展。三是要通过稳定就业、优化收入分配、改善消费环境、强化公共服务、创新消费促进机制等方式&#xff0c;进一步形成需求牵引供给、供给创造需求的更高水平动态平衡&#xff0c;为我国经济实现高质量发展、构建新发展格局注入新动能。</p>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (24,'智利前财长贝拉斯科：拉美经济难以回归增长轨迹',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211105135315234_m5q0c.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-11-04 23:28:40','2021-11-20 21:15:14','<p class=\"one-p\"><strong>参考消息网11月4日报道</strong>世界报业辛迪加网站11月1日发表智利前财政部长、前总统候选人安德烈斯·贝拉斯科的文章称&#xff0c;拉美经济难以回归增长轨迹。全文摘编如下&#xff1a;</p>\n<p class=\"one-p\">拉美人有很多天赋&#xff0c;其中一个是自我管理不善的非凡能力&#xff0c;就像疫情所表明的那样。在世界人均新冠死亡病例最多的20个国家中&#xff0c;有6个在拉丁美洲。</p>\n<p class=\"one-p\">贫困、医院床位短缺和住房过度拥挤都助长了病毒传播&#xff0c;但仅凭这些还无法解释为何该地区的表现如此糟糕。亚洲和非洲的许多国家也面临同样的问题&#xff0c;但人均死亡病例却较少。</p>\n<p class=\"one-p\">拉丁美洲再次做好了领先全球的准备——这一次是在疫情后的经济失败方面。在大宗商品价格高企的推动下&#xff0c;该地区经历了几个季度的强劲复苏&#xff0c;但一些国家的增长引擎已经开始熄火。国际货币基金组织&#xff08;IMF&#xff09;预计&#xff0c;拉丁美洲将成为2022年世界上增长最慢的地区&#xff0c;它可能永远也不会回到疫情前所展望的人均收入增长路线上了。相比之下&#xff0c;IMF预测发达经济体将很快恢复疫情前的发展轨迹。</p>\n<p class=\"one-p\">标准经济增长理论坚称穷国会逐渐赶上富国。拉丁美洲是这一规律中的例外&#xff1a;在可以预见的未来&#xff0c;它会落后得更多。</p>\n<p class=\"one-p\">过去&#xff0c;只要大宗商品价格下跌&#xff0c;该地区的经济就会变差。而这一次&#xff0c;它将在大宗商品的短暂繁荣期内变差&#xff0c;部分原因在于生产力和收入增长缓慢是长期存在的问题。从上世纪70年代到90年代&#xff0c;拉丁美洲错过了使东亚富裕起来的出口导向型制造业这艘船。21世纪&#xff0c;它又错过了使从保加利亚到越南在内的国家受益的供应链繁荣期。</p>\n<p class=\"one-p\">新冠疫情造成的经济创伤有可能进一步削弱长期增长表现。拉丁美洲学生在疫情期间的平均停课时间长达48周。在其他新兴经济体和发展中经济体&#xff0c;这一数字仅为30周。这对拉美生产力的影响将持续数十年——并进一步加剧收入不平等。</p>\n<p class=\"one-p\">投资骤降也在压低增长。最近在智利的一项调查显示&#xff0c;70%的企业已经搁置了扩张计划。原因不难理解。就在进行这项调查的同一个星期&#xff0c;圣地亚哥市中心遭到肆意破坏&#xff0c;同时智利人得知一名极右翼候选人与一名极左翼人士在11月21日总统大选前的民调中共同领跑。</p>\n<p class=\"one-p\">智利、巴西和哥伦比亚很快将举行总统选举&#xff0c;而第二轮投票很可能会是右翼“金刚”与左翼“哥斯拉”之间的对决。在电影中&#xff0c;两只怪兽大战留下的只有破坏。同样的情况很可能发生在拉丁美洲。</p>\n<p class=\"one-p\">此外&#xff0c;疫情可能即将结束&#xff0c;但债务危机的幽灵却正在逼近。公共和私人债务大幅增加、债务期限缩短以及全球利率上升是一个有害的组合。在包括巴西和阿根廷在内的好几个国家&#xff0c;政府负债率已经高得令人担忧。美联储的货币收紧政策一旦快于预期&#xff0c;可能会带来经常困扰该地区的那种债务挤兑和展期危机。</p>\n<p class=\"one-p\">尽管面临种种困难&#xff0c;如果能够抓住两个机会&#xff0c;拉丁美洲仍然能够重新实现增长&#xff1a;一个机会是疫情和中国与西方紧张关系加剧所导致的回流&#xff1b;加大对绿色基础设施的投资也会有所帮助。</p>\n<p class=\"one-p\">美洲开发银行表示&#xff0c;如果拉美国家政府减少退步的开支&#xff0c;就能够为绿色投资腾出空间。这是对的&#xff0c;但说起来容易做起来难。有权有势的人往往强烈希望得到不得人心的开支。退步的、对生态环境不友好的能源补贴就是一个例子。</p>\n<p class=\"one-p\">有句老话说&#xff1a;“巴西是未来之国&#xff0c;永远都是。”如今&#xff0c;太多管理不善的其他拉美国家也面临同样的命运。</p>\n<p class=\"one-p\"><img class=\"content-picture\" src=\"https://inews.gtimg.com/newsapp_bt/0/14139931877/1000\" /></p>\n<p class=\"one-p\">6月17日&#xff0c;一名工作人员在巴西圣保罗市的一家汽车影院引导车辆。新华社</p>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (25,'峰爆',NULL,NULL,NULL,NULL,0,NULL,'朱一龙黄志忠演绎中国式救援',NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211108190618610_tr5s3.jpg','/uploads/1/video_demo.mp4','1:34:08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-11-08 19:06:21','2021-11-18 16:06:34','');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (26,'Adobe Reader',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211110112249015_3npw8.jpg',NULL,NULL,'/uploads/1/file_demo.zip','下载演示_adobe_reader.zip',158,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-11-10 11:24:27','2021-11-20 13:06:03','<p><strong>Adobe Reader 官方中文版</strong>下载&#xff0c;支持打开和使用 Adobe PDF 的工具&#xff0c;可查看、打印和管理 PDF。若已经安装过之前的版本&#xff0c;请先卸载后再安装此版本&#xff01;</p>\n<p>在 Reader 中打开 PDF 后&#xff0c;可以使用多种工具快速查找信息。</p>\n<p>如果您收到一个 PDF 表单&#xff0c;则可以在线填写并以电子方式提交。</p>\n<p>如果收到审阅 PDF 的邀请&#xff0c;则可使用注释和标记工具为其添加批注。</p>\n<p>使用 Reader 的多媒体工具可以播放 PDF 中的视频和音乐。</p>\n<p>如果 PDF 包含敏感信息&#xff0c;则可利用数字身份证对文档进行签名或验证。</p>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (27,'火狐浏览器',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211110112529820_5igwi.jpg',NULL,NULL,'/uploads/1/file_demo.zip','下载演示_firefox.zip',158,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-11-10 11:25:57','2021-11-20 13:06:00','<p>Mozilla Firefox&#xff0c;中文名通常称为“火狐”或“火狐浏览器”&#xff0c;是一个开源网页浏览器&#xff0c;使用Gecko引擎&#xff08;非ie内核&#xff09;&#xff0c;支持多种操作系统如Windows、Mac和linux。</p>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (28,'WPS',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211110134344757_3nv60.png',NULL,NULL,'/uploads/1/file_demo.zip','下载演示_wps.zip',158,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-11-10 12:03:07','2021-11-20 13:05:57','<p>WPS Office是由金山软件股份有限公司自主研发的一款办公软件套装&#xff0c;可以实现办公软件最常用的文字、表格、演示等多种功能。具有内存占用低、运行速度快、体积小巧、强大插件平台支持、免费提供海量在线存储空间及文档模板、支持阅读和输出PDF文件、全面兼容微软格式&#xff08;doc/docx/xls/xlsx/ppt/pptx等&#xff09;独特优势。覆盖Windows、Linux、Android、iOS等多个平台。</p>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (29,'QQ',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211110120854616_w31vb.jpg',NULL,NULL,'/uploads/1/file_demo.zip','下载演示_qq.zip',158,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-11-10 12:09:27','2021-11-20 13:05:54','<p>免费的即时聊天软件&#xff0c;给上网带来更多沟通乐趣。腾讯QQ皮肤呈现视觉盛宴&#xff0c;皮肤编辑器实现个性化面板创意&#xff1b;QQ应用盒子全新呈现&#xff0c;丰富应用满足多彩生活&#xff1b;QQ短信首度面世&#xff0c;畅享无处不在的沟通体验&#xff1b;炫彩字体&#xff0c;炫出聊天个性与风采&#xff1b;QQ支持自定义标签&#xff0c;标签顺序随心换。提示&#xff1a;如果您正在运行着腾讯QQ或者TM ,请退出后再进行一键安装。</p>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (30,'VS Code 编辑器',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211110121255183_6aqfa.jpg',NULL,NULL,'/uploads/1/file_demo.zip','下载演示_vscode.zip',158,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-11-10 12:13:33','2021-11-20 13:05:51','<p>VSCode&#xff08;全称&#xff1a;Visual Studio Code&#xff09;是一款由微软开发且跨平台的免费源代码编辑器。该软件支持语法高亮、代码自动补全&#xff08;又称 IntelliSense&#xff09;、代码重构、查看定义功能&#xff0c;并且内置了命令行工具和 Git 版本控制系统。用户可以更改主题和键盘快捷方式实现个性化设置&#xff0c;也可以通过内置的扩展程序商店安装扩展以拓展软件功能。</p>\n<p>VS Code 使用 Monaco Editor 作为其底层的代码编辑器。</p>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (31,'关于我妈的一切',NULL,NULL,NULL,NULL,0,NULL,'徐帆张婧仪演绎中国式母女',NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211111105757848_bttmt.jpg','/uploads/1/video_demo.mp4','2:29:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-11-11 10:58:05','2021-11-18 16:06:27','');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (32,'热带雨',NULL,NULL,NULL,NULL,0,NULL,'南国春梦禁忌之恋',NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211111105937943_ttq2n.jpg','/uploads/1/video_demo.mp4','24:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-11-11 10:59:41','2021-11-18 16:06:43','');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (33,'夏日友晴天',NULL,NULL,NULL,NULL,0,NULL,'海怪男孩的梦幻冒险之旅',NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211111110031366_6gngc.jpg','/uploads/1/video_demo.mp4','10:45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-11-11 11:00:36','2021-11-18 16:06:13','');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (34,'新逃学威龙',NULL,NULL,NULL,NULL,0,NULL,'二龙湖浩哥&罗家英演绎爆笑喜剧',NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211111110118656_fcr3x.jpg','/uploads/1/video_demo.mp4','6:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-11-11 11:01:21','2021-11-18 16:06:03','');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (35,'星辰大海',NULL,NULL,NULL,NULL,0,NULL,'刘涛林峯上演豪门恋',NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211122154901380_aueka.jpg','/uploads/1/video_demo.mp4','18:37',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-11-11 11:03:05','2021-11-22 15:49:03','');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (36,'一见倾心',NULL,NULL,NULL,NULL,0,NULL,'司令夫妇星光甜吻表白',NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211122154637913_e1e7q.jpg','/uploads/1/video_demo.mp4','2:52:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-11-11 11:04:00','2021-11-22 15:46:42','');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (37,'美丽的日出日落风景',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211112181255426_puyn8.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-11-12 18:13:00','2021-11-12 18:23:14','');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (38,'清新穿衣搭配 尽显女神风范',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211112182335734_9p89i.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-11-12 18:19:18','2021-11-12 18:23:39','');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (39,'温柔娴静 五官精致',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211112182722661_3kbny.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-11-12 18:27:30','2021-11-12 18:27:39','');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (40,'优雅迷人 复古温柔',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211112182957845_keu7f.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-11-12 18:30:02','2022-01-05 21:51:28','');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (41,'亮片套装蛮腰吸睛 红唇雪肌明艳动人',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211112183104456_7499y.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-11-12 18:32:07','2022-01-05 21:51:04','');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (42,'浓眉攻守两端展现统治力',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211112183426133_uukxi.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-11-12 18:33:55','2021-11-14 21:21:41','');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (43,'iPhone 13 Pro Max',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211118164245284_ls4os.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-11-14 17:56:12','2021-11-20 21:16:26','<div class=\"techspecs-section section-splash-water-resistance\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">防溅、抗水、防尘</div>\n<div class=\"techspecs-column\">\n<p>效果在 IEC 60529 标准下达到 IP68 级别 (在最深 6 米的水下停留时间最长可达 30 分钟)</p>\n</div>\n</div>\n</div>\n<div class=\"techspecs-section section-chip\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">芯片</div>\n<div class=\"techspecs-column\">\n<div class=\"row\">\n<div class=\"column large-2 medium-3 small-12\"> </div>\n<div class=\"column copy large-10 medium-9 small-12 small-push-0\">\n<ul class=\"techspecs-list\"><li>A15 仿生芯片</li><li>全新 6 核中央处理器&#xff0c;具有 2 个性能核心和 4 个能效核心</li><li>全新 5 核图形处理器</li><li>全新 16 核神经网络引擎</li></ul>\n</div>\n</div>\n</div>\n</div>\n</div>\n<div class=\"techspecs-section section-camera\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">摄像头</div>\n<div class=\"techspecs-column\">\n<ul class=\"techspecs-list\"><li>Pro 级 1200 万像素摄像头系统 (长焦、广角及超广角)</li><li>长焦&#xff1a;ƒ/2.8 光圈</li><li>广角&#xff1a;ƒ/1.5 光圈</li><li>超广角&#xff1a;ƒ/1.8 光圈和 120° 视角</li><li>3 倍光学变焦 (放大)&#xff0c;2 倍光学变焦 (缩小)&#xff1b;6 倍光学变焦范围</li><li>最高可达 15 倍数码变焦</li><li>夜间模式人像 (通过激光雷达扫描仪实现)</li><li>人像模式&#xff0c;支持先进的焦外成像和景深控制</li><li>人像光效&#xff0c;支持六种效果 (自然光、摄影室灯光、轮廓光、舞台光、单色舞台光和高调单色光)</li><li>双摄像头光学图像防抖功能 (长焦和广角)</li><li>传感器位移式光学图像防抖功能 (广角)</li><li>六镜式镜头 (长焦和超广角)&#xff1b;七镜式镜头 (广角)</li><li>原彩闪光灯&#xff0c;支持慢速同步</li><li>全景模式 (最高可达 6300 万像素)</li><li>蓝宝石玻璃镜头表面</li><li>100% Focus Pixels (广角)</li><li>夜间模式</li><li>深度融合技术</li><li>智能 HDR 4</li><li>摄影风格</li><li>微距摄影</li><li>Apple ProRAW</li><li>拍摄广色域的照片和实况照片</li><li>镜头畸变校正 (超广角)</li><li>先进的红眼校正功能</li><li>照片地理标记功能</li><li>自动图像防抖功能</li><li>连拍快照模式</li><li>图像拍摄格式&#xff1a;HEIF 和 JPEG</li></ul>\n</div>\n</div>\n</div>\n<div class=\"techspecs-section section-video-recording\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">视频拍摄</div>\n<div class=\"techspecs-column\">\n<ul class=\"techspecs-list\"><li>电影效果模式可拍摄浅景深视频 (1080p&#xff0c;30 fps)</li><li>杜比视界 HDR 视频拍摄&#xff0c;最高可达 4K&#xff0c;60 fps</li><li>4K 视频拍摄&#xff0c;24 fps、25 fps、30 fps 或 60 fps</li><li>1080p 高清视频拍摄&#xff0c;25 fps、30 fps 或 60 fps</li><li>720p 高清视频拍摄&#xff0c;30 fps</li><li>ProRes 视频拍摄&#xff0c;最高可达 4K&#xff0c;30 fps (128GB 容量机型最高可达 1080p&#xff0c;30 fps)</li><li>双摄像头视频光学图像防抖功能 (长焦和广角)</li><li>传感器位移式视频光学图像防抖功能 (广角)</li><li>3 倍光学变焦 (放大)&#xff0c;2 倍光学变焦 (缩小)&#xff1b;6 倍光学变焦范围</li><li>最高可达 9 倍数码变焦</li><li>音频变焦</li><li>原彩闪光灯</li><li>视频快录功能</li><li>慢动作视频&#xff0c;1080p (120 fps 或 240 fps)</li><li>延时摄影视频&#xff0c;支持防抖功能</li><li>夜间模式延时摄影</li><li>影院级视频防抖功能 (4K、1080p 和 720p)</li><li>连续自动对焦视频</li><li>4K 视频录制过程中拍摄 800 万像素静态照片</li><li>变焦播放</li><li>视频录制格式&#xff1a;HEVC 和 H.264</li><li>立体声录音</li></ul>\n</div>\n</div>\n</div>\n<div class=\"techspecs-section section-truedepth-camera\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">原深感摄像头</div>\n<div class=\"techspecs-column\">\n<ul class=\"techspecs-list\"><li>1200 万像素摄像头</li><li>ƒ/2.2 光圈</li><li>人像模式&#xff0c;支持先进的焦外成像和景深控制</li><li>人像光效&#xff0c;支持六种效果 (自然光、摄影室灯光、轮廓光、舞台光、单色舞台光和高调单色光)</li><li>动话表情和拟我表情</li><li>夜间模式</li><li>深度融合技术</li><li>智能 HDR 4</li><li>摄影风格</li><li>Apple ProRAW</li><li>电影效果模式可拍摄浅景深视频 (1080p&#xff0c;30 fps)</li><li>杜比视界 HDR 视频拍摄&#xff0c;最高可达 4K&#xff0c;60 fps</li><li>4K 视频拍摄&#xff0c;24 fps、25 fps、30 fps 或 60 fps</li><li>1080p 高清视频拍摄&#xff0c;25 fps、30 fps 或 60 fps</li><li>ProRes 视频拍摄&#xff0c;最高可达 4K&#xff0c;30 fps (128GB 容量机型最高可达 1080p&#xff0c;30 fps)</li><li>慢动作视频&#xff0c;1080p (120 fps)</li><li>延时摄影视频&#xff0c;支持防抖功能</li><li>夜间模式延时摄影</li><li>影院级视频防抖功能 (4K、1080p 和 720p)</li><li>视频快录功能</li><li>拍摄广色域的照片和实况照片</li><li>镜头畸变校正</li><li>视网膜屏闪光灯</li><li>自动图像防抖功能</li><li>连拍快照模式</li></ul>\n</div>\n</div>\n</div>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (44,'Apple iPad Pro 12.9',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211118164237664_e7b1v.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-11-14 18:11:06','2021-11-20 21:16:23','<div class=\"techspecs-section section-chip\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">芯片</div>\n<div class=\"techspecs-column row\">\n<div class=\"column column-chip-image large-2 medium-3 small-12\"> </div>\n<div class=\"column column-chip-copy large-10 medium-9 small-12\">\n<ul class=\"techspecs-list\"><li>Apple M1 芯片</li><li>8 核中央处理器&#xff0c;具有 4 个性能核心和 4 个能效核心</li><li>8 核图形处理器</li><li>16 核神经网络引擎</li><li>8GB 内存 (存储容量为 128GB、256GB 或 512GB 的机型)</li><li>16GB 内存 (存储容量为 1TB 或 2TB 的机型)</li></ul>\n</div>\n</div>\n</div>\n</div>\n<div class=\"techspecs-section section-camera\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">摄像头</div>\n<div class=\"techspecs-column\">\n<ul class=\"techspecs-list\"><li>Pro 级摄像头系统&#xff1a;广角和超广角摄像头</li><li>广角&#xff1a;1200 万像素和 ƒ/1.8 光圈</li><li>超广角&#xff1a;1000 万像素、ƒ/2.4 光圈和 125° 视角</li><li>2 倍光学变焦 (缩小)</li><li>最高可达 5 倍数码变焦</li><li>五镜式镜头 (广角和超广角)</li><li>亮度更高的原彩闪光灯</li><li>全景模式 (最高可达 6300 万像素)</li><li>蓝宝石玻璃镜头表面</li><li>Focus Pixels 自动对焦 (广角)</li><li>智能 HDR 3</li><li>拍摄广色域的照片和实况照片</li><li>镜头畸变校正 (超广角)</li><li>先进的红眼校正功能</li><li>照片地理标记功能</li><li>自动图像防抖功能</li><li>连拍快照模式</li><li>图像拍摄格式&#xff1a;HEIF 和 JPEG</li></ul>\n</div>\n</div>\n</div>\n<div class=\"techspecs-section section-video-recording\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">视频拍摄</div>\n<div class=\"techspecs-column\">\n<ul class=\"techspecs-list\"><li>4K 视频拍摄&#xff1a;24 fps、25 fps、30 fps 或 60 fps (广角)</li><li>1080p 高清视频拍摄&#xff1a;25 fps、30 fps 或 60 fps</li><li>720p 高清视频拍摄&#xff1a;30 fps</li><li>2 倍光学变焦 (缩小)</li><li>音频变焦</li><li>亮度更高的原彩闪光灯</li><li>1080p 慢动作视频&#xff1a;120 fps 或 240 fps</li><li>延时摄影视频 (支持防抖功能)</li><li>扩展的动态范围适用于最高达 30 fps 的视频拍摄</li><li>影院级视频防抖功能 (4K、1080p 和 720p)</li><li>连续自动对焦视频</li><li>变焦播放</li><li>视频录制格式&#xff1a;HEVC 和 H.264</li><li>立体声录音</li></ul>\n</div>\n</div>\n</div>\n<div class=\"techspecs-section section-truedepth-camera\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">原深感摄像头</div>\n<div class=\"techspecs-column\">\n<ul class=\"techspecs-list\"><li>1200 万像素超广角摄像头&#xff0c;122° 视角</li><li>ƒ/2.4 光圈</li><li>人像模式&#xff0c;支持先进的焦外成像和景深控制</li><li>人像光效&#xff0c;支持六种效果 (自然光、摄影室灯光、轮廓光、舞台光、单色舞台光和高调单色光)</li><li>动话表情和拟我表情</li><li>智能 HDR 3</li><li>1080p 高清视频拍摄&#xff1a;25 fps、30 fps 或 60 fps</li><li>延时摄影视频 (支持防抖功能)</li><li>扩展的动态范围适用于最高达 30 fps 的视频拍摄</li><li>影院级视频防抖功能 (1080p 和 720p)</li><li>拍摄广色域的照片和实况照片</li><li>镜头畸变校正</li><li>视网膜屏闪光灯</li><li>自动图像防抖功能</li><li>连拍快照模式</li></ul>\n</div>\n</div>\n</div>\n<div class=\"techspecs-section section-video-calling\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">视频通话<sup class=\"footnote footnote-number\"><a href=\"https://www.apple.com.cn/ipad-pro/specs/#footnote-4\" rel=\"nofollow\">3</a></sup></div>\n<div class=\"techspecs-column\">\n<ul class=\"techspecs-list\"><li>FaceTime 视频通话</li><li>人物居中</li><li>使用 iPad 通过无线局域网或蜂窝网络与任何支持 FaceTime 通话功能的设备进行视频通话</li></ul>\n</div>\n</div>\n</div>\n<div class=\"techspecs-section section-speakers\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">扬声器</div>\n<div class=\"techspecs-column\">\n<ul class=\"techspecs-list\"><li>四扬声器系统</li></ul>\n</div>\n</div>\n</div>\n<div class=\"techspecs-section section-microphones\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">麦克风</div>\n<div class=\"techspecs-column\">\n<ul class=\"techspecs-list\"><li>五个录音棚级麦克风&#xff0c;可用于通话、视频拍摄和音频录制</li></ul>\n</div>\n</div>\n</div>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (45,'MacBook Pro 16',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211118164225222_8sby8.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-11-14 18:15:37','2021-11-20 21:16:20','<div class=\"techspecs-section section-display\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">显示屏</div>\n<div class=\"techspecs-column\">\n<p class=\"techspecs-subheader\">Liquid 视网膜 XDR 显示屏</p>\n<p>14.2 英寸 (对角线) Liquid 视网膜 XDR 显示<span class=\"nowrap\">屏<sup class=\"footnote footnote-number\"><a href=\"https://www.apple.com.cn/macbook-pro-14-and-16/specs/#footnote-1\" rel=\"nofollow\">1</a></sup>&#xff1b;</span>初始分辨率 3024 x 1964<br class=\"large\" />(254 ppi)</p>\n<br />\n<p class=\"techspecs-subheader\">XDR (极致动态范围)</p>\n<p> </p>\n<p>最高可达 1000 尼特持续 (全屏) 亮度&#xff0c;1600 尼特峰值亮度</p>\n<p>1000000:1 对比度</p>\n<p> </p>\n<p class=\"techspecs-subheader\">色彩</p>\n<p> </p>\n<p>10 亿色彩</p>\n<p>广色域 (P3)</p>\n<p>原彩显示技术</p>\n<p> </p>\n<p class=\"techspecs-subheader\">刷新率</p>\n<p> </p>\n<p>ProMotion 自适应刷新率技术&#xff0c;最高可达 120Hz</p>\n<p>固定刷新率&#xff1a;47.95Hz、48.00Hz、50.00Hz、59.94Hz、60.00Hz</p>\n<p> </p>\n</div>\n</div>\n</div>\n<div class=\"techspecs-section section-memory\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">内存</div>\n<div class=\"techspecs-column\">\n<p class=\"techspecs-subheader\">16GB</p>\n<p>16GB 统一内存</p>\n<p class=\"techspecs-subheader\">可选配&#xff1a;</p>\n<p>32GB (M1 Pro 或 M1 Max 机型) 或 64GB (M1 Max 机型)</p>\n</div>\n</div>\n</div>\n<div class=\"techspecs-section section-battery-and-power\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">电池和电源<sup class=\"footnote footnote-number\"><a href=\"https://www.apple.com.cn/macbook-pro-14-and-16/specs/#footnote-2\" rel=\"nofollow\">2</a></sup></div>\n<div class=\"techspecs-column\">\n<p>最长可达 17 小时的 Apple TV app 影片<span class=\"nowrap\">播放</span></p>\n<p>最长可达 11 小时的无线上网</p>\n<p>70 瓦时锂聚合物电池<sup class=\"footnote footnote-number\"><a href=\"https://www.apple.com.cn/macbook-pro-14-and-16/specs/#footnote-2\" rel=\"nofollow\">2</a></sup></p>\n<p>67W USB-C 电源适配器 (随附于 8 核中央处理器的 M1 Pro 机型)</p>\n<p>96W USB-C 电源适配器 (随附于 10 核中央处理器的 M1 Pro 或 M1 Max 机型&#xff1b;8 核中央处理器的 M1 Pro 机型可选配)</p>\n<p>USB-C 转 MagSafe 3 连接线</p>\n<p>可快速充电 (使用 96W USB-C 电源适配器)</p>\n</div>\n</div>\n</div>\n<div class=\"techspecs-section section-storage\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">存储设备<sup class=\"footnote footnote-number\"><a href=\"https://www.apple.com.cn/macbook-pro-14-and-16/specs/#footnote-3\" rel=\"nofollow\">3</a></sup></div>\n<div class=\"techspecs-column\">\n<p class=\"techspecs-subheader\">512GB</p>\n512GB 固态硬盘\n<p class=\"techspecs-subheader\">可选配&#xff1a;</p>\n1TB、2TB、4TB 或 8TB</div>\n<div class=\"techspecs-column\">\n<p class=\"techspecs-subheader\">1TB</p>\n1TB 固态硬盘\n<p class=\"techspecs-subheader\">可选配&#xff1a;</p>\n2TB、4TB 或 8TB</div>\n</div>\n</div>\n<div class=\"techspecs-section section-charging-and-expansion\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">充电和外设扩展</div>\n<div class=\"techspecs-column small-spans-2-columns\">\n<p class=\"techspecs-subheader\"> </p>\n<p><span class=\"techspecs-subheader\">SDXC 卡插槽</span></p>\n<p><span class=\"techspecs-subheader\">HDMI 端口</span></p>\n<p><span class=\"techspecs-subheader\">3.5 毫米耳机插孔</span></p>\n<p><span class=\"techspecs-subheader\">MagSafe 3 端口</span></p>\n<p><span class=\"techspecs-subheader\">三个雷雳 4 (USB-C) 端口&#xff0c;均可支持&#xff1a;</span></p>\n<p>充电</p>\n<p>DisplayPort</p>\n<p>雷雳 4 (速率最高可达 40Gb/s)</p>\n<p>USB 4 (速率最高可达 40Gb/s)</p>\n<span class=\"caption caption-1\">SDXC 卡插槽</span> <span class=\"caption caption-2\">雷雳 4</span> <span class=\"caption caption-3\">HDMI</span><span class=\"caption caption-4\">MagSafe 3</span><span class=\"caption caption-5\">雷雳 4</span><span class=\"caption caption-6\">耳机插孔</span> </div>\n</div>\n</div>\n<div class=\"techspecs-section section-video-support\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">视频支持</div>\n<div class=\"techspecs-column small-spans-2-columns\">\n<p class=\"techspecs-subheader\">同时支持初始分辨率下的内置显示屏 (可显示十亿色彩) 以及&#xff1a;</p>\n<p>多达两台分辨率最高达 6K (60Hz) 的外接显示器&#xff0c;支持超过十亿色彩 (M1 Pro 机型)&#xff1b;或<br class=\"large\" />多达三台分辨率最高达 6K (60Hz) 的外接显示器&#xff0c;以及一台分辨率最高达 4K (60Hz) 的外接显示器&#xff0c;均支持超过十亿色彩 (M1 Max 机型)</p>\n<p class=\"techspecs-subheader\">雷雳 4 数字视频输出</p>\n<p>通过 USB‑C 进行原生 DisplayPort 输出</p>\n<p>使用转换器支持进行 VGA、HDMI、DVI 和雷雳 2 输出 (转换器需单独<span class=\"nowrap\">购买)</span></p>\n<p class=\"techspecs-subheader\">HDMI 数字视频输出</p>\n<p>支持一台分辨率最高达 4K (60Hz) 的显示器</p>\n<p>使用 HDMI 转 DVI 转换器进行 DVI 输出 (转换器需单独购买)</p>\n</div>\n</div>\n</div>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (46,'捷安特 TCR ADV SL 0 DISC',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211118164216015_x598j.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-11-14 18:31:45','2021-11-20 21:16:17','<p><strong>顶级效率</strong></p>\n<p>以先进的碳纤制造工艺&#xff0c;打造业界最强刚性/重量比车架&#xff1b;</p>\n<p>增加空力通常意味着增加重量&#xff0c;为了实现保持同级内最佳刚性重量比的目标&#xff0c;必须尽可能降低重量&#xff0c;以平衡为空力所新增的车架面积。这个目标是以四个最先进的制造工艺来实现。</p>\n<p><strong>顶尖空力</strong></p>\n<p>以整合式空气力学设计为核心&#xff0c;我们在德国Immenstaad的GST风洞实验室&#xff0c;将车架、前叉、零组件和轮组系统全数纳入&#xff0c;完善了整体空力系统&#xff1b;</p>\n<p>全新TCR在空力性能上面有着长足的突破&#xff0c;相比前一代TCR可说是最有感的性能提升。逐一分析、验证和测试每一管件外形&#xff0c;达成在大范围的侧风角度下都显著的降低骑乘风阻。这是在冲刺和单飞时&#xff0c;有史以来最快的TCR。</p>\n<p><strong>全面操控</strong></p>\n<p>凭借完全整合的碟煞科技&#xff0c;全新TCR Advanced SL Disc无论晴雨天气&#xff0c;都 有着优越的制动力和刹车手感。此性能需求来自专业公路选手&#xff0c;他们终日在 高速下坡和过弯的各种路面上征战数小时。</p>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (47,'捷安特 XTC ADV SL 1',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211118164200397_fjk26.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-11-14 21:25:33','2021-11-20 21:16:14','<p>超轻量、超高效率的越野车&#xff0c;是捷安特XC选手挑战世界杯赛事的最佳武器&#xff1b;</p>\n<p>以ADVANCED SL碳纤手工打造&#xff0c;专为快速、稳定的29寸车架设计&#xff0c;表现出超强的灵敏性和高效率。</p>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (48,'佳能 RF50mm F1.8 STM',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211118164143293_bh9k6.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-11-14 21:36:32','2021-11-20 21:16:10','<p>小型轻量又亲民的F1.8大光圈标准定焦镜头</p>\n<p class=\"icp-mb80 icp-center\">一直以来&#xff0c;佳能50mm F1.8级别的大光圈标准定焦镜头因其广泛的适用性、明亮的大光圈以及小巧轻便的镜身&#xff0c;从胶片机时代就受到了广大摄影爱好者的喜爱。</p>\n<p class=\"icp-mb80 icp-center\">RF50mm F1.8 STM发挥了RF卡口短后对焦距离的优势&#xff0c;采用了1片非球面镜片&#xff0c;并针对RF卡口进行了优化配置&#xff0c;实现了高画质与小型轻量的兼备。</p>\n<p class=\"icp-mb80 icp-center\">这样一款轻巧的F1.8大光圈镜具备高性价比&#xff0c;让更多普通用户能够轻松拥有&#xff0c;体验大光圈的魅力。</p>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (49,'佳能 RF35mm F1.8 MACRO IS STM',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211118164131270_159y8.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-11-14 21:37:50','2021-11-20 21:16:06','<p>小型轻量通用性强的F1.8大光圈RF广角微距镜头</p>\n<p class=\"icp-mb80 icp-center\">佳能EOS R系列专用微距镜头&#xff0c;利用RF卡口大口径与短后对焦距离&#xff0c;实现了镜头高画质与光学结构的小型化。</p>\n<p class=\"icp-mb80 icp-center\">镜头35mm的焦距与F1.8的大光圈&#xff0c;适合日常街拍等&#xff0c;小型轻量化的机身为日常携带提供了保障。</p>\n<p class=\"icp-mb80 icp-center\">约0.5倍的最大放大倍率&#xff0c;可将被摄体拍大&#xff0c;呈现出精致的细节及梦幻般的照片效果。</p>\n<p class=\"icp-mb80 icp-center\">采用双重IS影像稳定器&#xff0c;防抖效果最大5级&#xff0c;可有效抑制拍摄时的抖动。</p>\n<p class=\"icp-mb80 icp-center\">此外&#xff0c;镜头可安装佳能微距闪光灯&#xff0c;便于微距作品创作。</p>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (50,'佳能 RF50mm F1.2 L USM',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211118164118336_t9ca3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-11-14 21:39:09','2021-11-20 21:16:03','<p>F1.2大光圈下兼具高画质的RF标准定焦镜头</p>\n<p class=\"icp-mb80 icp-center\">佳能EOS R系列专用镜头&#xff0c;镜头设计运用了RF卡口大口径与短后对焦距离&#xff0c;使F1.2大光圈与高画质兼备。</p>\n<p class=\"icp-mb80 icp-center\">镜头采用了3片非球面镜片与1片UD&#xff08;超低色散&#xff09;镜片的搭配&#xff0c;并使用了新玻璃材料镜片&#xff0c;通过合理的镜片布局&#xff0c;有效抑制多种像差的同时&#xff0c;实现了F1.2光圈下画面中心到边缘的高画质表现。</p>\n<p class=\"icp-mb80 icp-center\">ASC镀膜的采用&#xff0c;提升了镜头防反射的效果&#xff0c;从而抑制眩光与鬼影的产生。获得清晰通透的效果。</p>\n<p class=\"icp-mb80 icp-center\">F1.2的大光圈配合令人叹服的高画质表现&#xff0c;为专业摄影师提供了更多创作的感动。</p>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (51,'佳能 RF24-70mm F2.8 L IS USM',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211118164107120_casro.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-11-14 21:40:41','2021-11-20 21:16:00','<p>覆盖经典焦段&#xff0c;具备IS影像稳定器的新生“大三元”</p>\n<p class=\"icp-mb80 icp-center\">RF卡口的专用镜头&#xff0c;焦距覆盖24mm广角到70mm中远摄的经典焦段&#xff0c;是新生RF系列“大三元”中备受瞩目的镜头之一。</p>\n<p class=\"icp-mb80 icp-center\">得易于RF卡口大口径与短后对焦距离的优势&#xff0c;在实现画面整体高画质&#xff0c;且不增加镜头体积的前提下&#xff0c;配备了IS影像稳定器&#xff0c;具有最大5级的手抖动补偿效果。配合恒定F2.8的大光圈与利用率很高的镜头焦距&#xff0c;能够应对婚纱、人像、街拍、风光等非常丰富的拍摄题材&#xff0c;用途广泛。</p>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (52,'佳能 RF70-200mm F2.8 L IS USM',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211118164011361_t92c6.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2021-11-14 21:42:07','2021-11-20 21:15:56','<p>新生“大三元”&#xff0c;5级防抖且大幅小型化的RF“小白IS”</p>\n<p class=\"icp-mb80 icp-center\">佳能EOS R系列专用“大三元”镜头&#xff0c;得益于佳能自主研发的大口径RF卡口与短后对焦距离带来的光学设计灵活性&#xff0c;基于UD非球面镜片、双NANO USM超声波马达的电子浮动对焦机构等多项技术的导入&#xff0c;实现了镜头长度的大幅缩减&#xff0c;具有非常好的机动性与便携性。并具备与备受好评的EF 70-200mm f/2.8L IS III USM相同甚至更好的画质表现。</p>\n<p class=\"icp-mb80 icp-center\">不吝惜地导入高级光学设计使最近对焦距离缩短至约0.7米&#xff0c;整个变焦区域下最近到最远焦距下都能获得高画质表现。</p>\n<p class=\"icp-mb80 icp-center\">最大相当于5级快门速度的防抖效果&#xff0c;加上小型轻量镜身&#xff0c;让手持拍摄更加安心。</p>\n<p class=\"icp-mb80 icp-center\">镜头采用防尘防水滴结构、实施防污氟镀膜&#xff0c;具有很高的可靠性。适用于人像、动物、体育、新闻报道等广泛领域。</p>');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (53,'Freemarker参考手册',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211118164704288_njy3g.png',NULL,NULL,NULL,NULL,NULL,'/uploads/1/freemarker_manual_zh_cn.pdf','FreeMarker中文手册.pdf',2413908,NULL,1,NULL,NULL,'2021-11-14 22:17:20','2021-11-18 16:47:07','');
INSERT INTO ujcms_article_ext (id_, title_, subtitle_, full_title_, alias_, link_url_, target_blank_, seo_keywords_, seo_description_, author_, editor_, source_, offline_date_, sticky_date_, image_, video_, video_time_, file_, file_name_, file_length_, doc_, doc_name_, doc_length_, article_template_, allow_comment_, static_file_, mobile_static_file_, created_, modified_, text_) VALUES (54,'Spring Boot Reference Documentation',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/uploads/1/image/2021/11/20211118164649038_maqmg.png',NULL,NULL,NULL,NULL,NULL,'/uploads/1/freemarker_manual_zh_cn.pdf','FreeMarker中文手册.pdf',2413908,NULL,1,NULL,NULL,'2021-11-15 21:15:41','2021-11-18 16:46:54','');
INSERT INTO ujcms_article_image (article_id_, url_, description_, order_) VALUES (37,'/uploads/1/image/2021/11/20211112181242149_b7voo.jpg','',32767);
INSERT INTO ujcms_article_image (article_id_, url_, description_, order_) VALUES (37,'/uploads/1/image/2021/11/20211112181242418_7olxk.jpg','',32767);
INSERT INTO ujcms_article_image (article_id_, url_, description_, order_) VALUES (37,'/uploads/1/image/2021/11/20211112181242454_v9mmp.jpg','',32767);
INSERT INTO ujcms_article_image (article_id_, url_, description_, order_) VALUES (37,'/uploads/1/image/2021/11/20211112181242446_1fsr0.jpg','',32767);
INSERT INTO ujcms_article_image (article_id_, url_, description_, order_) VALUES (37,'/uploads/1/image/2021/11/20211112181242471_w5cci.jpg','',32767);
INSERT INTO ujcms_article_image (article_id_, url_, description_, order_) VALUES (38,'/uploads/1/image/2021/11/20211112181835422_e4j2k.jpg','',32767);
INSERT INTO ujcms_article_image (article_id_, url_, description_, order_) VALUES (38,'/uploads/1/image/2021/11/20211112181835756_xhyeo.jpg','',32767);
INSERT INTO ujcms_article_image (article_id_, url_, description_, order_) VALUES (38,'/uploads/1/image/2021/11/20211112181835756_l6ylw.jpg','',32767);
INSERT INTO ujcms_article_image (article_id_, url_, description_, order_) VALUES (39,'/uploads/1/image/2021/11/20211112182654849_kemtl.jpg','',32767);
INSERT INTO ujcms_article_image (article_id_, url_, description_, order_) VALUES (39,'/uploads/1/image/2021/11/20211112182654847_0uq5o.jpg','',32767);
INSERT INTO ujcms_article_image (article_id_, url_, description_, order_) VALUES (39,'/uploads/1/image/2021/11/20211112182654862_t0q85.jpg','',32767);
INSERT INTO ujcms_article_image (article_id_, url_, description_, order_) VALUES (39,'/uploads/1/image/2021/11/20211112182654870_gl8rg.jpg','',32767);
INSERT INTO ujcms_article_image (article_id_, url_, description_, order_) VALUES (39,'/uploads/1/image/2021/11/20211112182654870_wrdu4.jpg','',32767);
INSERT INTO ujcms_article_image (article_id_, url_, description_, order_) VALUES (42,'/uploads/1/image/2021/11/20211112183234907_ch5kw.jpg','',32767);
INSERT INTO ujcms_article_image (article_id_, url_, description_, order_) VALUES (42,'/uploads/1/image/2021/11/20211112183234907_9xnib.jpg','',32767);
INSERT INTO ujcms_article_image (article_id_, url_, description_, order_) VALUES (42,'/uploads/1/image/2021/11/20211112183234907_8swxk.jpg','',32767);
INSERT INTO ujcms_article_image (article_id_, url_, description_, order_) VALUES (41,'/uploads/1/image/2022/01/20220105215049954_9xhpe.jpg','',32767);
INSERT INTO ujcms_article_image (article_id_, url_, description_, order_) VALUES (41,'/uploads/1/image/2022/01/20220105215049954_gpfsk.jpg','',32767);
INSERT INTO ujcms_article_image (article_id_, url_, description_, order_) VALUES (41,'/uploads/1/image/2022/01/20220105215049954_97jm2.jpg','',32767);
INSERT INTO ujcms_article_image (article_id_, url_, description_, order_) VALUES (41,'/uploads/1/image/2022/01/20220105215049954_3u2m5.jpg','',32767);
INSERT INTO ujcms_article_image (article_id_, url_, description_, order_) VALUES (41,'/uploads/1/image/2022/01/20220105215049954_5h18u.jpg','',32767);
INSERT INTO ujcms_article_image (article_id_, url_, description_, order_) VALUES (40,'/uploads/1/image/2022/01/20220105215123966_e3gf1.jpg','',32767);
INSERT INTO ujcms_article_image (article_id_, url_, description_, order_) VALUES (40,'/uploads/1/image/2022/01/20220105215123974_9kag6.jpg','',32767);
INSERT INTO ujcms_article_image (article_id_, url_, description_, order_) VALUES (40,'/uploads/1/image/2022/01/20220105215123966_npvr7.jpg','',32767);
INSERT INTO ujcms_article_image (article_id_, url_, description_, order_) VALUES (40,'/uploads/1/image/2022/01/20220105215123981_p4pvt.jpg','',32767);
INSERT INTO ujcms_article_image (article_id_, url_, description_, order_) VALUES (40,'/uploads/1/image/2022/01/20220105215123974_gibmm.jpg','',32767);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (15,18918,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (3,18924,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (23,18924,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (3,18926,1);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (3,18933,1);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (24,18935,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (11,18935,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (6,18936,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (23,18936,1);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (24,18936,2);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (25,18939,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (30,18940,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (30,18941,26);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (27,18941,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (9,18941,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (29,18941,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (36,18941,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (35,18941,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (24,18941,1);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (24,18946,1);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (3,18946,1);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (6,18946,2);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (23,18946,1);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (9,18946,2);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (5,18946,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (7,18946,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (30,18946,20);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (25,18946,14);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (36,18946,7);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (14,18946,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (15,18946,1);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (22,18946,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (24,18947,47);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (41,18947,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (3,18947,5);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (23,18948,4);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (24,18948,41);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (36,18948,2);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (30,18948,2);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (22,18948,5);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (52,18948,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (42,18948,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (34,18948,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (54,18948,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (41,18948,1);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (40,18948,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (35,18948,1);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (51,18948,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (47,18948,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (50,18948,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (38,18948,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (39,18948,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (32,18948,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (13,18949,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (9,18950,2);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (14,18950,4);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (24,18950,5);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (40,18950,7);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (31,18950,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (10,18950,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (24,18951,1);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (41,18951,2);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (42,18951,5);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (36,18951,6);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (30,18951,17);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (29,18951,1);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (27,18951,1);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (54,18951,19);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (52,18951,22);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (51,18951,4);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (44,18951,0);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (40,18951,6);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (41,18952,2);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (41,18996,1);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (5,18996,3);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (23,18996,2);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (22,18996,1);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (15,18996,4);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (14,18996,4);
INSERT INTO ujcms_article_stat (article_id_, stat_day_, views_) VALUES (13,18996,1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (231,1,1,'20211104125459284_gxtub.jpg','/1/image/2021/11/20211104125504412_of8lq.jpg','/uploads/1/image/2021/11/20211104125504412_of8lq.jpg',76521,'2021-11-04 12:55:04',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (233,1,1,'20211104125539508_jenam.jpg','/1/image/2021/11/20211104125546515_u445l.jpg','/uploads/1/image/2021/11/20211104125546515_u445l.jpg',45698,'2021-11-04 12:55:47',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (235,1,1,'20211104165719803_p4ra8.jpg','/1/image/2021/11/20211104165740209_ceomo.jpg','/uploads/1/image/2021/11/20211104165740209_ceomo.jpg',116185,'2021-11-04 16:57:40',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (236,1,1,'冬奥会.jpg','/1/image/2021/11/20211104222348689_qh9w7.jpg','/uploads/1/image/2021/11/20211104222348689_qh9w7.jpg',95461,'2021-11-04 22:23:49',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (237,1,1,'药品采购.jpg','/1/image/2021/11/20211104222620564_vor4h.jpg','/uploads/1/image/2021/11/20211104222620564_vor4h.jpg',20127,'2021-11-04 22:26:21',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (239,1,1,'飞行员.jpg','/1/image/2021/11/20211104222710636_nk33a.jpg','/uploads/1/image/2021/11/20211104222710636_nk33a.jpg',666057,'2021-11-04 22:27:11',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (240,1,1,'马尔代夫3.jpg','/1/image/2021/11/20211104222746839_hjqth.jpg','/uploads/1/image/2021/11/20211104222746839_hjqth.jpg',521947,'2021-11-04 22:27:47',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (241,1,1,'歼10_2.jpg','/1/image/2021/11/20211104222955607_po1m3.jpg','/uploads/1/image/2021/11/20211104222955607_po1m3.jpg',44449,'2021-11-04 22:29:56',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (242,1,1,'双11.jpg','/1/image/2021/11/20211104223308496_acfyr.jpg','/uploads/1/image/2021/11/20211104223308496_acfyr.jpg',76581,'2021-11-04 22:33:09',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (243,1,1,'教培转型.jpg','/1/image/2021/11/20211104223430598_908j4.jpg','/uploads/1/image/2021/11/20211104223430598_908j4.jpg',79023,'2021-11-04 22:34:31',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (244,1,1,'武夷山.jpg','/1/image/2021/11/20211104223701330_qupit.jpg','/uploads/1/image/2021/11/20211104223701330_qupit.jpg',115720,'2021-11-04 22:37:01',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (245,1,1,'核酸检测.png','/1/image/2021/11/20211104223810718_6a5ax.png','/uploads/1/image/2021/11/20211104223810718_6a5ax.png',327737,'2021-11-04 22:38:11',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (246,1,1,'量子计算.jpg','/1/image/2021/11/20211104224056206_vdefr.jpg','/uploads/1/image/2021/11/20211104224056206_vdefr.jpg',30815,'2021-11-04 22:40:56',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (247,1,1,'五棵松体育中心.gif','/1/image/2021/11/20211104224550238_erko3.gif','/uploads/1/image/2021/11/20211104224550238_erko3.gif',271905,'2021-11-04 22:45:50',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (248,1,1,'贝索斯.jpg','/1/image/2021/11/20211104231836614_mefxh.jpg','/uploads/1/image/2021/11/20211104231836614_mefxh.jpg',72698,'2021-11-04 23:18:37',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (249,1,1,'福布斯排行.jpg','/1/image/2021/11/20211104232420442_dqx8h.jpg','/uploads/1/image/2021/11/20211104232420442_dqx8h.jpg',78695,'2021-11-04 23:24:20',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (250,1,1,'智利前财长.jpg','/1/image/2021/11/20211105135315234_m5q0c.jpg','/uploads/1/image/2021/11/20211105135315234_m5q0c.jpg',26366,'2021-11-05 13:53:15',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (255,1,1,'视频_峰爆.jpg','/1/image/2021/11/20211108190618610_tr5s3.jpg','/uploads/1/image/2021/11/20211108190618610_tr5s3.jpg',293501,'2021-11-08 19:06:19',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (256,1,1,'下载_pdf.jpeg','/1/image/2021/11/20211110112249015_3npw8.jpg','/uploads/1/image/2021/11/20211110112249015_3npw8.jpg',16758,'2021-11-10 11:22:49',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (258,1,1,'下载_火狐.jpg','/1/image/2021/11/20211110112529820_5igwi.jpg','/uploads/1/image/2021/11/20211110112529820_5igwi.jpg',25100,'2021-11-10 11:25:30',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (261,1,1,'下载_qq.jpeg','/1/image/2021/11/20211110120854616_w31vb.jpg','/uploads/1/image/2021/11/20211110120854616_w31vb.jpg',25390,'2021-11-10 12:08:55',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (262,1,1,'下载_vscode.jpeg','/1/image/2021/11/20211110121255183_6aqfa.jpg','/uploads/1/image/2021/11/20211110121255183_6aqfa.jpg',13415,'2021-11-10 12:12:55',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (264,1,1,'下载_wps.jpg','/1/image/2021/11/20211110134344757_3nv60.png','/uploads/1/image/2021/11/20211110134344757_3nv60.png',19931,'2021-11-10 13:43:45',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (265,1,1,'视频_关于我妈的一切.jpg','/1/image/2021/11/20211111105757848_bttmt.jpg','/uploads/1/image/2021/11/20211111105757848_bttmt.jpg',127952,'2021-11-11 10:57:58',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (266,1,1,'视频_热带雨.jpg','/1/image/2021/11/20211111105937943_ttq2n.jpg','/uploads/1/image/2021/11/20211111105937943_ttq2n.jpg',276104,'2021-11-11 10:59:38',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (267,1,1,'视频_夏日友晴天.jpg','/1/image/2021/11/20211111110031366_6gngc.jpg','/uploads/1/image/2021/11/20211111110031366_6gngc.jpg',366386,'2021-11-11 11:00:32',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (268,1,1,'视频_新逃学威龙.jpg','/1/image/2021/11/20211111110118656_fcr3x.jpg','/uploads/1/image/2021/11/20211111110118656_fcr3x.jpg',309231,'2021-11-11 11:01:19',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (271,1,1,'图片_风光A.jpg','/1/image/2021/11/20211112181242149_b7voo.jpg','/uploads/1/image/2021/11/20211112181242149_b7voo.jpg',295109,'2021-11-12 18:12:42',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (272,1,1,'图片_风光A2.jpg','/1/image/2021/11/20211112181242418_7olxk.jpg','/uploads/1/image/2021/11/20211112181242418_7olxk.jpg',330761,'2021-11-12 18:12:43',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (273,1,1,'图片_风光A4.jpg','/1/image/2021/11/20211112181242454_v9mmp.jpg','/uploads/1/image/2021/11/20211112181242454_v9mmp.jpg',239945,'2021-11-12 18:12:43',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (274,1,1,'图片_风光A3.jpg','/1/image/2021/11/20211112181242446_1fsr0.jpg','/uploads/1/image/2021/11/20211112181242446_1fsr0.jpg',250721,'2021-11-12 18:12:43',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (275,1,1,'图片_风光A5.jpg','/1/image/2021/11/20211112181242471_w5cci.jpg','/uploads/1/image/2021/11/20211112181242471_w5cci.jpg',300083,'2021-11-12 18:12:43',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (276,1,1,'图片_风光A.jpg','/1/image/2021/11/20211112181255426_puyn8.jpg','/uploads/1/image/2021/11/20211112181255426_puyn8.jpg',295109,'2021-11-12 18:12:55',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (277,1,1,'图片_人物A.jpg','/1/image/2021/11/20211112181835422_e4j2k.jpg','/uploads/1/image/2021/11/20211112181835422_e4j2k.jpg',341525,'2021-11-12 18:18:36',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (278,1,1,'图片_人物A2.jpg','/1/image/2021/11/20211112181835756_xhyeo.jpg','/uploads/1/image/2021/11/20211112181835756_xhyeo.jpg',383544,'2021-11-12 18:18:36',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (279,1,1,'图片_人物A3.jpg','/1/image/2021/11/20211112181835756_l6ylw.jpg','/uploads/1/image/2021/11/20211112181835756_l6ylw.jpg',423700,'2021-11-12 18:18:36',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (283,1,1,'20211112182329645_6onbd.jpg','/1/image/2021/11/20211112182335734_9p89i.jpg','/uploads/1/image/2021/11/20211112182335734_9p89i.jpg',7420,'2021-11-12 18:23:36',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (284,1,1,'图片_人物B.jpg','/1/image/2021/11/20211112182654849_kemtl.jpg','/uploads/1/image/2021/11/20211112182654849_kemtl.jpg',484276,'2021-11-12 18:26:55',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (285,1,1,'图片_人物B4.jpg','/1/image/2021/11/20211112182654847_0uq5o.jpg','/uploads/1/image/2021/11/20211112182654847_0uq5o.jpg',588021,'2021-11-12 18:26:55',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (286,1,1,'图片_人物B5.jpg','/1/image/2021/11/20211112182654862_t0q85.jpg','/uploads/1/image/2021/11/20211112182654862_t0q85.jpg',528184,'2021-11-12 18:26:55',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (287,1,1,'图片_人物B3.jpg','/1/image/2021/11/20211112182654870_gl8rg.jpg','/uploads/1/image/2021/11/20211112182654870_gl8rg.jpg',509891,'2021-11-12 18:26:55',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (288,1,1,'图片_人物B2.jpg','/1/image/2021/11/20211112182654870_wrdu4.jpg','/uploads/1/image/2021/11/20211112182654870_wrdu4.jpg',521543,'2021-11-12 18:26:55',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (290,1,1,'20211112182713417_f4uww.jpg','/1/image/2021/11/20211112182722661_3kbny.jpg','/uploads/1/image/2021/11/20211112182722661_3kbny.jpg',11540,'2021-11-12 18:27:23',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (297,1,1,'20211112182953577_ffrn1.jpg','/1/image/2021/11/20211112182957845_keu7f.jpg','/uploads/1/image/2021/11/20211112182957845_keu7f.jpg',10736,'2021-11-12 18:29:58',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (304,1,1,'20211112183059445_obndb.jpg','/1/image/2021/11/20211112183104456_7499y.jpg','/uploads/1/image/2021/11/20211112183104456_7499y.jpg',6411,'2021-11-12 18:31:05',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (305,1,1,'图片_篮球戴维斯.jpg','/1/image/2021/11/20211112183234907_ch5kw.jpg','/uploads/1/image/2021/11/20211112183234907_ch5kw.jpg',210437,'2021-11-12 18:32:35',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (306,1,1,'图片_篮球戴维斯3.jpg','/1/image/2021/11/20211112183234907_9xnib.jpg','/uploads/1/image/2021/11/20211112183234907_9xnib.jpg',188184,'2021-11-12 18:32:35',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (307,1,1,'图片_篮球戴维斯2.jpg','/1/image/2021/11/20211112183234907_8swxk.jpg','/uploads/1/image/2021/11/20211112183234907_8swxk.jpg',384952,'2021-11-12 18:32:35',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (309,1,1,'20211112183418657_st7x0.jpg','/1/image/2021/11/20211112183426133_uukxi.jpg','/uploads/1/image/2021/11/20211112183426133_uukxi.jpg',16718,'2021-11-12 18:34:26',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (328,1,1,'产品_rf70-200_f28.jpg','/1/image/2021/11/20211118164011361_t92c6.jpg','/uploads/1/image/2021/11/20211118164011361_t92c6.jpg',107892,'2021-11-18 16:40:11',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (329,1,1,'产品_rf24-70_f28.jpg','/1/image/2021/11/20211118164107120_casro.jpg','/uploads/1/image/2021/11/20211118164107120_casro.jpg',104179,'2021-11-18 16:41:07',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (330,1,1,'产品_rf50f12.jpg','/1/image/2021/11/20211118164118336_t9ca3.jpg','/uploads/1/image/2021/11/20211118164118336_t9ca3.jpg',91944,'2021-11-18 16:41:18',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (331,1,1,'产品_rf35f18.jpg','/1/image/2021/11/20211118164131270_159y8.jpg','/uploads/1/image/2021/11/20211118164131270_159y8.jpg',69310,'2021-11-18 16:41:31',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (332,1,1,'产品_rf50f18.jpg','/1/image/2021/11/20211118164143293_bh9k6.jpg','/uploads/1/image/2021/11/20211118164143293_bh9k6.jpg',68766,'2021-11-18 16:41:43',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (333,1,1,'产品_xtc_advanced_1.jpg','/1/image/2021/11/20211118164200397_fjk26.jpg','/uploads/1/image/2021/11/20211118164200397_fjk26.jpg',90569,'2021-11-18 16:42:00',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (334,1,1,'产品_tcradvsl3disc.jpg','/1/image/2021/11/20211118164216015_x598j.jpg','/uploads/1/image/2021/11/20211118164216015_x598j.jpg',103739,'2021-11-18 16:42:16',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (335,1,1,'产品_macbookpro16.jpg','/1/image/2021/11/20211118164225222_8sby8.jpg','/uploads/1/image/2021/11/20211118164225222_8sby8.jpg',247937,'2021-11-18 16:42:25',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (336,1,1,'产品_ipad-pro-12.jpg','/1/image/2021/11/20211118164237664_e7b1v.jpg','/uploads/1/image/2021/11/20211118164237664_e7b1v.jpg',438649,'2021-11-18 16:42:38',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (337,1,1,'产品_iPhone13ProMax.png','/1/image/2021/11/20211118164245284_ls4os.png','/uploads/1/image/2021/11/20211118164245284_ls4os.png',603577,'2021-11-18 16:42:46',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (338,1,1,'文库_2.png','/1/image/2021/11/20211118164649038_maqmg.png','/uploads/1/image/2021/11/20211118164649038_maqmg.png',4682,'2021-11-18 16:46:49',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (339,1,1,'文库_1.png','/1/image/2021/11/20211118164704288_njy3g.png','/uploads/1/image/2021/11/20211118164704288_njy3g.png',905,'2021-11-18 16:47:04',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (341,1,1,'20211122154631621_v09ml.jpg','/1/image/2021/11/20211122154637913_e1e7q.jpg','/uploads/1/image/2021/11/20211122154637913_e1e7q.jpg',8952,'2021-11-22 15:46:38',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (345,1,1,'20211122154857624_al5b2.jpg','/1/image/2021/11/20211122154901380_aueka.jpg','/uploads/1/image/2021/11/20211122154901380_aueka.jpg',9264,'2021-11-22 15:49:02',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (347,1,1,'图片_人物D3.jpg','/1/image/2022/01/20220105215049954_gpfsk.jpg','/uploads/1/image/2022/01/20220105215049954_gpfsk.jpg',335507,'2022-01-05 21:50:50',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (348,1,1,'图片_人物D1.jpg','/1/image/2022/01/20220105215049954_9xhpe.jpg','/uploads/1/image/2022/01/20220105215049954_9xhpe.jpg',584654,'2022-01-05 21:50:50',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (349,1,1,'图片_人物D4.jpg','/1/image/2022/01/20220105215049954_97jm2.jpg','/uploads/1/image/2022/01/20220105215049954_97jm2.jpg',438424,'2022-01-05 21:50:50',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (350,1,1,'图片_人物D.jpg','/1/image/2022/01/20220105215049954_3u2m5.jpg','/uploads/1/image/2022/01/20220105215049954_3u2m5.jpg',478687,'2022-01-05 21:50:50',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (351,1,1,'图片_人物D5.jpg','/1/image/2022/01/20220105215049954_5h18u.jpg','/uploads/1/image/2022/01/20220105215049954_5h18u.jpg',179085,'2022-01-05 21:50:51',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (352,1,1,'图片_人物C.jpg','/1/image/2022/01/20220105215123974_9kag6.jpg','/uploads/1/image/2022/01/20220105215123974_9kag6.jpg',475719,'2022-01-05 21:51:24',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (353,1,1,'图片_人物C3.jpg','/1/image/2022/01/20220105215123966_e3gf1.jpg','/uploads/1/image/2022/01/20220105215123966_e3gf1.jpg',299533,'2022-01-05 21:51:24',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (354,1,1,'图片_人物C5.jpg','/1/image/2022/01/20220105215123981_p4pvt.jpg','/uploads/1/image/2022/01/20220105215123981_p4pvt.jpg',616889,'2022-01-05 21:51:24',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (355,1,1,'图片_人物C4.jpg','/1/image/2022/01/20220105215123974_gibmm.jpg','/uploads/1/image/2022/01/20220105215123974_gibmm.jpg',544891,'2022-01-05 21:51:24',1);
INSERT INTO ujcms_attachment (id_, site_id_, user_id_, name_, path_, url_, length_, created_, used_) VALUES (356,1,1,'图片_人物C2.jpg','/1/image/2022/01/20220105215123966_npvr7.jpg','/uploads/1/image/2022/01/20220105215123966_npvr7.jpg',397961,'2022-01-05 21:51:24',1);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (241,'article',3);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (240,'article',4);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (239,'article',6);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (249,'article',8);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (248,'article',9);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (247,'article',10);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (246,'article',11);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (245,'article',12);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (244,'article',13);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (237,'article',14);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (243,'article',15);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (236,'article',22);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (242,'article',23);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (250,'article',24);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (255,'article',25);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (256,'article',26);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (258,'article',27);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (264,'article',28);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (261,'article',29);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (262,'article',30);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (265,'article',31);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (266,'article',32);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (267,'article',33);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (268,'article',34);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (345,'article',35);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (341,'article',36);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (271,'article',37);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (272,'article',37);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (273,'article',37);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (274,'article',37);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (275,'article',37);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (276,'article',37);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (277,'article',38);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (278,'article',38);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (279,'article',38);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (283,'article',38);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (284,'article',39);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (285,'article',39);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (286,'article',39);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (287,'article',39);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (288,'article',39);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (290,'article',39);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (297,'article',40);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (352,'article',40);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (353,'article',40);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (354,'article',40);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (355,'article',40);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (356,'article',40);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (304,'article',41);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (347,'article',41);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (348,'article',41);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (349,'article',41);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (350,'article',41);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (351,'article',41);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (305,'article',42);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (306,'article',42);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (307,'article',42);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (309,'article',42);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (337,'article',43);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (336,'article',44);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (335,'article',45);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (334,'article',46);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (333,'article',47);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (332,'article',48);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (331,'article',49);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (330,'article',50);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (329,'article',51);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (328,'article',52);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (339,'article',53);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (338,'article',54);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (233,'block_item',5);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (235,'block_item',6);
INSERT INTO ujcms_attachment_refer (attachment_id_, refer_type_, refer_id_) VALUES (231,'block_item',7);
INSERT INTO ujcms_block (id_, site_id_, name_, alias_, scope_, with_description_, with_image_, image_width_, image_height_, with_mobile_image_, mobile_image_width_, mobile_image_height_, enabled_, order_) VALUES (1,1,'首页焦点','focus',2,0,1,1200,600,0,300,200,1,1);
INSERT INTO ujcms_block_item (id_, site_id_, block_id_, article_id_, title_, description_, link_url_, image_, mobile_image_, enabled_, order_) VALUES (5,1,1,3,'夕阳下歼10起飞参加演习 画面超美',NULL,NULL,'/uploads/1/image/2021/11/20211104125546515_u445l.jpg',NULL,1,32767);
INSERT INTO ujcms_block_item (id_, site_id_, block_id_, article_id_, title_, description_, link_url_, image_, mobile_image_, enabled_, order_) VALUES (6,1,1,4,'面临三重生存威胁 全球持续变暖马尔代夫恐将“消失”',NULL,NULL,'/uploads/1/image/2021/11/20211104165740209_ceomo.jpg',NULL,1,32767);
INSERT INTO ujcms_block_item (id_, site_id_, block_id_, article_id_, title_, description_, link_url_, image_, mobile_image_, enabled_, order_) VALUES (7,1,1,6,'英姿飒爽！陆军首批10名女飞行学员完成首次单飞',NULL,NULL,'/uploads/1/image/2021/11/20211104125504412_of8lq.jpg',NULL,1,32767);
INSERT INTO ujcms_channel (id_, site_id_, parent_id_, channel_model_id_, article_model_id_, name_, alias_, nav_, type_, depth_, order_) VALUES (4,1,NULL,12,11,'新闻','news',1,1,1,32767);
INSERT INTO ujcms_channel (id_, site_id_, parent_id_, channel_model_id_, article_model_id_, name_, alias_, nav_, type_, depth_, order_) VALUES (8,1,4,12,11,'国内','china',1,2,2,32767);
INSERT INTO ujcms_channel (id_, site_id_, parent_id_, channel_model_id_, article_model_id_, name_, alias_, nav_, type_, depth_, order_) VALUES (9,1,4,12,11,'国际','world',1,1,2,32767);
INSERT INTO ujcms_channel (id_, site_id_, parent_id_, channel_model_id_, article_model_id_, name_, alias_, nav_, type_, depth_, order_) VALUES (10,1,NULL,12,14,'图片','photo',1,1,1,32767);
INSERT INTO ujcms_channel (id_, site_id_, parent_id_, channel_model_id_, article_model_id_, name_, alias_, nav_, type_, depth_, order_) VALUES (11,1,NULL,12,15,'视频','video',1,1,1,32767);
INSERT INTO ujcms_channel (id_, site_id_, parent_id_, channel_model_id_, article_model_id_, name_, alias_, nav_, type_, depth_, order_) VALUES (12,1,NULL,12,16,'下载','download',1,1,1,32767);
INSERT INTO ujcms_channel (id_, site_id_, parent_id_, channel_model_id_, article_model_id_, name_, alias_, nav_, type_, depth_, order_) VALUES (13,1,NULL,12,17,'文库','wenku',1,1,1,32767);
INSERT INTO ujcms_channel (id_, site_id_, parent_id_, channel_model_id_, article_model_id_, name_, alias_, nav_, type_, depth_, order_) VALUES (14,1,NULL,12,18,'产品','product',1,1,1,32767);
INSERT INTO ujcms_channel (id_, site_id_, parent_id_, channel_model_id_, article_model_id_, name_, alias_, nav_, type_, depth_, order_) VALUES (25,1,10,12,14,'人物图库','25',1,1,2,32767);
INSERT INTO ujcms_channel (id_, site_id_, parent_id_, channel_model_id_, article_model_id_, name_, alias_, nav_, type_, depth_, order_) VALUES (26,1,10,12,14,'旅游摄影','26',1,1,2,32767);
INSERT INTO ujcms_channel (id_, site_id_, parent_id_, channel_model_id_, article_model_id_, name_, alias_, nav_, type_, depth_, order_) VALUES (27,1,10,12,14,'自然景观','27',1,1,2,32767);
INSERT INTO ujcms_channel (id_, site_id_, parent_id_, channel_model_id_, article_model_id_, name_, alias_, nav_, type_, depth_, order_) VALUES (28,1,12,12,16,'媒体软件','28',1,1,2,32767);
INSERT INTO ujcms_channel (id_, site_id_, parent_id_, channel_model_id_, article_model_id_, name_, alias_, nav_, type_, depth_, order_) VALUES (29,1,12,12,16,'网络软件','29',1,1,2,32767);
INSERT INTO ujcms_channel (id_, site_id_, parent_id_, channel_model_id_, article_model_id_, name_, alias_, nav_, type_, depth_, order_) VALUES (30,1,12,12,16,'系统工具','30',1,1,2,32767);
INSERT INTO ujcms_channel (id_, site_id_, parent_id_, channel_model_id_, article_model_id_, name_, alias_, nav_, type_, depth_, order_) VALUES (31,1,14,12,18,'手机','31',1,1,2,32767);
INSERT INTO ujcms_channel (id_, site_id_, parent_id_, channel_model_id_, article_model_id_, name_, alias_, nav_, type_, depth_, order_) VALUES (32,1,14,12,20,'自行车','32',1,1,2,32767);
INSERT INTO ujcms_channel (id_, site_id_, parent_id_, channel_model_id_, article_model_id_, name_, alias_, nav_, type_, depth_, order_) VALUES (33,1,14,12,21,'相机','33',1,1,2,32767);
INSERT INTO ujcms_channel (id_, site_id_, parent_id_, channel_model_id_, article_model_id_, name_, alias_, nav_, type_, depth_, order_) VALUES (34,1,13,12,17,'教育文库','34',1,1,2,32767);
INSERT INTO ujcms_channel (id_, site_id_, parent_id_, channel_model_id_, article_model_id_, name_, alias_, nav_, type_, depth_, order_) VALUES (35,1,13,12,17,'专业资料','35',1,1,2,32767);
INSERT INTO ujcms_channel (id_, site_id_, parent_id_, channel_model_id_, article_model_id_, name_, alias_, nav_, type_, depth_, order_) VALUES (36,1,11,12,15,'电影','36',1,1,2,32767);
INSERT INTO ujcms_channel (id_, site_id_, parent_id_, channel_model_id_, article_model_id_, name_, alias_, nav_, type_, depth_, order_) VALUES (37,1,11,12,15,'电视剧','37',1,1,2,32767);
INSERT INTO ujcms_channel_buffer (id_, views_) VALUES (4,288);
INSERT INTO ujcms_channel_buffer (id_, views_) VALUES (8,14);
INSERT INTO ujcms_channel_buffer (id_, views_) VALUES (9,10);
INSERT INTO ujcms_channel_buffer (id_, views_) VALUES (10,119);
INSERT INTO ujcms_channel_buffer (id_, views_) VALUES (11,112);
INSERT INTO ujcms_channel_buffer (id_, views_) VALUES (12,137);
INSERT INTO ujcms_channel_buffer (id_, views_) VALUES (13,62);
INSERT INTO ujcms_channel_buffer (id_, views_) VALUES (14,88);
INSERT INTO ujcms_channel_buffer (id_, views_) VALUES (25,7);
INSERT INTO ujcms_channel_buffer (id_, views_) VALUES (26,3);
INSERT INTO ujcms_channel_buffer (id_, views_) VALUES (27,3);
INSERT INTO ujcms_channel_buffer (id_, views_) VALUES (28,6);
INSERT INTO ujcms_channel_buffer (id_, views_) VALUES (29,7);
INSERT INTO ujcms_channel_buffer (id_, views_) VALUES (30,5);
INSERT INTO ujcms_channel_buffer (id_, views_) VALUES (31,10);
INSERT INTO ujcms_channel_buffer (id_, views_) VALUES (32,12);
INSERT INTO ujcms_channel_buffer (id_, views_) VALUES (33,17);
INSERT INTO ujcms_channel_buffer (id_, views_) VALUES (34,3);
INSERT INTO ujcms_channel_buffer (id_, views_) VALUES (35,3);
INSERT INTO ujcms_channel_buffer (id_, views_) VALUES (36,1);
INSERT INTO ujcms_channel_buffer (id_, views_) VALUES (37,1);
INSERT INTO ujcms_channel_ext (id_, seo_title_, seo_keywords_, seo_description_, article_template_, channel_template_, page_size_, image_, link_url_, target_blank_, allow_comment_, allow_contribute_, allow_search_, static_file_, mobile_static_file_, text_) VALUES (4,'aa','bb','cc','article','channel',10,NULL,NULL,0,1,1,1,NULL,NULL,NULL);
INSERT INTO ujcms_channel_ext (id_, seo_title_, seo_keywords_, seo_description_, article_template_, channel_template_, page_size_, image_, link_url_, target_blank_, allow_comment_, allow_contribute_, allow_search_, static_file_, mobile_static_file_, text_) VALUES (8,NULL,NULL,NULL,'article','channel',10,NULL,NULL,0,1,1,1,NULL,NULL,NULL);
INSERT INTO ujcms_channel_ext (id_, seo_title_, seo_keywords_, seo_description_, article_template_, channel_template_, page_size_, image_, link_url_, target_blank_, allow_comment_, allow_contribute_, allow_search_, static_file_, mobile_static_file_, text_) VALUES (9,NULL,NULL,NULL,'article','channel',10,NULL,NULL,0,1,1,1,NULL,NULL,NULL);
INSERT INTO ujcms_channel_ext (id_, seo_title_, seo_keywords_, seo_description_, article_template_, channel_template_, page_size_, image_, link_url_, target_blank_, allow_comment_, allow_contribute_, allow_search_, static_file_, mobile_static_file_, text_) VALUES (10,NULL,NULL,NULL,'article','channel',20,NULL,NULL,0,1,1,1,NULL,NULL,NULL);
INSERT INTO ujcms_channel_ext (id_, seo_title_, seo_keywords_, seo_description_, article_template_, channel_template_, page_size_, image_, link_url_, target_blank_, allow_comment_, allow_contribute_, allow_search_, static_file_, mobile_static_file_, text_) VALUES (11,NULL,NULL,NULL,'article','channel_video',20,NULL,NULL,0,1,1,1,NULL,NULL,NULL);
INSERT INTO ujcms_channel_ext (id_, seo_title_, seo_keywords_, seo_description_, article_template_, channel_template_, page_size_, image_, link_url_, target_blank_, allow_comment_, allow_contribute_, allow_search_, static_file_, mobile_static_file_, text_) VALUES (12,NULL,NULL,NULL,'article_download','channel_download',20,NULL,NULL,0,1,1,1,NULL,NULL,NULL);
INSERT INTO ujcms_channel_ext (id_, seo_title_, seo_keywords_, seo_description_, article_template_, channel_template_, page_size_, image_, link_url_, target_blank_, allow_comment_, allow_contribute_, allow_search_, static_file_, mobile_static_file_, text_) VALUES (13,NULL,NULL,NULL,'article_wenku','channel_wenku',20,NULL,NULL,0,1,1,1,NULL,NULL,NULL);
INSERT INTO ujcms_channel_ext (id_, seo_title_, seo_keywords_, seo_description_, article_template_, channel_template_, page_size_, image_, link_url_, target_blank_, allow_comment_, allow_contribute_, allow_search_, static_file_, mobile_static_file_, text_) VALUES (14,NULL,NULL,NULL,'article_product','channel_product',20,NULL,NULL,0,1,1,1,NULL,NULL,NULL);
INSERT INTO ujcms_channel_ext (id_, seo_title_, seo_keywords_, seo_description_, article_template_, channel_template_, page_size_, image_, link_url_, target_blank_, allow_comment_, allow_contribute_, allow_search_, static_file_, mobile_static_file_, text_) VALUES (25,NULL,NULL,NULL,'article','channel',20,NULL,NULL,0,1,1,1,NULL,NULL,NULL);
INSERT INTO ujcms_channel_ext (id_, seo_title_, seo_keywords_, seo_description_, article_template_, channel_template_, page_size_, image_, link_url_, target_blank_, allow_comment_, allow_contribute_, allow_search_, static_file_, mobile_static_file_, text_) VALUES (26,NULL,NULL,NULL,'article','channel',20,NULL,NULL,0,1,1,1,NULL,NULL,NULL);
INSERT INTO ujcms_channel_ext (id_, seo_title_, seo_keywords_, seo_description_, article_template_, channel_template_, page_size_, image_, link_url_, target_blank_, allow_comment_, allow_contribute_, allow_search_, static_file_, mobile_static_file_, text_) VALUES (27,NULL,NULL,NULL,'article','channel',20,NULL,NULL,0,1,1,1,NULL,NULL,NULL);
INSERT INTO ujcms_channel_ext (id_, seo_title_, seo_keywords_, seo_description_, article_template_, channel_template_, page_size_, image_, link_url_, target_blank_, allow_comment_, allow_contribute_, allow_search_, static_file_, mobile_static_file_, text_) VALUES (28,NULL,NULL,NULL,'article_download','channel_download',20,NULL,NULL,0,1,1,1,NULL,NULL,NULL);
INSERT INTO ujcms_channel_ext (id_, seo_title_, seo_keywords_, seo_description_, article_template_, channel_template_, page_size_, image_, link_url_, target_blank_, allow_comment_, allow_contribute_, allow_search_, static_file_, mobile_static_file_, text_) VALUES (29,NULL,NULL,NULL,'article_download','channel_download',20,NULL,NULL,0,1,1,1,NULL,NULL,NULL);
INSERT INTO ujcms_channel_ext (id_, seo_title_, seo_keywords_, seo_description_, article_template_, channel_template_, page_size_, image_, link_url_, target_blank_, allow_comment_, allow_contribute_, allow_search_, static_file_, mobile_static_file_, text_) VALUES (30,NULL,NULL,NULL,'article_download','channel_download',20,NULL,NULL,0,1,1,1,NULL,NULL,NULL);
INSERT INTO ujcms_channel_ext (id_, seo_title_, seo_keywords_, seo_description_, article_template_, channel_template_, page_size_, image_, link_url_, target_blank_, allow_comment_, allow_contribute_, allow_search_, static_file_, mobile_static_file_, text_) VALUES (31,NULL,NULL,NULL,'article_product','channel_product',20,NULL,NULL,0,1,1,1,NULL,NULL,NULL);
INSERT INTO ujcms_channel_ext (id_, seo_title_, seo_keywords_, seo_description_, article_template_, channel_template_, page_size_, image_, link_url_, target_blank_, allow_comment_, allow_contribute_, allow_search_, static_file_, mobile_static_file_, text_) VALUES (32,NULL,NULL,NULL,'article_product','channel_product',20,NULL,NULL,0,1,1,1,NULL,NULL,NULL);
INSERT INTO ujcms_channel_ext (id_, seo_title_, seo_keywords_, seo_description_, article_template_, channel_template_, page_size_, image_, link_url_, target_blank_, allow_comment_, allow_contribute_, allow_search_, static_file_, mobile_static_file_, text_) VALUES (33,NULL,NULL,NULL,'article_product','channel_product',20,NULL,NULL,0,1,1,1,NULL,NULL,NULL);
INSERT INTO ujcms_channel_ext (id_, seo_title_, seo_keywords_, seo_description_, article_template_, channel_template_, page_size_, image_, link_url_, target_blank_, allow_comment_, allow_contribute_, allow_search_, static_file_, mobile_static_file_, text_) VALUES (34,NULL,NULL,NULL,'article_wenku','channel_wenku',20,NULL,NULL,0,1,1,1,NULL,NULL,NULL);
INSERT INTO ujcms_channel_ext (id_, seo_title_, seo_keywords_, seo_description_, article_template_, channel_template_, page_size_, image_, link_url_, target_blank_, allow_comment_, allow_contribute_, allow_search_, static_file_, mobile_static_file_, text_) VALUES (35,NULL,NULL,NULL,'article_wenku','channel_wenku',20,NULL,NULL,0,1,1,1,NULL,NULL,NULL);
INSERT INTO ujcms_channel_ext (id_, seo_title_, seo_keywords_, seo_description_, article_template_, channel_template_, page_size_, image_, link_url_, target_blank_, allow_comment_, allow_contribute_, allow_search_, static_file_, mobile_static_file_, text_) VALUES (36,NULL,NULL,NULL,'article','channel_video',20,NULL,NULL,0,1,1,1,NULL,NULL,NULL);
INSERT INTO ujcms_channel_ext (id_, seo_title_, seo_keywords_, seo_description_, article_template_, channel_template_, page_size_, image_, link_url_, target_blank_, allow_comment_, allow_contribute_, allow_search_, static_file_, mobile_static_file_, text_) VALUES (37,NULL,NULL,NULL,'article','channel_video',20,NULL,NULL,0,1,1,1,NULL,NULL,NULL);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (4,1);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (4,8);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (4,10);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (8,1);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (8,8);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (8,10);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (9,1);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (9,8);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (9,10);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (10,1);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (10,8);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (10,10);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (11,1);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (11,8);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (11,10);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (12,1);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (12,8);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (12,10);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (13,1);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (13,8);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (13,10);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (14,1);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (14,8);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (14,10);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (25,1);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (25,8);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (25,10);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (26,1);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (26,8);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (26,10);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (27,1);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (27,8);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (27,10);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (28,1);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (28,8);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (28,10);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (29,1);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (29,8);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (29,10);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (30,1);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (30,8);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (30,10);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (31,1);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (31,8);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (31,10);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (32,1);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (32,8);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (32,10);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (33,1);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (33,8);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (33,10);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (34,1);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (34,8);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (34,10);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (35,1);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (35,8);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (35,10);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (36,1);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (36,8);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (36,10);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (37,1);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (37,8);
INSERT INTO ujcms_channel_group (channel_id_, group_id_) VALUES (37,10);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (4,4);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (4,8);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (8,8);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (4,9);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (9,9);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (10,10);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (11,11);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (12,12);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (13,13);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (14,14);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (10,25);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (25,25);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (10,26);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (26,26);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (10,27);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (27,27);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (12,28);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (28,28);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (12,29);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (29,29);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (12,30);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (30,30);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (14,31);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (31,31);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (14,32);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (32,32);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (14,33);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (33,33);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (13,34);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (34,34);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (13,35);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (35,35);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (11,36);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (36,36);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (11,37);
INSERT INTO ujcms_channel_tree (ancestor_id_, descendant_id_) VALUES (37,37);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (7,1,NULL,'新华网','1',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (8,1,NULL,'人民网','2',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (11,100,NULL,'国产软件','1',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (12,100,NULL,'国外软件','2',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (13,101,NULL,'免费软件','1',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (14,101,NULL,'收费软件','2',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (15,102,NULL,'简体中文','1',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (16,102,NULL,'繁体中文','2',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (17,103,NULL,'★★★★★','5',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (18,103,NULL,'★★★★☆','4',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (19,103,NULL,'★★★☆☆','3',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (20,103,NULL,'★★☆☆☆','2',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (21,103,NULL,'★☆☆☆☆','1',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (22,104,NULL,'win7','1',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (23,104,NULL,'win10','2',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (24,104,NULL,'linux','3',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (25,104,NULL,'unix','4',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (26,104,NULL,'mac','5',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (27,102,NULL,'英文','3',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (28,105,NULL,'华语','1',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (29,105,NULL,'美国','2',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (30,105,NULL,'欧洲','3',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (31,105,NULL,'韩国','4',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (32,105,NULL,'日本','5',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (33,105,NULL,'其它','6',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (34,106,NULL,'喜剧','1',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (35,106,NULL,'悲剧','2',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (36,106,NULL,'爱情','3',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (37,106,NULL,'动作','4',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (38,106,NULL,'枪战','5',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (39,106,NULL,'犯罪','6',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (40,106,NULL,'惊悚','7',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (41,106,NULL,'恐怖','8',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (42,106,NULL,'悬疑','9',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (43,106,NULL,'动画','10',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (44,106,NULL,'家庭','11',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (45,106,NULL,'奇幻','12',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (46,106,NULL,'魔幻','13',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (47,106,NULL,'科幻','14',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (48,106,NULL,'战争','15',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (49,106,NULL,'武侠','16',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (50,106,NULL,'青春','17',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (51,106,NULL,'功夫','18',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (52,106,NULL,'灾难','19',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (53,107,NULL,'64GB','1',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (54,107,NULL,'128GB','2',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (55,107,NULL,'256GB','3',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (56,107,NULL,'512GB','4',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (57,108,NULL,'5.0-5.49英寸','1',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (58,108,NULL,'5.5-5.99英寸','2',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (59,108,NULL,'6.0-6.49英寸','3',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (60,108,NULL,'6.5英寸以上','4',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (61,109,NULL,'公路车','1',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (62,109,NULL,'山地车','2',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (63,110,NULL,'定焦','1',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (64,110,NULL,'变焦','2',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (65,109,NULL,'旅行车','3',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (66,107,NULL,'1TB','5',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (67,111,NULL,'EF','1',NULL,32767,1);
INSERT INTO ujcms_dict (id_, type_id_, parent_id_, name_, value_, remark_, order_, enabled_) VALUES (68,111,NULL,'RF','2',NULL,32767,1);
INSERT INTO ujcms_dict_type (id_, site_id_, name_, alias_, remark_, scope_, order_, sys_) VALUES (1,1,'文章来源','article_source',NULL,2,32767,1);
INSERT INTO ujcms_dict_type (id_, site_id_, name_, alias_, remark_, scope_, order_, sys_) VALUES (100,1,'下载_类型','download_type',NULL,2,32767,0);
INSERT INTO ujcms_dict_type (id_, site_id_, name_, alias_, remark_, scope_, order_, sys_) VALUES (101,1,'下载_授权','download_license',NULL,2,32767,0);
INSERT INTO ujcms_dict_type (id_, site_id_, name_, alias_, remark_, scope_, order_, sys_) VALUES (102,1,'下载_语言','download_language',NULL,2,32767,0);
INSERT INTO ujcms_dict_type (id_, site_id_, name_, alias_, remark_, scope_, order_, sys_) VALUES (103,1,'下载_星级','download_star',NULL,2,32767,0);
INSERT INTO ujcms_dict_type (id_, site_id_, name_, alias_, remark_, scope_, order_, sys_) VALUES (104,1,'下载_环境','download_system',NULL,2,32767,0);
INSERT INTO ujcms_dict_type (id_, site_id_, name_, alias_, remark_, scope_, order_, sys_) VALUES (105,1,'视频_地区','video_area',NULL,2,32767,0);
INSERT INTO ujcms_dict_type (id_, site_id_, name_, alias_, remark_, scope_, order_, sys_) VALUES (106,1,'视频_类型','video_type',NULL,2,32767,0);
INSERT INTO ujcms_dict_type (id_, site_id_, name_, alias_, remark_, scope_, order_, sys_) VALUES (107,1,'产品_手机_机身存储','product_phone_storage',NULL,2,32767,0);
INSERT INTO ujcms_dict_type (id_, site_id_, name_, alias_, remark_, scope_, order_, sys_) VALUES (108,1,'产品_手机_屏幕尺寸','product_phone_screen',NULL,2,32767,0);
INSERT INTO ujcms_dict_type (id_, site_id_, name_, alias_, remark_, scope_, order_, sys_) VALUES (109,1,'产品_自行车_类型','product_bike_type',NULL,2,32767,0);
INSERT INTO ujcms_dict_type (id_, site_id_, name_, alias_, remark_, scope_, order_, sys_) VALUES (110,1,'产品_相机_类型','product_camera_type',NULL,2,32767,0);
INSERT INTO ujcms_dict_type (id_, site_id_, name_, alias_, remark_, scope_, order_, sys_) VALUES (111,1,'产品_相机_卡口','product_camera_mount',NULL,2,32767,0);
INSERT INTO ujcms_global (id_, context_path_, port_, default_site_id_, channel_url_, article_url_, upload_settings_, register_settings_, email_settings_, customs_settings_) VALUES (1,NULL,8080,1,NULL,NULL,'{\"imageTypes\":\"jpg,jpeg,png,gif\",\"videoTypes\":\"mp4,m3u8\",\"docTypes\":\"pdf,doc,docx,xls,xlsx,ppt,pptx\",\"fileTypes\":\"zip,7z,gz,bz2,iso,rar,pdf,doc,docx,xls,xlsx,ppt,pptx\",\"imageLimit\":0,\"videoLimit\":0,\"docLimit\":0,\"fileLimit\":0,\"imageMaxWidth\":1920,\"imageMaxHeight\":0,\"videoLimitByte\":0,\"imageLimitByte\":0,\"docLimitByte\":0,\"fileLimitByte\":0,\"docInputAccept\":\".zip,.7z,.gz,.bz2,.iso,.rar,.pdf,.doc,.docx,.xls,.xlsx,.ppt,.pptx\",\"videoInputAccept\":\".mp4,.m3u8\",\"fileInputAccept\":\".zip,.7z,.gz,.bz2,.iso,.rar,.pdf,.doc,.docx,.xls,.xlsx,.ppt,.pptx\",\"imageInputAccept\":\".jpg,.jpeg,.png,.gif\"}',NULL,NULL,'{\"field1629813572879\":\"的说法\",\"field1629813574262\":[\"咨询\"],\"field1629813580359\":\"\"}');
INSERT INTO ujcms_group (id_, name_, description_, type_, order_) VALUES (1,'游客组','未登录的用户属于游客组',1,1);
INSERT INTO ujcms_group (id_, name_, description_, type_, order_) VALUES (8,'管理组','后台管理员默认属于管理组',2,2);
INSERT INTO ujcms_group (id_, name_, description_, type_, order_) VALUES (10,'普通组','前台注册用户默认属于普通组',2,3);
INSERT INTO ujcms_model (id_, site_id_, name_, type_, scope_, order_, mains_, asides_, customs_) VALUES (1,NULL,'全局设置模型','global',2,32767,NULL,NULL,'[]');
INSERT INTO ujcms_model (id_, site_id_, name_, type_, scope_, order_, mains_, asides_, customs_) VALUES (2,NULL,'用户模型','user',2,32767,NULL,NULL,NULL);
INSERT INTO ujcms_model (id_, site_id_, name_, type_, scope_, order_, mains_, asides_, customs_) VALUES (11,1,'新闻','article',2,32767,'[{\"code\":\"title\",\"must\":true,\"show\":true,\"double\":false,\"required\":true,\"label\":\"article.title\"},{\"code\":\"subtitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.subtitle\"},{\"code\":\"fullTitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fullTitle\"},{\"code\":\"linkUrl\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.linkUrl\"},{\"code\":\"seoKeywords\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.seoKeywords\"},{\"code\":\"seoDescription\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.seoDescription\"},{\"code\":\"author\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.author\"},{\"code\":\"editor\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.editor\"},{\"code\":\"image\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"type\":\"image\",\"imageWidth\":300,\"imageHeight\":200,\"imageMode\":\"manual\",\"label\":\"article.image\"},{\"code\":\"file\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.file\"},{\"code\":\"video\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.video\"},{\"code\":\"doc\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.doc\"},{\"code\":\"imageList\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"type\":\"imageList\",\"imageMaxWidth\":1920,\"imageMaxHeight\":1920,\"label\":\"article.imageList\"},{\"code\":\"fileList\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fileList\"},{\"code\":\"text\",\"must\":false,\"show\":true,\"double\":false,\"required\":true,\"label\":\"article.text\"}]','[{\"code\":\"channel\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.channel\"},{\"code\":\"org\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.org\"},{\"code\":\"publishDate\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.publishDate\"},{\"code\":\"source\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.source\"},{\"code\":\"articleTemplate\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.articleTemplate\"},{\"code\":\"allowComment\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.allowComment\"},{\"code\":\"user\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.user\"},{\"code\":\"created\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.created\"},{\"code\":\"modifiedUser\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modifiedUser\"},{\"code\":\"modified\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modified\"}]','[]');
INSERT INTO ujcms_model (id_, site_id_, name_, type_, scope_, order_, mains_, asides_, customs_) VALUES (12,1,'常规','channel',2,32767,NULL,NULL,'[]');
INSERT INTO ujcms_model (id_, site_id_, name_, type_, scope_, order_, mains_, asides_, customs_) VALUES (13,1,'站点设置模型','site',2,32767,NULL,NULL,'[{\"code\":\"company\",\"type\":\"text\",\"name\":\"公司名称\",\"double\":false},{\"code\":\"icp\",\"type\":\"text\",\"name\":\"ICP备案号\",\"double\":false}]');
INSERT INTO ujcms_model (id_, site_id_, name_, type_, scope_, order_, mains_, asides_, customs_) VALUES (14,1,'图片','article',2,32767,'[{\"code\":\"title\",\"must\":true,\"show\":true,\"double\":false,\"required\":true,\"label\":\"article.title\"},{\"code\":\"subtitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.subtitle\"},{\"code\":\"fullTitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fullTitle\"},{\"code\":\"linkUrl\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.linkUrl\"},{\"code\":\"seoKeywords\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.seoKeywords\"},{\"code\":\"seoDescription\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.seoDescription\"},{\"code\":\"author\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.author\"},{\"code\":\"editor\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.editor\"},{\"code\":\"image\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"type\":\"image\",\"imageWidth\":300,\"imageHeight\":200,\"imageMode\":\"manual\",\"label\":\"article.image\"},{\"code\":\"file\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.file\"},{\"code\":\"video\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.video\"},{\"code\":\"doc\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.doc\"},{\"code\":\"imageList\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"type\":\"imageList\",\"imageMaxWidth\":1920,\"imageMaxHeight\":1920,\"label\":\"article.imageList\"},{\"code\":\"fileList\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fileList\"},{\"code\":\"text\",\"must\":false,\"show\":false,\"double\":false,\"required\":true,\"label\":\"article.text\"}]','[{\"code\":\"channel\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.channel\"},{\"code\":\"org\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.org\"},{\"code\":\"publishDate\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.publishDate\"},{\"code\":\"source\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.source\"},{\"code\":\"articleTemplate\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.articleTemplate\"},{\"code\":\"allowComment\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.allowComment\"},{\"code\":\"user\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.user\"},{\"code\":\"created\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.created\"},{\"code\":\"modifiedUser\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modifiedUser\"},{\"code\":\"modified\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modified\"}]',NULL);
INSERT INTO ujcms_model (id_, site_id_, name_, type_, scope_, order_, mains_, asides_, customs_) VALUES (15,1,'视频','article',2,32767,'[{\"code\":\"title\",\"must\":true,\"show\":true,\"double\":false,\"required\":true,\"label\":\"article.title\"},{\"code\":\"subtitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.subtitle\"},{\"code\":\"fullTitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fullTitle\"},{\"code\":\"linkUrl\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.linkUrl\"},{\"code\":\"seoKeywords\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.seoKeywords\"},{\"code\":\"seoDescription\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.seoDescription\"},{\"code\":\"author\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.author\"},{\"code\":\"editor\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.editor\"},{\"code\":\"image\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"type\":\"image\",\"imageWidth\":300,\"imageHeight\":200,\"imageMode\":\"manual\",\"label\":\"article.image\"},{\"code\":\"file\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.file\"},{\"code\":\"video\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.video\"},{\"code\":\"doc\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.doc\"},{\"code\":\"imageList\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"type\":\"imageList\",\"imageMaxWidth\":1920,\"imageMaxHeight\":1920,\"label\":\"article.imageList\"},{\"code\":\"fileList\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fileList\"},{\"code\":\"text\",\"must\":false,\"show\":false,\"double\":false,\"required\":true,\"label\":\"article.text\"}]','[{\"code\":\"channel\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.channel\"},{\"code\":\"org\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.org\"},{\"code\":\"publishDate\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.publishDate\"},{\"code\":\"source\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.source\"},{\"code\":\"articleTemplate\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.articleTemplate\"},{\"code\":\"allowComment\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.allowComment\"},{\"code\":\"user\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.user\"},{\"code\":\"created\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.created\"},{\"code\":\"modifiedUser\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modifiedUser\"},{\"code\":\"modified\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modified\"}]','[{\"code\":\"area\",\"type\":\"select\",\"name\":\"地区\",\"double\":true,\"dictTypeId\":105,\"defaultValue\":\"华语\"},{\"code\":\"type\",\"type\":\"select\",\"name\":\"类型\",\"double\":true,\"dictTypeId\":106,\"defaultValue\":\"喜剧\"}]');
INSERT INTO ujcms_model (id_, site_id_, name_, type_, scope_, order_, mains_, asides_, customs_) VALUES (16,1,'下载','article',2,32767,'[{\"code\":\"title\",\"must\":true,\"show\":true,\"double\":false,\"required\":true,\"label\":\"article.title\"},{\"code\":\"subtitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.subtitle\"},{\"code\":\"fullTitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fullTitle\"},{\"code\":\"linkUrl\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.linkUrl\"},{\"code\":\"seoKeywords\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.seoKeywords\"},{\"code\":\"seoDescription\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.seoDescription\"},{\"code\":\"author\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.author\"},{\"code\":\"editor\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.editor\"},{\"code\":\"image\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"type\":\"image\",\"imageWidth\":340,\"imageHeight\":340,\"imageMode\":\"manual\",\"label\":\"article.image\"},{\"code\":\"file\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.file\",\"name\":\"文件\"},{\"code\":\"video\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.video\"},{\"code\":\"doc\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.doc\"},{\"code\":\"imageList\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"type\":\"imageList\",\"imageMaxWidth\":1920,\"imageMaxHeight\":1920,\"label\":\"article.imageList\"},{\"code\":\"fileList\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fileList\"},{\"code\":\"text\",\"must\":false,\"show\":true,\"double\":false,\"required\":true,\"label\":\"article.text\"}]','[{\"code\":\"channel\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.channel\"},{\"code\":\"org\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.org\"},{\"code\":\"publishDate\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.publishDate\"},{\"code\":\"source\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.source\"},{\"code\":\"articleTemplate\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.articleTemplate\"},{\"code\":\"allowComment\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.allowComment\"},{\"code\":\"user\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.user\"},{\"code\":\"created\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.created\"},{\"code\":\"modifiedUser\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modifiedUser\"},{\"code\":\"modified\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modified\"}]','[{\"code\":\"type\",\"type\":\"radio\",\"name\":\"软件类型\",\"double\":true,\"checkStyle\":\"default\",\"dictTypeId\":100,\"defaultValue\":\"国产软件\"},{\"code\":\"license\",\"type\":\"radio\",\"name\":\"授权方式\",\"double\":true,\"checkStyle\":\"default\",\"dictTypeId\":101,\"defaultValue\":\"免费软件\"},{\"code\":\"language\",\"type\":\"select\",\"name\":\"界面语言\",\"double\":true,\"dictTypeId\":102,\"defaultValue\":\"简体中文\"},{\"code\":\"star\",\"type\":\"select\",\"name\":\"推荐星级\",\"double\":true,\"dictTypeId\":103,\"defaultValue\":\"★★★★☆\"},{\"code\":\"system\",\"type\":\"checkbox\",\"name\":\"运行环境\",\"double\":false,\"checkStyle\":\"default\",\"defaultValue\":[\"win7\",\"win10\"],\"multiple\":true,\"dictTypeId\":104}]');
INSERT INTO ujcms_model (id_, site_id_, name_, type_, scope_, order_, mains_, asides_, customs_) VALUES (17,1,'文库','article',2,32767,'[{\"code\":\"title\",\"must\":true,\"show\":true,\"double\":false,\"required\":true,\"label\":\"article.title\"},{\"code\":\"subtitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.subtitle\"},{\"code\":\"fullTitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fullTitle\"},{\"code\":\"linkUrl\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.linkUrl\"},{\"code\":\"seoKeywords\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.seoKeywords\"},{\"code\":\"seoDescription\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.seoDescription\"},{\"code\":\"author\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.author\"},{\"code\":\"editor\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.editor\"},{\"code\":\"image\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"type\":\"image\",\"imageWidth\":300,\"imageHeight\":300,\"imageMode\":\"resize\",\"label\":\"article.image\"},{\"code\":\"file\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.file\"},{\"code\":\"video\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.video\"},{\"code\":\"doc\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.doc\"},{\"code\":\"imageList\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"type\":\"imageList\",\"imageMaxWidth\":1920,\"imageMaxHeight\":1920,\"label\":\"article.imageList\"},{\"code\":\"fileList\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fileList\"},{\"code\":\"text\",\"must\":false,\"show\":false,\"double\":false,\"required\":true,\"label\":\"article.text\"}]','[{\"code\":\"channel\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.channel\"},{\"code\":\"org\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.org\"},{\"code\":\"publishDate\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.publishDate\"},{\"code\":\"source\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.source\"},{\"code\":\"articleTemplate\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.articleTemplate\"},{\"code\":\"allowComment\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.allowComment\"},{\"code\":\"user\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.user\"},{\"code\":\"created\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.created\"},{\"code\":\"modifiedUser\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modifiedUser\"},{\"code\":\"modified\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modified\"}]',NULL);
INSERT INTO ujcms_model (id_, site_id_, name_, type_, scope_, order_, mains_, asides_, customs_) VALUES (18,1,'产品（手机）','article',2,32767,'[{\"code\":\"title\",\"must\":true,\"show\":true,\"double\":false,\"required\":true,\"label\":\"article.title\"},{\"code\":\"subtitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.subtitle\"},{\"code\":\"fullTitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fullTitle\"},{\"code\":\"linkUrl\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.linkUrl\"},{\"code\":\"seoKeywords\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.seoKeywords\"},{\"code\":\"seoDescription\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.seoDescription\"},{\"code\":\"author\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.author\"},{\"code\":\"editor\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.editor\"},{\"code\":\"image\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"type\":\"image\",\"imageWidth\":800,\"imageHeight\":800,\"imageMode\":\"resize\",\"label\":\"article.image\"},{\"code\":\"file\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.file\"},{\"code\":\"video\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.video\"},{\"code\":\"doc\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.doc\"},{\"code\":\"imageList\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"type\":\"imageList\",\"imageMaxWidth\":1920,\"imageMaxHeight\":1920,\"label\":\"article.imageList\"},{\"code\":\"fileList\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fileList\"},{\"code\":\"text\",\"must\":false,\"show\":true,\"double\":false,\"required\":true,\"label\":\"article.text\",\"name\":\"产品介绍\"}]','[{\"code\":\"channel\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.channel\"},{\"code\":\"org\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.org\"},{\"code\":\"publishDate\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.publishDate\"},{\"code\":\"source\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.source\"},{\"code\":\"articleTemplate\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.articleTemplate\"},{\"code\":\"allowComment\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.allowComment\"},{\"code\":\"user\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.user\"},{\"code\":\"created\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.created\"},{\"code\":\"modifiedUser\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modifiedUser\"},{\"code\":\"modified\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modified\"}]','[{\"code\":\"price\",\"type\":\"number\",\"name\":\"价格\",\"double\":true,\"precision\":2},{\"code\":\"guidePrice\",\"type\":\"number\",\"name\":\"厂商指导价\",\"double\":true,\"precision\":2},{\"code\":\"storage\",\"type\":\"radio\",\"name\":\"机身存储\",\"double\":false,\"checkStyle\":\"default\",\"dictTypeId\":107},{\"code\":\"screen\",\"type\":\"radio\",\"name\":\"屏幕尺寸\",\"double\":false,\"checkStyle\":\"default\",\"dictTypeId\":108},{\"code\":\"specifications\",\"type\":\"tinyEditor\",\"name\":\"规格与包装\",\"double\":false,\"minHeight\":300,\"maxHeight\":500}]');
INSERT INTO ujcms_model (id_, site_id_, name_, type_, scope_, order_, mains_, asides_, customs_) VALUES (20,1,'产品（自行车）','article',2,32767,'[{\"code\":\"title\",\"must\":true,\"show\":true,\"double\":false,\"required\":true,\"label\":\"article.title\"},{\"code\":\"subtitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.subtitle\"},{\"code\":\"fullTitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fullTitle\"},{\"code\":\"linkUrl\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.linkUrl\"},{\"code\":\"seoKeywords\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.seoKeywords\"},{\"code\":\"seoDescription\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.seoDescription\"},{\"code\":\"author\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.author\"},{\"code\":\"editor\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.editor\"},{\"code\":\"image\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"type\":\"image\",\"imageWidth\":800,\"imageHeight\":800,\"imageMode\":\"resize\",\"label\":\"article.image\"},{\"code\":\"file\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.file\"},{\"code\":\"video\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.video\"},{\"code\":\"doc\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.doc\"},{\"code\":\"imageList\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"type\":\"imageList\",\"imageMaxWidth\":1920,\"imageMaxHeight\":1920,\"label\":\"article.imageList\"},{\"code\":\"fileList\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fileList\"},{\"code\":\"text\",\"must\":false,\"show\":true,\"double\":false,\"required\":true,\"label\":\"article.text\",\"name\":\"产品介绍\"}]','[{\"code\":\"channel\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.channel\"},{\"code\":\"org\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.org\"},{\"code\":\"publishDate\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.publishDate\"},{\"code\":\"source\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.source\"},{\"code\":\"articleTemplate\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.articleTemplate\"},{\"code\":\"allowComment\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.allowComment\"},{\"code\":\"user\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.user\"},{\"code\":\"created\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.created\"},{\"code\":\"modifiedUser\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modifiedUser\"},{\"code\":\"modified\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modified\"}]','[{\"code\":\"price\",\"type\":\"number\",\"name\":\"价格\",\"double\":true,\"precision\":2},{\"code\":\"guidePrice\",\"type\":\"number\",\"name\":\"厂商指导价\",\"double\":true,\"precision\":2},{\"code\":\"type\",\"type\":\"radio\",\"name\":\"类型\",\"double\":false,\"checkStyle\":\"default\",\"dictTypeId\":109},{\"code\":\"specifications\",\"type\":\"tinyEditor\",\"name\":\"规格与包装\",\"double\":false,\"minHeight\":300,\"maxHeight\":500}]');
INSERT INTO ujcms_model (id_, site_id_, name_, type_, scope_, order_, mains_, asides_, customs_) VALUES (21,1,'产品（相机）','article',2,32767,'[{\"code\":\"title\",\"must\":true,\"show\":true,\"double\":false,\"required\":true,\"label\":\"article.title\"},{\"code\":\"subtitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.subtitle\"},{\"code\":\"fullTitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fullTitle\"},{\"code\":\"linkUrl\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.linkUrl\"},{\"code\":\"seoKeywords\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.seoKeywords\"},{\"code\":\"seoDescription\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.seoDescription\"},{\"code\":\"author\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.author\"},{\"code\":\"editor\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.editor\"},{\"code\":\"image\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"type\":\"image\",\"imageWidth\":800,\"imageHeight\":800,\"imageMode\":\"resize\",\"label\":\"article.image\"},{\"code\":\"file\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.file\"},{\"code\":\"video\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.video\"},{\"code\":\"doc\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.doc\"},{\"code\":\"imageList\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"type\":\"imageList\",\"imageMaxWidth\":1920,\"imageMaxHeight\":1920,\"label\":\"article.imageList\"},{\"code\":\"fileList\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fileList\"},{\"code\":\"text\",\"must\":false,\"show\":true,\"double\":false,\"required\":true,\"label\":\"article.text\",\"name\":\"产品介绍\"}]','[{\"code\":\"channel\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.channel\"},{\"code\":\"org\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.org\"},{\"code\":\"publishDate\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.publishDate\"},{\"code\":\"source\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.source\"},{\"code\":\"articleTemplate\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.articleTemplate\"},{\"code\":\"allowComment\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.allowComment\"},{\"code\":\"user\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.user\"},{\"code\":\"created\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.created\"},{\"code\":\"modifiedUser\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modifiedUser\"},{\"code\":\"modified\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modified\"}]','[{\"code\":\"price\",\"type\":\"number\",\"name\":\"价格\",\"double\":true},{\"code\":\"guidePrice\",\"type\":\"number\",\"name\":\"厂商指导价\",\"double\":true,\"precision\":2},{\"code\":\"type\",\"type\":\"radio\",\"name\":\"类型\",\"double\":true,\"checkStyle\":\"default\",\"dictTypeId\":110},{\"code\":\"mount\",\"type\":\"radio\",\"name\":\"卡口\",\"double\":true,\"checkStyle\":\"default\",\"dictTypeId\":111},{\"code\":\"specifications\",\"type\":\"tinyEditor\",\"name\":\"规格与包装\",\"double\":false,\"minHeight\":300,\"maxHeight\":500}]');
INSERT INTO ujcms_org (id_, parent_id_, name_, phone_, address_, contacts_, depth_, order_) VALUES (1,NULL,'总公司',NULL,NULL,NULL,1,999);
INSERT INTO ujcms_org_tree (ancestor_id_, descendant_id_) VALUES (1,1);
INSERT INTO ujcms_role (id_, site_id_, name_, description_, permission_, rank_, order_) VALUES (1,1,'管理角色',NULL,'auth,storage:page,storage:list,password:update,article:page,article:list,channel:list,dict:list,model:list,article:create,article:update,article:show,article:delete,channel:page,channel:list,channel:create,channel:update,channel:show,channel:delete,blockItem:page,blockItem:list,block:list,blockItem:create,blockItem:update,blockItem:show,blockItem:delete,attachment:page,attachment:list,attachment:create,attachment:update,attachment:show,attachment:delete,generator:show,generator:fulltext:reindexAll,generator:fulltext:reindexSite,globalSettings:show,globalSettings:update,siteSettings:show,siteSettings:update,model:page,model:list,model:create,model:update,model:show,model:delete,block:page,block:list,block:create,block:update,block:show,block:delete,dictType:page,dictType:list,dictType:create,dictType:update,dictType:show,dictType:delete,dict:page,dict:list,dictType:list,dict:create,dict:update,dict:show,dict:delete,user:page,user:list,group:list,org:list,user:create,user:update,user:show,user:delete,role:page,role:list,role:create,role:update,role:show,role:delete,group:page,group:list,group:create,group:update,group:show,group:delete,org:page,org:list,org:create,org:update,org:show,org:delete,site:page,site:list,org:list,model:list,storage:list,site:create,site:update,site:show,site:delete,storage:create,storage:update,storage:show,storage:delete',1,1);
INSERT INTO ujcms_seq (name_, next_val_, cache_size_) VALUES ('article',55,0);
INSERT INTO ujcms_seq (name_, next_val_, cache_size_) VALUES ('attachment',397,0);
INSERT INTO ujcms_seq (name_, next_val_, cache_size_) VALUES ('block',3,0);
INSERT INTO ujcms_seq (name_, next_val_, cache_size_) VALUES ('block_item',8,0);
INSERT INTO ujcms_seq (name_, next_val_, cache_size_) VALUES ('channel',39,0);
INSERT INTO ujcms_seq (name_, next_val_, cache_size_) VALUES ('dict',69,0);
INSERT INTO ujcms_seq (name_, next_val_, cache_size_) VALUES ('dict_type',112,0);
INSERT INTO ujcms_seq (name_, next_val_, cache_size_) VALUES ('group',11,0);
INSERT INTO ujcms_seq (name_, next_val_, cache_size_) VALUES ('model',22,0);
INSERT INTO ujcms_seq (name_, next_val_, cache_size_) VALUES ('org',111,0);
INSERT INTO ujcms_seq (name_, next_val_, cache_size_) VALUES ('role',3,0);
INSERT INTO ujcms_seq (name_, next_val_, cache_size_) VALUES ('site',3,0);
INSERT INTO ujcms_seq (name_, next_val_, cache_size_) VALUES ('storage',4,0);
INSERT INTO ujcms_seq (name_, next_val_, cache_size_) VALUES ('user',13,0);
INSERT INTO ujcms_site (id_, parent_id_, org_id_, model_id_, storage_id_, html_storage_id_, mobile_storage_id_, name_, protocol_, domain_, sub_dir_, theme_, mobile_theme_, page_size_, logo_, seo_title_, seo_keywords_, seo_description_, watermark_settings_, depth_, order_, status_) VALUES (1,NULL,1,13,2,1,1,'UJCMS演示站','http','localhost',NULL,'/1/default','/1/default',8,NULL,NULL,NULL,NULL,'{\"enabled\":false,\"overlay\":null,\"position\":9,\"dissolve\":50,\"minWidth\":300,\"minHeight\":300}',1,1,0);
INSERT INTO ujcms_site_buffer (id_, views_) VALUES (1,622);
INSERT INTO ujcms_site_custom (site_id_, name_, value_) VALUES (1,'icp','赣ICP备12001124号-1');
INSERT INTO ujcms_site_custom (site_id_, name_, value_) VALUES (1,'company','蓝智科技');
INSERT INTO ujcms_site_tree (ancestor_id_, descendant_id_) VALUES (1,1);
INSERT INTO ujcms_storage (id_, site_id_, name_, description_, type_, mode_, scope_, path_, url_, attrs_, order_) VALUES (1,1,'HTML默认存储点',NULL,1,0,2,NULL,NULL,NULL,1);
INSERT INTO ujcms_storage (id_, site_id_, name_, description_, type_, mode_, scope_, path_, url_, attrs_, order_) VALUES (2,1,'附件默认存储点',NULL,2,0,2,'/uploads','/uploads',NULL,2);
INSERT INTO ujcms_user (id_, group_id_, org_id_, username_, password_, salt_, email_, mobile_, alias_, display_name_, avatar_, rank_, status_) VALUES (1,8,1,'admin','X2Sux/wQsvgvjY3/1P3epC3cCRV5+e5r1sNIM+UeWLU=','IJ6Gp9dJX1uj8fnmuHcGmw==',NULL,NULL,NULL,NULL,NULL,0,0);
INSERT INTO ujcms_user_ext (id_, real_name_, gender_, birthday_, location_, bio_, created_, login_date_, login_ip_, login_count_, error_date_, error_count_) VALUES (1,NULL,'m',NULL,NULL,NULL,'2021-03-18 12:25:06','2022-01-05 21:38:52','0:0:0:0:0:0:0:1',1,'2021-03-18 12:25:06',0);
INSERT INTO ujcms_user_role (user_id_, role_id_, order_) VALUES (1,1,9999);

ALTER TABLE ujcms_article
    ADD CONSTRAINT fk_article_channel FOREIGN KEY (channel_id_) REFERENCES ujcms_channel (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_article
    ADD CONSTRAINT fk_article_user FOREIGN KEY (user_id_) REFERENCES ujcms_user (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_article
    ADD CONSTRAINT fk_article_user_modified FOREIGN KEY (modified_user_id_) REFERENCES ujcms_user (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_article
    ADD CONSTRAINT fk_article_website FOREIGN KEY (site_id_) REFERENCES ujcms_site (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_article
    ADD CONSTRAINT fk_article_org FOREIGN KEY (org_id_) REFERENCES ujcms_org (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_article_buffer
    ADD CONSTRAINT fk_articlebuffer_article FOREIGN KEY (id_) REFERENCES ujcms_article (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_article_custom
    ADD CONSTRAINT fk_articlecustom_article FOREIGN KEY (article_id_) REFERENCES ujcms_article (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_article_ext
    ADD CONSTRAINT fk_articleext_article FOREIGN KEY (id_) REFERENCES ujcms_article (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_article_file
    ADD CONSTRAINT fk_articlefile_article FOREIGN KEY (article_id_) REFERENCES ujcms_article (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_article_image
    ADD CONSTRAINT fk_articleimage_article FOREIGN KEY (article_id_) REFERENCES ujcms_article (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_article_stat
    ADD CONSTRAINT fk_articlestat_article FOREIGN KEY (article_id_) REFERENCES ujcms_article (id_);
ALTER TABLE ujcms_article_tag
    ADD CONSTRAINT fk_articletag_article FOREIGN KEY (article_id_) REFERENCES ujcms_article (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_article_tag
    ADD CONSTRAINT fk_articletag_tag FOREIGN KEY (tag_id_) REFERENCES ujcms_tag (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_attachment
    ADD CONSTRAINT fk_attachment_site FOREIGN KEY (site_id_) REFERENCES ujcms_site (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_attachment
    ADD CONSTRAINT fk_attachment_user FOREIGN KEY (user_id_) REFERENCES ujcms_user (id_) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE ujcms_attachment_refer
    ADD CONSTRAINT fk_attachmentrefer_attachment FOREIGN KEY (attachment_id_) REFERENCES ujcms_attachment (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_block
    ADD CONSTRAINT fk_block_site FOREIGN KEY (site_id_) REFERENCES ujcms_site (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_block_item
    ADD CONSTRAINT fk_blockitem_block FOREIGN KEY (block_id_) REFERENCES ujcms_block (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_block_item
    ADD CONSTRAINT fk_blockitem_article FOREIGN KEY (article_id_) REFERENCES ujcms_article (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_block_item
    ADD CONSTRAINT fk_blockitem_site FOREIGN KEY (site_id_) REFERENCES ujcms_site (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_channel
    ADD CONSTRAINT fk_channel_model_article FOREIGN KEY (article_model_id_) REFERENCES ujcms_model (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_channel
    ADD CONSTRAINT fk_channel_model_channel FOREIGN KEY (channel_model_id_) REFERENCES ujcms_model (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_channel
    ADD CONSTRAINT fk_channel_parent FOREIGN KEY (parent_id_) REFERENCES ujcms_channel (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_channel
    ADD CONSTRAINT fk_channel_site FOREIGN KEY (site_id_) REFERENCES ujcms_site (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_channel_buffer
    ADD CONSTRAINT fk_channelbuffer_channel FOREIGN KEY (id_) REFERENCES ujcms_channel (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_channel_custom
    ADD CONSTRAINT fk_channel_custom FOREIGN KEY (channel_id_) REFERENCES ujcms_channel (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_channel_ext
    ADD CONSTRAINT fk_channelext_channel FOREIGN KEY (id_) REFERENCES ujcms_channel (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_channel_group
    ADD CONSTRAINT fk_channelgroup_channel FOREIGN KEY (channel_id_) REFERENCES ujcms_channel (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_channel_group
    ADD CONSTRAINT fk_channelgroup_group FOREIGN KEY (group_id_) REFERENCES ujcms_group (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_channel_role
    ADD CONSTRAINT fk_channelrole_channel FOREIGN KEY (channel_id_) REFERENCES ujcms_channel (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_channel_role
    ADD CONSTRAINT fk_channelrole_role FOREIGN KEY (role_id_) REFERENCES ujcms_role (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_channel_tree
    ADD CONSTRAINT fk_channeltree_ancestor FOREIGN KEY (ancestor_id_) REFERENCES ujcms_channel (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_channel_tree
    ADD CONSTRAINT fk_channeltree_descendant FOREIGN KEY (descendant_id_) REFERENCES ujcms_channel (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_dict
    ADD CONSTRAINT fk_dict_dicttype FOREIGN KEY (type_id_) REFERENCES ujcms_dict_type (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_dict
    ADD CONSTRAINT fk_dict_parent FOREIGN KEY (parent_id_) REFERENCES ujcms_dict (id_) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE ujcms_dict_type
    ADD CONSTRAINT fk_dicttype_site FOREIGN KEY (site_id_) REFERENCES ujcms_site (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_model
    ADD CONSTRAINT fk_model_site FOREIGN KEY (site_id_) REFERENCES ujcms_site (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_org
    ADD CONSTRAINT fk_org_parent FOREIGN KEY (parent_id_) REFERENCES ujcms_org (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_org_tree
    ADD CONSTRAINT fk_orgtree_ancestor FOREIGN KEY (ancestor_id_) REFERENCES ujcms_org (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_org_tree
    ADD CONSTRAINT fk_orgtree_descendant FOREIGN KEY (descendant_id_) REFERENCES ujcms_org (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_push
    ADD CONSTRAINT fk_push_article_from FOREIGN KEY (from_article_id_) REFERENCES ujcms_article (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_push
    ADD CONSTRAINT fk_push_article_to FOREIGN KEY (to_article_id_) REFERENCES ujcms_article (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_push
    ADD CONSTRAINT fk_push_site_from FOREIGN KEY (from_site_id_) REFERENCES ujcms_site (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_push
    ADD CONSTRAINT fk_push_site_to FOREIGN KEY (to_site_id_) REFERENCES ujcms_site (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_push
    ADD CONSTRAINT fk_push_user FOREIGN KEY (user_id_) REFERENCES ujcms_user (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_role
    ADD CONSTRAINT fk_role_site FOREIGN KEY (site_id_) REFERENCES ujcms_site (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_site
    ADD CONSTRAINT fk_site_org FOREIGN KEY (org_id_) REFERENCES ujcms_org (id_) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE ujcms_site
    ADD CONSTRAINT fk_site_parent FOREIGN KEY (parent_id_) REFERENCES ujcms_site (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_site_buffer
    ADD CONSTRAINT fk_sitebuffer_site FOREIGN KEY (id_) REFERENCES ujcms_site (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_site_custom
    ADD CONSTRAINT fk_sitecustom_site FOREIGN KEY (site_id_) REFERENCES ujcms_site (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_site_tree
    ADD CONSTRAINT fk_sitetree_ancestor FOREIGN KEY (ancestor_id_) REFERENCES ujcms_site (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_site_tree
    ADD CONSTRAINT fk_sitetree_descendant FOREIGN KEY (descendant_id_) REFERENCES ujcms_site (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_storage
    ADD CONSTRAINT fk_storage_site FOREIGN KEY (site_id_) REFERENCES ujcms_site (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_tag
    ADD CONSTRAINT fk_tag_site FOREIGN KEY (site_id_) REFERENCES ujcms_site (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_tag
    ADD CONSTRAINT fk_tag_user FOREIGN KEY (user_id_) REFERENCES ujcms_user (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_user
    ADD CONSTRAINT fk_user_group FOREIGN KEY (group_id_) REFERENCES ujcms_group (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_user
    ADD CONSTRAINT fk_user_org FOREIGN KEY (org_id_) REFERENCES ujcms_org (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_user_ext
    ADD CONSTRAINT fk_userext_user FOREIGN KEY (id_) REFERENCES ujcms_user (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_user_openid
    ADD CONSTRAINT fk_useropenid_user FOREIGN KEY (user_id_) REFERENCES ujcms_user (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_user_role
    ADD CONSTRAINT fk_userrole_role FOREIGN KEY (role_id_) REFERENCES ujcms_role (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ujcms_user_role
    ADD CONSTRAINT fk_userrole_user FOREIGN KEY (user_id_) REFERENCES ujcms_user (id_) ON DELETE RESTRICT ON UPDATE RESTRICT;
