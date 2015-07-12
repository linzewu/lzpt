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
<title>专项检查工作评分表</title>
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/menu.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/nav.css">
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
</head>
<script type="text/javascript">
$(function(){
	$("#dg").datagrid({
			url:'js/jsonfile/rzxjc_pf.json',
			rownumbers:true,
			title:'专项检查工作评分表',
			fitColumns:true,
			singleSelect:true,
			showFooter: true 
		});
	
	});
</script>
<body>

<table id="dg" style="height: 450px;">  
    <thead>  
            <tr>  
                <th data-options="field:'town',width:70,align:'center',editor:{type:'text'}">乡镇\\考评内容</th>  
                <th data-options="field:'enforcelaw',width:90,align:'center',editor:{type:'text'}">执法（30分）</th>  
                <th data-options="field:'ingovernment',width:90,align:'center',editor:{type:'text'}">廉政（40分）</th>  
                <th data-options="field:'accusation',width:90,align:'center',editor:{type:'text'}">纠风（30分）</th>
                <th data-options="field:'scores',width:60,align:'center',editor:{type:'text'}">总得分</th>  
            </tr>  
        </thead>
       
</table>

</body>
</html>
