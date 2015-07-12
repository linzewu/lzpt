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
<title>廉政测评</title>
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
			url:'js/jsonfile/lzcp.json',
			rownumbers:true,
			title:'廉政测评',
			singleSelect:true,
			showFooter: true,
			fitColumns:true,
			toolbar:'#tb'
		});
	
	});
</script>
<body>

<table id="dg" style="height: 450px;" >
	<thead frozen="true">
		<tr><th data-options="field:'town',width:120">乡镇\\评价</th></tr>
	</thead>
	<thead>
		<tr>
			<th data-options="field:'xtzp',width:100">满意</th>
			<th data-options="field:'xzfwzxkp',width:120">基本满意</th>
			<th data-options="field:'jwkp',width:120">不满意</th>
		</tr>
	</thead>
</table>
<div  style="padding:5px;height:auto" id="tb">
	 <a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true">保存</a>  
</div>

</body>
</html>
