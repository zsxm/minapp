package post

import (
	"gopkg.in/goyy/goyy.v0/data/entity"
	"gopkg.in/goyy/goyy.v0/data/schema"
)

//go:generate xgen -entity=$GOFILE -scaffold -clipath=minapp/ma-bms -apipath=minapp/ma-sys -tstpath=minapp/hn-tst

// 岗位菜单实体结构.
// @entity(module:"post_menu" project:"sys" relationship:"slave")
type MenuEntity struct {
	entity.Sys
	table  schema.Table  `db:"table=sys_post_menu&comment=岗位菜单"`
	postId entity.String `db:"column=post_id&comment=岗位ID"`
	menuId entity.String `db:"column=menu_id&comment=菜单ID"`
}
