package issue

import (
	"gopkg.in/goyy/goyy.v0/data/entity"
	"gopkg.in/goyy/goyy.v0/data/schema"
)

//go:generate xgen -entity=$GOFILE -scaffold -clipath=minapp/ma-bms -apipath=minapp/ma-store -tstpath=minapp/hn-tst

// 小程序发布实体结构.
// @entity(module:"issue" project:"store")
type Entity struct {
	entity.Sys
	table schema.Table `db:"table=xcx_issue&comment=小程序发布"`
}
