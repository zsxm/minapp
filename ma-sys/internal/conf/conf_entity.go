package conf

import (
	"gopkg.in/goyy/goyy.v0/data/entity"
	"gopkg.in/goyy/goyy.v0/data/schema"
)

//go:generate xgen -entity=$GOFILE -scaffold -clipath=minapp/ma-bms -apipath=minapp/ma-sys -tstpath=minapp/hn-tst

// 配置实体结构.
// @entity(module:"conf" project:"sys")
type Entity struct {
	entity.Sys
	table   schema.Table  `db:"table=sys_conf&comment=配置"`
	name    entity.String `db:"column=name&comment=名称"`
	code    entity.String `db:"column=code&comment=编号"`
	content entity.String `db:"column=content&comment=内容"`
	genre   entity.String `db:"column=genre&comment=类型"`
	usable  entity.String `db:"column=usable&comment=是否可用"`
	ordinal entity.String `db:"column=ordinal&comment=排序"`
}
