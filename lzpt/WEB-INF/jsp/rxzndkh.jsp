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
			title:'乡镇廉政年度综合考核',
			singleSelect:true,
			showFooter: true,
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
				url:"caseCheck!xzYearCheck.action",
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
		<tr><th data-options="field:'c_wname',width:120">乡镇\\内容</th></tr>
	</thead>
	<thead>
		<tr>
			<th data-options="field:'csc',width:100">系统自评分数（40%）</th>
			<!--<th data-options="field:'xzfwzxkp',width:120">行政服务中心考评分数（10%）</th>-->
			<th data-options="field:'cs',width:120">纪委考评分数（60%）</th>
			<!--<th data-options="field:'jdykp',width:140">党风廉政监督员考评分数（5%）</th>
			<th data-options="field:'shrskp',width:120">社会人士考评分数（5%）</th>-->
			<th data-options="field:'csp',width:80">平均得分</th> 
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
