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

var ePostLoadForm=function(){
	$("#parentId").val($("#sParentId").val());
	$("#eForm").validate({
		submitHandler : function(form) {
			$("#eForm").disableSubmit();
			$("#grade").val(($("#treeGrade").val()-0)+1);
			$("#eForm").ajaxSubmit({
				dataType : "json",
				success : function(result) {
					if (result.success) {
						ePage();
						eTabsSwitch("#eListContent");
						$("#eListAlert").showAlert("保存成功");
					} else {
						alert(result.message);
					}
					$("#eForm").enableSubmit();
				}
			});
			return false;
		}
	});
	if(state=="edit"){
		eparentIdFormTreeInit();
	}
}