drop table if exists xcx_issue;

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

