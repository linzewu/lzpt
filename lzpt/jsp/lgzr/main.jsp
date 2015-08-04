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
<script type="text/javascript" src="/lzpt/js/jquery-easyui-1.4.3/datagrid-groupview.js"></script>

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
	$(function(){
		$.each(nave,function(key,nave){
			
			$("#"+key).bind("click",function(){
				var ul=$(".mpanel ul");
				ul.empty();
				$.each(nave.menus,function(i,menu){
					var temple=$("<li><a href=\"javascript:void(0)\" ><img></a></li>");
					
					temple.find("img").attr("src",menu.icon);
					temple.find("a").bind("click",menu.callbak)
					temple.find("a").append(menu.title);
					ul.append(temple);
					if(i==0){
						temple.find("a").click();
					}
				});
			});
			if(nave.isFirst){
				$("#"+key).click();
			}
		});
		
		initUnit();
	});
	
	var units;
	
	function getUnit(id){
		var unit;
		 $.each(units,function(i,n){
				if(n.id==id){
					unit=n.wname;
					return false;
				} 
			 });
		 return unit;
	}
	
	var years=[{
		label:'2014',
		value:2014
	},{
		label:'2015',
		value:2015
	},{
		label:'2016',
		value:2016
	},{
		label:'2017',
		value:2017
	},{
		label:'2018',
		value:2018
	}];
	
	var quantity=[{
		label:'10',
		value:10
	},{
		label:'20',
		value:20
	},{
		label:'50',
		value:50
	},{
		label:'全部',
		value:0
	}];
	
	function initUnit(){
		var url="/lzpt/workArchive!querySimpleUnits.action";
		
		$.getJSON(url,function(data){
			units=data;
		});
	}
	
	function toPage(title,url,param){
		$("body").layout("panel","center").panel("setTitle",title);
		if(param){
			$("body").layout("panel","center").panel({"queryParams":param});
		}
		$("body").layout("panel","center").panel("refresh",url);
	}
	
	
	var nave={
		"n1":{
			isFirst:true,
			menus:[{
				"icon":"/lzpt/images/grda.png",
				"title":"基础工作项目",
				callbak:function(){
					getProjectType('主体责任管理  >> 基础工作考核项目 ','1');
				}
			},{
				"icon":"/lzpt/images/bmda.png",
				"title":"重点考核项目",
				callbak:function(){
					getProjectType('主体责任管理  >> 重点考核项目','2');
				}
			}]
		},
		"n2":{
			menus:[{
				"icon":"/lzpt/images/grda.png",
				"title":"基础工作项目",
				callbak:function(){
					getProjectType('监督责任管理  >> 基础工作考核项目 ','3');
				}
			},{
				"icon":"/lzpt/images/bmda.png",
				"title":"重点考核项目",
				callbak:function(){
					getProjectType('监督责任管理  >> 重点考核项目','4')
				}
			}]
		},
		"n3":{
			menus:[{
				"icon":"/lzpt/images/grda.png",
				"title":"考核项目评估",
				callbak:function(){
					toPage("纪委主控台>>考核项目评估","report.jsp");
				}
			},{
				"icon":"/lzpt/images/gif_47_027.gif",
				"title":"数据仪表盘"
			},{
				"icon":"/lzpt/images/gif_47_067.gif",
				"title":"催办管理"
			},{
				"icon":"/lzpt/images/gif_47_078.gif",
				"title":"随机抽查",
				callbak:function(){
					toPage("纪委主控台>>随机抽查","check.jsp");
				}
			},{
				"icon":"/lzpt/images/gif_47_029.gif",
				"title":"考核项目控制台",
				callbak:function(){
					toPage("纪委主控台>>考核项目控制台","console.jsp");
				}
			} ]
		}
	}
	
	var groupConfig={"1":"主体责任 >>基础工作项目","2":"主体责任>>重点考核项目","3":"监督责任>>基础工作项目","4":"监督责任>>重点考核项目"};
	
</script>

</head>
<body class="easyui-layout">
	<%@ include  file="menu.jsp"%>
<div data-options="region:'center'" title="主体责任管理  >> 基础工作考核项目" style="padding: 5px;">
</div>
</body>
</html>