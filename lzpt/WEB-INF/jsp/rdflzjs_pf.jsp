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
<title>党风廉政建设工作评分表</title>
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/menu.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/nav.css">
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
</head>
<script type="text/javascript">
$(function(){
	$("#dg").datagrid({
			url:'js/jsonfile/rdflzjs_pf.json',
			rownumbers:true,
			title:'党风廉政建设工作评分表',
			fitColumns:true,
			singleSelect:true,
			showFooter: true  
		});
	
	});
</script>
<body>

<table id="dg" style="height: 450px;" >  
    <thead>  
            <tr>  
                <th data-options="field:'town',width:80,editor:{type:'text'}">乡镇\\考评内容</th>  
                <th data-options="field:'rightTransparent',width:90,align:'center',editor:{type:'text'}">权利公开透明运行（   分）</th>  
                <th data-options="field:'threeprovice',width:80,align:'center', editor:{type:'text'}">三务公开（   分）</th>  
                <th data-options="field:'jointventure',width:80,align:'center',editor:{type:'text'}">三资管理工作（   分）</th>
                <th data-options="field:'convpeople',width:80,align:'center',editor:{type:'text'}">便民服务中心建设（   分）</th>
                <th data-options="field:'cadreleave',width:90,align:'center',editor:{type:'text'}">开展村干部离任经济审计（扣分制）</th> 
                <th data-options="field:'totals',width:60,align:'center',editor:{type:'text'}">总分</th> 
            </tr>  
        </thead>
       
</table>

</body>
</html>
