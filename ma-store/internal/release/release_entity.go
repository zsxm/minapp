package release

import (
	"gopkg.in/goyy/goyy.v0/data/entity"
	"gopkg.in/goyy/goyy.v0/data/schema"
)

//go:generate xgen -entity=$GOFILE -scaffold -clipath=minapp/ma-bms -apipath=minapp/ma-store -tstpath=minapp/hn-tst

// 商店发布实体结构.
// @entity(module:"release" project:"store")
type Entity struct {
	entity.Sys
	table      schema.Table   `db:"table=se_release&comment=商店发布"`
	name       entity.String  `db:"column=name&comment=产品名称"`
	ver        entity.String  `db:"column=ver&comment=产品版本"`
	mobile     entity.String  `db:"column=mobile&comment=手机号码"`
	url        entity.String  `db:"column=url&comment=H5网址"`
	email      entity.String  `db:"column=email&comment=联系邮箱"`
	rewardNum  entity.Int     `db:"column=reward_num&comment=奖励数量"`
	taskMoney  entity.Float64 `db:"column=task_money&comment=任务金额"`
	execCycle  entity.String  `db:"column=exec_cycle&comment=执行周期"`
	taskRemark entity.String  `db:"column=task_remark&comment=任务说明"`
}
