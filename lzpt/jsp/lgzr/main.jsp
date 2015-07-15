<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="/lzpt/js/jquery-easyui-1.4.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/lzpt/js/jquery-easyui-1.4.3/themes/icon.css">
<link rel="stylesheet" type="text/css" href="/lzpt/css/menu.css">
<link rel="stylesheet" type="text/css" href="/lzpt/css/nav.css">
<link rel="stylesheet"  type="text/css" href="/lzpt/css/base.css" >



<script type="text/javascript" src="/lzpt/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/lzpt/js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>

<script type="text/javascript" src="/lzpt/js/ckeditor_4.5.1_basic/ckeditor.js"></script>
<script type="text/javascript" src="/lzpt/js/upload/ajaxfileupload.js"></script>
<script type="text/javascript" src="/lzpt/js/lzpt/common.js"></script>
<script type="text/javascript" src="/lzpt/js/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript" src="/lzpt/js/lzpt/project.js"></script>
<meta charset="UTF-8">
<title>党风廉政建设责任制检查考核</title>

<script type="text/javascript">

jQuery.prototype.serializeObject=function(){
	var a,o,h,i,e;
	a=this.serializeArray();
	o={};
	h=o.hasOwnProperty;
	for(i=0;i<a.length;i++){
		e=a[i];
		if(!h.call(o,e.name)){
			o[e.name]=e.value;
		}
	}
	return o;
};






	function getProjectType(name,group){
		$("body").layout("panel","center").panel("setTitle",name);
		if($("#projectType").length>0){
			$("#projectType").datagrid("reload",{"pt.group":group});
		}else{
			$("body").layout("panel","center").panel("refresh","ptlist.jsp?group="+group);
		}
	}
	
	function setN1Click(){
		$("#m1").unbind("click");
		$("#m2").unbind("click");
		$("#m1").bind("click",function(){
			getProjectType('主体责任管理  >> 基础工作考核项目 ','1');
		});
		$("#m2").bind("click",function(){
			getProjectType('主体责任管理  >> 重点考核项目','2')
		});
		
		$("#m1").click();
	}
	
	function setN2Click(){
		$("#m1").unbind("click");
		$("#m2").unbind("click");
		
		$("#m1").bind("click",function(){
			getProjectType('监督责任管理  >> 基础工作考核项目 ','3');
		});
		$("#m2").bind("click",function(){
			getProjectType('监督责任管理  >> 重点考核项目','4')
		});
		$("#m1").click();
	}
	
	$(function(){
		$("#n1").bind("click",setN1Click);
		$("#n2").bind("click",setN2Click);
		
		$("#m1").bind("click",function(){
			getProjectType('主体责任管理  >> 基础工作考核项目 ','1');
		});
		$("#m2").bind("click",function(){
			getProjectType('主体责任管理  >> 重点考核项目','2')
		});
		initUnit();
	});
	
	var units;
	
	function initUnit(){
		var url="/lzpt/workArchive!queryWorkArchives.action";
		
		$.getJSON(url,function(data){
			units=data;
		});
		
	}
	
</script>

</head>
<body class="easyui-layout">
	<%@ include  file="menu.jsp"%>
<div data-options="region:'center'" title="主体责任管理  >> 基础工作考核项目" style="padding: 5px;" href="ptlist.jsp?group=1">
</div>
</body>
</html>