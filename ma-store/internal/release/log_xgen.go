package release

import (
	"gopkg.in/goyy/goyy.v0/comm/log"
)

var logger = log.New("[store-release]")

func SetPriority(value int) {
	logger.SetPriority(value)
}
