package org

import (
	"gopkg.in/goyy/goyy.v0/data/entity"
	"gopkg.in/goyy/goyy.v0/data/schema"
)

//go:generate xgen -entity=$GOFILE -scaffold -clipath=minapp/ma-bms -apipath=minapp/ma-sys -tstpath=minapp/hn-tst

// 机构实体结构.
// @entity(module:"org" project:"sys")
type Entity struct {
	entity.Tree
	table  schema.Table  `db:"table=sys_org&comment=机构"`
	areaId entity.String `db:"column=area_id&comment=所属区域"`
}
