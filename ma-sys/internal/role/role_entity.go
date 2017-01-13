package role

import (
	"gopkg.in/goyy/goyy.v0/data/entity"
	"gopkg.in/goyy/goyy.v0/data/schema"
)

//go:generate xgen -entity=$GOFILE -scaffold -clipath=minapp/ma-bms -apipath=minapp/ma-sys -tstpath=minapp/hn-tst

// 角色实体结构.
// @entity(module:"role" project:"sys")
type Entity struct {
	entity.Sys
	table    schema.Table  `db:"table=sys_role&comment=角色"`
	name     entity.String `db:"column=name&comment=名称"`
	code     entity.String `db:"column=code&comment=编号"`
	genre    entity.String `db:"column=genre&comment=系统类型"`
	classify entity.String `db:"column=classify&comment=业务分类"`
	ordinal  entity.String `db:"column=ordinal&comment=排序"`
}
