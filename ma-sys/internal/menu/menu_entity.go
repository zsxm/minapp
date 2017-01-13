package menu

import (
	"gopkg.in/goyy/goyy.v0/data/entity"
	"gopkg.in/goyy/goyy.v0/data/schema"
)

//go:generate xgen -entity=$GOFILE -scaffold -clipath=minapp/ma-bms -apipath=minapp/ma-sys -tstpath=minapp/hn-tst

// 菜单实体结构.
// @entity(module:"menu" project:"sys")
type Entity struct {
	entity.Tree
	table      schema.Table  `db:"table=sys_menu&comment=菜单"`
	href       entity.String `db:"column=href&comment=链接"`
	target     entity.String `db:"column=target&comment=目标"`
	icon       entity.String `db:"column=icon&comment=图标"`
	hidden     entity.Bool   `db:"column=hidden&comment=隐藏"`
	permission entity.String `db:"column=permission&comment=权限"`
}
