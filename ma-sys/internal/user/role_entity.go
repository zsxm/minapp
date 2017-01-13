package user

import (
	"gopkg.in/goyy/goyy.v0/data/entity"
	"gopkg.in/goyy/goyy.v0/data/schema"
)

//go:generate xgen -entity=$GOFILE -scaffold -clipath=minapp/ma-bms -apipath=minapp/ma-sys -tstpath=minapp/hn-tst

// 用户角色实体结构.
// @entity(module:"user_role" project:"sys" relationship:"slave")
type RoleEntity struct {
	entity.Sys
	table  schema.Table  `db:"table=sys_user_role&comment=用户角色"`
	userId entity.String `db:"column=user_id&comment=用户ID"`
	roleId entity.String `db:"column=role_id&comment=角色ID"`
}
