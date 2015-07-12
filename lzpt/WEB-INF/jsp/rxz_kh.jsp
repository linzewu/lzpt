<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>乡镇廉政指数评估考核表</title>
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/menu.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/nav.css">
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
</head>
<script type="text/javascript">
$(function(){
	$("#dg").datagrid({
			rownumbers:true,
			title:'乡镇廉政指数评估考核表',
			singleSelect:true,
			showFooter: true ,
			fitColumns:true,
			toolbar:"#toolbar"
		});
	$("#lqoyear").combobox({
		valueField:'id',
		textField:'text',
		multiple:false,
		data:[{
		    "id":2012,
		    "text":"2012"
		},{
		    "id":2013,
		    "text":"2013"
		},{
		    "id":2014,
		    "text":"2014"
		},{
		    "id":2015,
		    "text":"2015"
		},{
		    "id":2016,
		    "text":"2016"
		},{
		    "id":2017,
		    "text":"2017"
		},{
		    "id":2018,
		    "text":"2018"
		},{
		    "id":2019,
		    "text":"2019"
		},{
		    "id":2020,
		    "text":"2020"
		},{
		    "id":2021,
		    "text":"2021"
		},{
		    "id":2022,
		    "text":"2022"
		},{
		    "id":2023,
		    "text":"2023"
		},{
		    "id":2024,
		    "text":"2024"
		},{
		    "id":2025,
		    "text":"2025"
		}]

	});
	
});


function searchTB()
{
	
	var year=$("#lqoyear").combobox("getValue")==''?0:$("#lqoyear").combobox("getValue");
	
	
	if(year!=0){
		var obj = {
			"year":year
		};
		$('#dg').datagrid({
			url:"caseCheck!xzYearAvg.action",
			queryParams:obj
		});
	}
	else{
		$.messager.alert("提示","请选择年份！");
	}
}
</script>
<body>

<table id="dg" style="height: 450px;" >
	<thead frozen="true">
		<tr>  <th data-options="field:'wname',width:120" rowspan="3" >考评项目 乡镇名称</th>  </tr>
	</thead>
	<thead>
		<tr>  
		   <th data-options="field:'dflzjs',width:90" >党风廉政建设</th>
		   <th data-options="field:'ajcc',width:90" >案件查处</th>
		   <th data-options="field:'jfhzfjcgz',width:90">纠风和执法监察工作</th>
		   <th data-options="field:'xjhzhgz',width:90">宣教和综合工作</th>
        </tr>  
	</thead>
</table>

<div id="toolbar" style="padding:5px;height:auto">
	<div>  
       	年度: <input  style="width:150px" name="year" id="lqoyear">  
       	<a href="javascript:searchTB()" class="easyui-linkbutton" iconCls="icon-search">查找</a>
    </div>
</div>

</body>
</html>
