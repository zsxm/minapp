package area

import (
	"gopkg.in/goyy/goyy.v0/data/entity"
	"gopkg.in/goyy/goyy.v0/data/schema"
)

//go:generate xgen -entity=$GOFILE -scaffold -clipath=minapp/ma-bms -apipath=minapp/ma-sys -tstpath=minapp/hn-tst

// 区域实体结构.
// @entity(module:"area" project:"sys")
type Entity struct {
	entity.Tree
	table schema.Table `db:"table=sys_area&comment=区域"`
}
