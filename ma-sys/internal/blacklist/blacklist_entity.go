package blacklist

import (
	"gopkg.in/goyy/goyy.v0/data/entity"
	"gopkg.in/goyy/goyy.v0/data/schema"
)

//go:generate xgen -entity=$GOFILE -scaffold -clipath=minapp/ma-bms -apipath=minapp/ma-sys -tstpath=minapp/hn-tst

// 黑名单实体结构.
// @entity(module:"blacklist" project:"sys")
type Entity struct {
	entity.Sys
	table  schema.Table  `db:"table=sys_blacklist&comment=黑名单"`
	name   entity.String `db:"column=name&comment=名称"`
	genre  entity.String `db:"column=genre&comment=类型"`
	usable entity.String `db:"column=usable&comment=是否可用"`
}
