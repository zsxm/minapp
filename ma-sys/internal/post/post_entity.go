package post

import (
	"gopkg.in/goyy/goyy.v0/data/entity"
	"gopkg.in/goyy/goyy.v0/data/schema"
)

//go:generate xgen -entity=$GOFILE -scaffold -clipath=minapp/ma-bms -apipath=minapp/ma-sys -tstpath=minapp/hn-tst

// 岗位实体结构.
// @entity(module:"post" project:"sys")
type Entity struct {
	entity.Tree
	table schema.Table `db:"table=sys_post&comment=岗位"`
}
