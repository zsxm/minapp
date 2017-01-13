var winUrl=$.url();
var project=winUrl.param("project");
var m=winUrl.param("m");
var nowUrl="project="+project;
var hash=md5(nowUrl);
if(m!=hash){
	window.location.href="/err/404.html";
}
$(function(){	
	$("#eForm").permission();
	if($.getLoginName()!="admin"){
		$("#url").attr("readonly","readonly");	
	}
	$("#url").click(function(){
		$(this).select();
	});
	$("#eForm").validate({
		rules : {
			genre : {
				required : true
			},
			name : {
				required : true,
				maxlength:24
			},
			url : {
				required : true,
				url:true
			},
			memo : {
				required : true,
				maxlength:60
			}
		},
		messages : {
			genre : {
				required : "请选择页面名称"
			},
			name : {
				required : "请填写分享标题",
				maxlength:"标题长度不能超过24个字 ( 含字符 )"
			},
			url : {
				required : "请填写网址",
				url:"网址格式不正确"
			},
			memo : {
				required : "请填写分享描述",
				maxlength:"最多填写60个字"
			}
		},
		submitHandler : function(form) {
			$("#eForm").disableSubmit();
			$("#eForm").ajaxSubmit({
				dataType : "json",
				success : function(result) {
					if (result.success) {
						$("#eFormAlert").showAlert("保存成功！");
					}else{
						$("#eFormAlert").showAlert(result.message);
					}
					$("#eForm").enableSubmit();
				}
			});
			return false;
		}
	});
	var winUrl = $.url();
	var project=winUrl.param("project");
	var filters="";
	if(project){
		filters=project+":conf";
	}

	$("#genre").combo({
		genre: "comm_conf.genre&sFilters="+filters,
		val : "",
		placeholder : "请选择页面名称",
		required : false,
		loadable : true
	});
	
	$("#genre").change(function(){
		var o=$(this);
		titleInit(o.val());
	});
	//重置表单元素
	var reset=function(){
		$("#name").val("");
		$("#id").val("");
		$("#url").val("");
		$("#memo").val("");
	}
	var titleInit=function(id){
		if(id==""){
			reset();
			return;
		}
		var url=apis+"/comm/conf/get";
		$.get(url,{"genre":id},function(result){
			if(result.success){
				var data=result.data;
				if($.trim(data.name)!=""){
					$("#id").val(data.id);
					$("#name").val(data.name);
					$("#url").val(data.url);
					$("#memo").val(data.memo);
					return;
				}
			}
			reset();
		},"json");
	}
})