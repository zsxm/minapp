package home

import (
	"gopkg.in/goyy/goyy.v0/util/cookies"
	"gopkg.in/goyy/goyy.v0/util/files"
	"gopkg.in/goyy/goyy.v0/web/controller"
	"gopkg.in/goyy/goyy.v0/web/xhttp"
)

func ver() string {
	var ver string = "ver=1"
	fver := xhttp.Conf.Html.Dir + "/version.html"
	if files.IsExist(fver) {
		if c, err := files.Read(fver); err == nil {
			ver = c
		}
	}
	return ver
}

func (me *Controller) home(c xhttp.Context) {
	// 设置cookie，用于电脑版和触屏版切换
	m := c.Param("mode")
	switch m {
	case "pc", "webapp":
		cookies.SetValue(c.ResponseWriter(), "mode", m)
	}
	c.Redirect("home.html?" + ver())
}

func (me *Controller) favicon(c xhttp.Context) {
	c.Redirect(xhttp.Conf.Asset.URL + "/favicon.ico")
}

func init() {
	xhttp.GET("/", ctl.home)
	xhttp.GET("/favicon.ico", ctl.favicon)
}

type Controller struct {
	controller.Controller
}

var ctl = &Controller{}
