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
<title>信访举报工作评分表</title>
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/menu.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/nav.css">
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
</head>
<script type="text/javascript">
$(function(){
	$("#dg").datagrid({
			url:'js/jsonfile/rxfjb_pf.json',
			rownumbers:true,
			title:'信访举报工作评分表',
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
                <th data-options="field:'town',width:100,editor:{type:'text'}">乡镇\\考评内容</th>  
                <th data-options="field:'perfect',width:120,align:'center',editor:{type:'text'}">健全三级信访网络（   分）</th>  
                <th data-options="field:'finish',width:140,align:'center',editor:{type:'text'}">完成交办信访举报件任务（   分）</th>  
                <th data-options="field:'suitable',width:160,align:'center',editor:{type:'text'}">配合县纪委开展接访活动（   分）</th>
                <th data-options="field:'accept',width:120,align:'center',editor:{type:'text'}">受理信访举报工作（   分）</th>
                <th data-options="field:'surpass',width:120,align:'center',editor:{type:'text'}">越级上访事件（扣分制）</th>  
                <th data-options="field:'send',width:100,align:'center',editor:{type:'text'}">报送信访材料（   分）</th>
                <th data-options="field:'totals',width:40,align:'center',editor:{type:'text'}">总分</th>
            </tr>  
        </thead>
       
</table>

</body>
</html>
