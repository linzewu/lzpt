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
<title>宣调工作评分表</title>
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/menu.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/nav.css">
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
</head>
<script type="text/javascript">
$(function(){
	$("#dg").datagrid({
			url:'js/jsonfile/rxdgz_pf.json',
			rownumbers:true,
			title:'宣调工作评分表',
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
                <th data-options="field:'town',width:90,align:'center', editor:{type:'text'}">乡镇\\考评内容</th>  
                <th data-options="field:'threeSend',width:140,align:'center',editor:{type:'text'}">"三湾清风网"信息报送工作（   分）</th>  
                <th data-options="field:'wallnewspaper',width:120,editor:{type:'text'}">建立廉政文化墙报（   分）</th>  
                <th data-options="field:'subscript',width:100,align:'center',editor:{type:'text'}">报刊征订工作（   分）</th>
                <th data-options="field:'publish',width:160,align:'center',editor:{type:'text'}">信息稿件在相关媒体发表（加分制）</th>
                <th data-options="field:'scores',width:40,align:'center',editor:{type:'text'}">总分</th>  
            </tr>  
        </thead>
       
</table>

</body>
</html>
