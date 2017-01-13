package user

import (
	"gopkg.in/goyy/goyy.v0/data/entity"
	"gopkg.in/goyy/goyy.v0/data/schema"
)

//go:generate xgen -entity=$GOFILE -scaffold -clipath=minapp/ma-bms -apipath=minapp/ma-sys -tstpath=minapp/hn-tst

// 用户实体结构.
// @entity(module:"user" project:"sys")
type Entity struct {
	entity.Sys
	table     schema.Table  `db:"table=sys_user&comment=用户"`
	name      entity.String `db:"column=name&comment=名称"`
	code      entity.String `db:"column=code&comment=编号"`
	passwd    entity.String `db:"column=passwd&comment=密码"`
	genre     entity.String `db:"column=genre&comment=类型"`
	email     entity.String `db:"column=email&comment=邮件"`
	tel       entity.String `db:"column=tel&comment=电话"`
	mobile    entity.String `db:"column=mobile&comment=手机"`
	areaId    entity.String `db:"column=area_id&comment=所属区域"`
	orgId     entity.String `db:"column=org_id&comment=所属机构"`
	loginName entity.String `db:"column=login_name&comment=登录名"`
	loginIp   entity.String `db:"column=login_ip&comment=登录IP"`
	loginTime entity.Int64  `db:"column=login_time&comment=登录时间"`
}
