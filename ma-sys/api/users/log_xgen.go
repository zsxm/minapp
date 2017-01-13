package users

import (
	"gopkg.in/goyy/goyy.v0/comm/log"
)

var logger = log.New("[sys-users]")

func SetPriority(value int) {
	logger.SetPriority(value)
}
