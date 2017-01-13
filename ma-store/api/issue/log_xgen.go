package issue

import (
	"gopkg.in/goyy/goyy.v0/comm/log"
)

var logger = log.New("[store-issue]")

func SetPriority(value int) {
	logger.SetPriority(value)
}
