package dict

import (
	"gopkg.in/goyy/goyy.v0/data/entity"
	"gopkg.in/goyy/goyy.v0/data/schema"
)

//go:generate xgen -entity=$GOFILE -scaffold -clipath=minapp/ma-bms -apipath=minapp/ma-sys -tstpath=minapp/hn-tst

// 字典实体结构.
// @entity(module:"dict" project:"sys")
type Entity struct {
	entity.Sys
	table   schema.Table  `db:"table=sys_dict&comment=字典"`
	genre   entity.String `db:"column=genre&comment=类型"`
	descr   entity.String `db:"column=descr&comment=描述"`
	mkey    entity.String `db:"column=mkey&comment=键"`
	mval    entity.String `db:"column=mval&comment=值"`
	filters entity.String `db:"column=filters&comment=过滤"`
	ordinal entity.String `db:"column=ordinal&comment=排序"`
}
