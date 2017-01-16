drop table if exists se_release;

create table se_release (
	id                             varchar(50) not null          comment '主键',
	name                           varchar(255)                  comment '产品名称',
	ver                            varchar(10)                   comment '产品版本',
	memo                           varchar(1000)                 comment '产品描述',
	mobile                         varchar(100)                  comment '手机号码',
	url                            varchar(255)                  comment 'H5网址',
	email                          varchar(255)                  comment '联系邮箱',
	reward_num                     int                           comment '奖励数量',
	task_money                     decimal(11,3)                 comment '任务金额',
	exec_cycle                     varchar(255)                  comment '执行周期',
	task_remark                    varchar(1000)                 comment '任务说明',
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

alter table se_release comment '商店发布表';

