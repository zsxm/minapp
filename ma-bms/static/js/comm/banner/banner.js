var winUrl = $.url();
var project=winUrl.param("project");
var banner=winUrl.param("banner");
var m=winUrl.param("m");
var nowUrl="project="+project+"&banner="+banner;
var hash=md5(nowUrl);
if(m!=hash){
	window.location.href="/err/404.html";
}

// 是否可用：启用
function usable1(id) {
	msgAskDialog(function(params){
		var url=apis+"/comm/banner/usable1"
		$.post(url, {id: params.id}, function(result){
			if(result.success){
				ePage();
			} else {
				alert(result.message)
			}
		}, 'json')
	}, {id:id},"确认要修改是否可用标记吗？");
}
// 是否可用：禁用
function usable0(id) {
	msgAskDialog(function(params){
		var url=apis+"/comm/banner/usable0"
		$.post(url, {id: params.id}, function(result){
			if(result.success){
				ePage();
			} else {
				alert(result.message)
			}
		}, 'json')
	}, {id:id},"确认要修改是否可用标记吗？");
}

var ePostLoadForm = function(){
	var tabsData=paramInit();
	var img=$("#img").val();
	var initPreview=new Array(),initPreviewConfig=new Array();
	if($.isNotBlank(img)){
		var json={title:"焦点图", imgUrl:uploads+img, key:1};
		initPreview.push('<img src="'+uploads+img+'" class="file-preview-image"/>');
		initPreviewConfig.push(json);
	}
	
	$("#file").fileinput({
		initialPreview:initPreview,//默认加载文件
		initialPreviewConfig:initPreviewConfig,//默认加载文件配置
		maxImageWidth: tabsData.width,//文件宽度
		maxImageHeight: tabsData.height,//文件高度
		minImageWidth: tabsData.width,//文件宽度
		minImageHeight: tabsData.height,//文件高度
		language: 'zh',
		maxFileCount: 1,
	    validateInitialCount: true,
	    overwriteInitial: true,
		previewFileType:"image",//只选择image类型文件
		allowedFileExtensions: ['jpg', 'png'],
		maxFileSize: 300,// 文件大小 kb
		enctype: 'multipart/form-data',
		uploadUrl: "/comm/assets/upload?fileinput=file&filedir=banner"
	}).on('fileuploaded', function(event, data, id, index) {
		if (data.response.success) {
			$("#img").val(data.response.filename);
		}
	});
	$("#eForm").validate({
		messages : {
			img : {
				required : '请上传加载图片'
			}
		},
		submitHandler : function(form) {
			$("#eForm").disableSubmit();
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
					if(project=="home"&&banner=="pc"){
						hideHomeBannerTab();
					}
					$("#eForm").enableSubmit();
				}
			});
			return false;
		}
	});
	//控制显示或隐藏tabs form标签
	$("#savedForm").handlebars("formHiddenTemplate",tabsData);
	if(tabsData.pro=="home"){
		$("#eNavTabs li").each(function(){
			var cls=$(this).attr("class");
			var id=$(this).attr("id");
			if(cls=="active"&&id=="formLi"){
				$("#formLi").show();
			}else{
				$("#formLi").hide();
			}
		});
	}
}
//参数初始化为要使用的数据
var paramInit=function(){
	var ratio="";
	var widht,height;
	if(banner=="pc"){
		if(project=="home"){
			ratio="1920 x 380";
			height="380";
		}else{
			ratio="1920 x 300";
			height="300";
		}
		widht="1920";
	}else if(banner=="wap"){
		ratio="640 x 240";
		widht="640";
		height="240";
	}
	var tabBanner={pc:"电脑版",wap:"触屏版"};
	var tabsData={sGenreEQ:project+banner,title:tabBanner[banner],ratio:ratio,pro:project,typ:banner,widht:widht,height:height};
	return tabsData;
}

//隐藏home banner form标签
var hideHomeBannerTab=function(){
	$("#formLi").hide();
}

$(function(){
	var tabsData=paramInit();
	
	$("#eNavTabs").handlebars("tabsTemplate",tabsData);
	$("#searchForm").handlebars("formHiddenTemplate",tabsData);
	$("#dataListThead").handlebars("dataListTheadTemplate",tabsData);
	
	$("#eNavTabs li").click(function(){
		if(project=="home"&&banner=="pc"){
			var id=$(this).attr("id");
			if(id=="listLi"){
				$("#formLi").hide();
			}
		}
	});
	if(project=="home"&&banner=="pc"){
		hideHomeBannerTab();
	}
})