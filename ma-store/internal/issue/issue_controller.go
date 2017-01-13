package issue

import (
	"gopkg.in/goyy/goyy.v0/web/xhttp"
)

func init() {
	xhttp.GET(ctl.ApiIndex(), ctl.Index)
	xhttp.POST(ctl.ApiIndex(), ctl.Index)
	xhttp.GET(ctl.ApiShow(), ctl.Show)
	xhttp.POST(ctl.ApiShow(), ctl.Show)
	xhttp.POST(ctl.ApiAdd(), ctl.Add)
	xhttp.POST(ctl.ApiEdit(), ctl.Edit)
	xhttp.POST(ctl.ApiSave(), ctl.SaveAndTx)
	xhttp.POST(ctl.ApiDisable(), ctl.DisableAndTx)
}
