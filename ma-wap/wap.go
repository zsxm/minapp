package main

import _ "github.com/go-sql-driver/mysql"
import _ "gopkg.in/goyy/goyy.v0/web/conf"
import _ "gopkg.in/goyy/goyy.v0/app/sys/api/dict"

import (
	_ "minapp/ma-store"
	_ "minapp/ma-wap/internal"

	_ "gopkg.in/goyy/goyy.v0/app/comm/controller/captcha"
	"gopkg.in/goyy/goyy.v0/comm/log"
	"gopkg.in/goyy/goyy.v0/web/xhttp"
)

func main() {
	xhttp.Conf.Addr = ":9093"
	xhttp.Use(xhttp.Recovery())
	err := xhttp.Run()
	if err != nil {
		log.Error(err.Error())
	}
}
