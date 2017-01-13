var winUrl=$.url();
var winParam=winUrl.param();
var params="",i=0,m="";
for(var key in winParam){
	if(key=="m"){
		m=winParam[key];
		continue;
	}
	if(i>0){
		params+="&";
	}
	params+=key+"="+winParam[key];
	i++;
}
var hash=md5(params);
if(m!=hash){
	window.location.href="/err/404.html";
}

$(document).ready(function(){
	treeInit();
});
//保存分配 sysAreaId=当前列表要分配的数据,commAreaId当前树菜单选择分配的数据
function saveAreaDistr(sysAreaId,commAreaId){
	if(sysAreaId==""||commAreaId==""){
		return;
	}
	var url=apis+"/comm/area/areaDistr/save/areadistr";
	$.post(url,{sysAreaId:sysAreaId,commAreaId:commAreaId},function(result){
		if(result.success){
			var data=$.parseJSON(result.data);
			$("#"+sysAreaId).html("&nbsp;"+data.fullname);
		}
	});
}

function sAreaIdOpen(sysAreaId) {
	treeInit();
	var commAreaId=$("#"+sysAreaId).attr("commid");
	var treeObj = $.fn.zTree.getZTreeObj("sAreaIdTree");
	var node = treeObj.getNodeByParam("id", commAreaId);
	treeObj.selectNode(node,false);
	
	$("#sAreaIdDialog").dialog({
		resizable: false,
		modal: true,
		height: 500,
		title:$("#"+sysAreaId+"fullname").html(),
		buttons: {
			"取消": function() {
				$(this).dialog("close");
			},
			"确定": function() {
				var treeObj = $.fn.zTree.getZTreeObj("sAreaIdTree");
				var nodes = treeObj.getSelectedNodes();
				if (nodes.length == 1) {
					//console.log(nodes[0].id, nodes[0].name);
					commAreaId=nodes[0].id;
					saveAreaDistr(sysAreaId,commAreaId);
				}
				$(this).dialog("close");
			}
		}
	});
}
function sAreaIdInit(data) {
	var setting = {
		check: {
			enable: false
		},
		data: {
			simpleData: {
				enable: true,
				rootPId: "root"
			}
		}
	};
	$.fn.zTree.init($("#sAreaIdTree"), setting, data);
}
var areaJson="";
function treeInit(){
	if(areaJson==""){
		$.ajax({
			type: "get",
			dataType: "json",
			data:{"sOrdinalOA":10},
			url: apis+"/comm/area/tree",
			success: function(result) {
				areaJson=result.data;
				sAreaIdInit(areaJson);
			}
		});
	}else{
		sAreaIdInit(areaJson);
	}
}
//分页完成后，加载已分配的区域名称
var ePostPage=function(){
	var clsIds=$(".ids");
	var ids="";
	for(var i=0;i<clsIds.length;i++){
		if(i>0){
			ids+=",";
		}
		ids+=clsIds.eq(i).attr("id");
	}
	var getUrl=apis+"/comm/area/areaDistr/get";
	$.get(getUrl,{ids:ids},function(result){
		var data=$.parseJSON(result);
		data=data.datas;
		for(var i in data){
			var d=data[i];
			var td=$("#"+d.areaId);
			td.append(d.fullname);
			td.attr("commid",data[i].id);
		}
		$(".distrCls").show();
	})
}