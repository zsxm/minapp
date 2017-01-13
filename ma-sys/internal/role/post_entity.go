package role

import (
	"gopkg.in/goyy/goyy.v0/data/entity"
	"gopkg.in/goyy/goyy.v0/data/schema"
)

//go:generate xgen -entity=$GOFILE -scaffold -clipath=minapp/ma-bms -apipath=minapp/ma-sys -tstpath=minapp/hn-tst

// 角色岗位实体结构.
// @entity(module:"role_post" project:"sys" relationship:"slave")
type PostEntity struct {
	entity.Sys
	table  schema.Table  `db:"table=sys_role_post&comment=角色岗位"`
	roleId entity.String `db:"column=role_id&comment=角色ID"`
	postId entity.String `db:"column=post_id&comment=岗位ID"`
}
