drop table if exists xcx_issue;

drop table if exists sys_menu;

drop table if exists sys_post;

drop table if exists sys_post_menu;

drop table if exists sys_role;

drop table if exists sys_role_post;

drop table if exists sys_area;

drop table if exists sys_org;

drop table if exists sys_user;

drop table if exists sys_user_role;

drop table if exists sys_dict;

drop table if exists sys_blacklist;

drop table if exists sys_conf;

create table xcx_issue (
	id                             varchar(50) not null          comment '主键',
	memo                           varchar(1000)                 comment '备注',
	creates                        varchar(50)                   comment '创建机构',
	creater                        varchar(50)                   comment '创建人员',
	created                        bigint                        comment '创建时间',
	modifier                       varchar(50)                   comment '更新人员',
	modified                       bigint                        comment '更新时间',
	version                        int default 0                 comment '乐观锁',
	deletion                       tinyint default 0             comment '逻辑删除标志',
	artifical                      tinyint default 0             comment '是否是人造数据',
	history                        tinyint default 0             comment '历史数据',
	primary key (id)
);

alter table xcx_issue comment '小程序发布表';

create table sys_menu (
	id                             varchar(50) not null          comment '主键',
	href                           varchar(1000)                 comment '链接',
	target                         varchar(100)                  comment '目标',
	icon                           varchar(100)                  comment '图标',
	hidden                         tinyint                       comment '隐藏',
	permission                     varchar(1000)                 comment '权限',
	code                           varchar(100)                  comment '编号',
	name                           varchar(255)                  comment '名称',
	fullname                       varchar(1000)                 comment '全称',
	genre                          varchar(100)                  comment '类型',
	ordinal                        varchar(100)                  comment '排序',
	parent_id                      varchar(50)                   comment '父表主键',
	parent_ids                     varchar(1000)                 comment '父ID集',
	parent_codes                   varchar(1000)                 comment '父编号集',
	parent_names                   varchar(1000)                 comment '父名称集',
	leaf                           int                           comment '是否叶子',
	grade                          int                           comment '节点等级',
	memo                           varchar(1000)                 comment '备注',
	creates                        varchar(50)                   comment '创建机构',
	creater                        varchar(50)                   comment '创建人员',
	created                        bigint                        comment '创建时间',
	modifier                       varchar(50)                   comment '更新人员',
	modified                       bigint                        comment '更新时间',
	version                        int default 0                 comment '乐观锁',
	deletion                       tinyint default 0             comment '逻辑删除标志',
	artifical                      tinyint default 0             comment '是否是人造数据',
	history                        tinyint default 0             comment '历史数据',
	primary key (id)
);

alter table sys_menu comment '菜单信息表';

create table sys_post (
	id                             varchar(50) not null          comment '主键',
	code                           varchar(100)                  comment '编号',
	name                           varchar(255)                  comment '名称',
	fullname                       varchar(1000)                 comment '全称',
	genre                          varchar(100)                  comment '类型',
	ordinal                        varchar(100)                  comment '排序',
	parent_id                      varchar(50)                   comment '父表主键',
	parent_ids                     varchar(1000)                 comment '父ID集',
	parent_codes                   varchar(1000)                 comment '父编号集',
	parent_names                   varchar(1000)                 comment '父名称集',
	leaf                           int                           comment '是否叶子',
	grade                          int                           comment '节点等级',
	memo                           varchar(1000)                 comment '备注',
	creates                        varchar(50)                   comment '创建机构',
	creater                        varchar(50)                   comment '创建人员',
	created                        bigint                        comment '创建时间',
	modifier                       varchar(50)                   comment '更新人员',
	modified                       bigint                        comment '更新时间',
	version                        int default 0                 comment '乐观锁',
	deletion                       tinyint default 0             comment '逻辑删除标志',
	artifical                      tinyint default 0             comment '是否是人造数据',
	history                        tinyint default 0             comment '历史数据',
	primary key (id)
);

alter table sys_post comment '岗位信息表';

create table sys_post_menu (
	id                             varchar(50) not null          comment '主键',
	post_id                        varchar(50)                   comment '岗位ID',
	menu_id                        varchar(50)                   comment '菜单ID',
	memo                           varchar(1000)                 comment '备注',
	creates                        varchar(50)                   comment '创建机构',
	creater                        varchar(50)                   comment '创建人员',
	created                        bigint                        comment '创建时间',
	modifier                       varchar(50)                   comment '更新人员',
	modified                       bigint                        comment '更新时间',
	version                        int default 0                 comment '乐观锁',
	deletion                       tinyint default 0             comment '逻辑删除标志',
	artifical                      tinyint default 0             comment '是否是人造数据',
	history                        tinyint default 0             comment '历史数据',
	primary key (id)
);

alter table sys_post_menu comment '岗位菜单信息表';

create table sys_role (
	id                             varchar(50) not null          comment '主键',
	name                           varchar(255)                  comment '名称',
	code                           varchar(100)                  comment '编号',
	genre                          varchar(100)                  comment '系统类型：10.功能权限，20.数据权限',
	classify                       varchar(100)                  comment '业务分类',
	ordinal                        varchar(100)                  comment '排序',
	memo                           varchar(1000)                 comment '备注',
	creates                        varchar(50)                   comment '创建机构',
	creater                        varchar(50)                   comment '创建人员',
	created                        bigint                        comment '创建时间',
	modifier                       varchar(50)                   comment '更新人员',
	modified                       bigint                        comment '更新时间',
	version                        int default 0                 comment '乐观锁',
	deletion                       tinyint default 0             comment '逻辑删除标志',
	artifical                      tinyint default 0             comment '是否是人造数据',
	history                        tinyint default 0             comment '历史数据',
	primary key (id)
);

alter table sys_role comment '角色信息表';

create table sys_role_post (
	id                             varchar(50) not null          comment '主键',
	role_id                        varchar(50)                   comment '角色ID',
	post_id                        varchar(50)                   comment '岗位ID',
	memo                           varchar(1000)                 comment '备注',
	creates                        varchar(50)                   comment '创建机构',
	creater                        varchar(50)                   comment '创建人员',
	created                        bigint                        comment '创建时间',
	modifier                       varchar(50)                   comment '更新人员',
	modified                       bigint                        comment '更新时间',
	version                        int default 0                 comment '乐观锁',
	deletion                       tinyint default 0             comment '逻辑删除标志',
	artifical                      tinyint default 0             comment '是否是人造数据',
	history                        tinyint default 0             comment '历史数据',
	primary key (id)
);

alter table sys_role_post comment '角色岗位信息表';

create table sys_area (
	id                             varchar(50) not null          comment '主键',
	code                           varchar(100)                  comment '编号',
	name                           varchar(255)                  comment '名称',
	fullname                       varchar(1000)                 comment '全称',
	genre                          varchar(100)                  comment '类型',
	ordinal                        varchar(100)                  comment '排序',
	parent_id                      varchar(50)                   comment '父表主键',
	parent_ids                     varchar(1000)                 comment '父ID集',
	parent_codes                   varchar(1000)                 comment '父编号集',
	parent_names                   varchar(1000)                 comment '父名称集',
	leaf                           int                           comment '是否叶子',
	grade                          int                           comment '节点等级',
	memo                           varchar(1000)                 comment '备注',
	creates                        varchar(50)                   comment '创建机构',
	creater                        varchar(50)                   comment '创建人员',
	created                        bigint                        comment '创建时间',
	modifier                       varchar(50)                   comment '更新人员',
	modified                       bigint                        comment '更新时间',
	version                        int default 0                 comment '乐观锁',
	deletion                       tinyint default 0             comment '逻辑删除标志',
	artifical                      tinyint default 0             comment '是否是人造数据',
	history                        tinyint default 0             comment '历史数据',
	primary key (id)
);

alter table sys_area comment '区域信息表';

create table sys_org (
	id                             varchar(50) not null          comment '主键',
	area_id                        varchar(50)                   comment '所属区域',
	code                           varchar(100)                  comment '编号',
	name                           varchar(255)                  comment '名称',
	fullname                       varchar(1000)                 comment '全称',
	genre                          varchar(100)                  comment '类型',
	ordinal                        varchar(100)                  comment '排序',
	parent_id                      varchar(50)                   comment '父表主键',
	parent_ids                     varchar(1000)                 comment '父ID集',
	parent_codes                   varchar(1000)                 comment '父编号集',
	parent_names                   varchar(1000)                 comment '父名称集',
	leaf                           int                           comment '是否叶子',
	grade                          int                           comment '节点等级',
	memo                           varchar(1000)                 comment '备注',
	creates                        varchar(50)                   comment '创建机构',
	creater                        varchar(50)                   comment '创建人员',
	created                        bigint                        comment '创建时间',
	modifier                       varchar(50)                   comment '更新人员',
	modified                       bigint                        comment '更新时间',
	version                        int default 0                 comment '乐观锁',
	deletion                       tinyint default 0             comment '逻辑删除标志',
	artifical                      tinyint default 0             comment '是否是人造数据',
	history                        tinyint default 0             comment '历史数据',
	primary key (id)
);

alter table sys_org comment '机构信息表';

create table sys_user (
	id                             varchar(50) not null          comment '主键',
	name                           varchar(255)                  comment '名称',
	code                           varchar(100)                  comment '编号',
	passwd                         varchar(255)                  comment '密码',
	genre                          varchar(100)                  comment '类型',
	email                          varchar(255)                  comment '邮件',
	tel                            varchar(100)                  comment '电话',
	mobile                         varchar(100)                  comment '手机',
	area_id                        varchar(50)                   comment '所属区域',
	org_id                         varchar(50)                   comment '所属机构',
	login_name                     varchar(100)                  comment '登录名',
	login_ip                       varchar(100)                  comment '登录IP',
	login_time                     bigint                        comment '登录时间',
	memo                           varchar(1000)                 comment '备注',
	creates                        varchar(50)                   comment '创建机构',
	creater                        varchar(50)                   comment '创建人员',
	created                        bigint                        comment '创建时间',
	modifier                       varchar(50)                   comment '更新人员',
	modified                       bigint                        comment '更新时间',
	version                        int default 0                 comment '乐观锁',
	deletion                       tinyint default 0             comment '逻辑删除标志',
	artifical                      tinyint default 0             comment '是否是人造数据',
	history                        tinyint default 0             comment '历史数据',
	primary key (id)
);

alter table sys_user comment '用户信息表';

create table sys_user_role (
	id                             varchar(50) not null          comment '主键',
	user_id                        varchar(50)                   comment '用户ID',
	role_id                        varchar(50)                   comment '角色ID',
	memo                           varchar(1000)                 comment '备注',
	creates                        varchar(50)                   comment '创建机构',
	creater                        varchar(50)                   comment '创建人员',
	created                        bigint                        comment '创建时间',
	modifier                       varchar(50)                   comment '更新人员',
	modified                       bigint                        comment '更新时间',
	version                        int default 0                 comment '乐观锁',
	deletion                       tinyint default 0             comment '逻辑删除标志',
	artifical                      tinyint default 0             comment '是否是人造数据',
	history                        tinyint default 0             comment '历史数据',
	primary key (id)
);

alter table sys_user_role comment '用户角色信息表';

create table sys_dict (
	id                             varchar(50) not null          comment '主键',
	genre                          varchar(100)                  comment '类型',
	descr                          varchar(2000)                 comment '描述',
	mkey                           varchar(10)                   comment '键',
	mval                           varchar(255)                  comment '值',
	filters                        varchar(255)                  comment '过滤',
	ordinal                        varchar(100)                  comment '排序',
	memo                           varchar(1000)                 comment '备注',
	creates                        varchar(50)                   comment '创建机构',
	creater                        varchar(50)                   comment '创建人员',
	created                        bigint                        comment '创建时间',
	modifier                       varchar(50)                   comment '更新人员',
	modified                       bigint                        comment '更新时间',
	version                        int default 0                 comment '乐观锁',
	deletion                       tinyint default 0             comment '逻辑删除标志',
	artifical                      tinyint default 0             comment '是否是人造数据',
	history                        tinyint default 0             comment '历史数据',
	primary key (id)
);

alter table sys_dict comment '字典信息表';

create table sys_blacklist (
	id                             varchar(50) not null          comment '主键',
	name                           varchar(255)                  comment '名称',
	genre                          varchar(100)                  comment '类型',
	usable                         varchar(10)                   comment '是否可用',
	memo                           varchar(1000)                 comment '备注',
	creates                        varchar(50)                   comment '创建机构',
	creater                        varchar(50)                   comment '创建人员',
	created                        bigint                        comment '创建时间',
	modifier                       varchar(50)                   comment '更新人员',
	modified                       bigint                        comment '更新时间',
	version                        int default 0                 comment '乐观锁',
	deletion                       tinyint default 0             comment '逻辑删除标志',
	artifical                      tinyint default 0             comment '是否是人造数据',
	history                        tinyint default 0             comment '历史数据',
	primary key (id)
);

alter table sys_blacklist comment '黑名单信息表';

create table sys_conf (
	id                             varchar(50) not null          comment '主键',
	name                           varchar(255)                  comment '名称',
	code                           varchar(100)                  comment '编号',
	content                        varchar(2000)                 comment '内容',
	genre                          varchar(100)                  comment '类型',
	usable                         varchar(10)                   comment '是否可用',
	ordinal                        varchar(100)                  comment '排序',
	memo                           varchar(1000)                 comment '备注',
	creates                        varchar(50)                   comment '创建机构',
	creater                        varchar(50)                   comment '创建人员',
	created                        bigint                        comment '创建时间',
	modifier                       varchar(50)                   comment '更新人员',
	modified                       bigint                        comment '更新时间',
	version                        int default 0                 comment '乐观锁',
	deletion                       tinyint default 0             comment '逻辑删除标志',
	artifical                      tinyint default 0             comment '是否是人造数据',
	history                        tinyint default 0             comment '历史数据',
	primary key (id)
);

alter table sys_conf comment '配置信息表';

