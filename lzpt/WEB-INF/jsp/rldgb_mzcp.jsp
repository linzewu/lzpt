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
<title>领导干部年度党风廉政建设责任制考核民主测评表</title>
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/menu.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/nav.css">
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
</head>
<script type="text/javascript">
$(function(){
	$("#dg").datagrid({
			url:'',
			rownumbers:true,
			title:'领导干部   年度党风廉政建设责任制考核民主测评表',
			fitColumns:true,
			singleSelect:true
		});
	
	});
</script>
<body>

<table id="dg" >  
    <thead>  
        <tr>  
            <th data-options="field:'cname',width:80" rowspan="2">姓名</th>  
            <th data-options="field:'cjob',width:60" rowspan="2">职务</th>  
            <th colspan="3">"一岗双责"落实</th>
            <th colspan="3">廉洁自律</th>
		    <th colspan="3">工作作风</th>
		    <th colspan="3">工作实效</th>
		    <th colspan="3">综合评价</th>
        </tr>  
        <tr>
        	<th data-options="field:'satisfied1',width:50">满意</th>
            <th data-options="field:'basicsatisfied1',width:60">基本满意</th>
            <th data-options="field:'unsatisfied1',width:50">不满意</th>
            <th data-options="field:'satisfied2',width:50">满意</th>
            <th data-options="field:'basicsatisfied2',width:60">基本满意</th>
            <th data-options="field:'unsatisfied2',width:50">不满意</th>
            <th data-options="field:'satisfied3',width:50">满意</th>
            <th data-options="field:'basicsatisfied3',width:60">基本满意</th>
            <th data-options="field:'unsatisfied3',width:50">不满意</th>
            <th data-options="field:'satisfied4',width:50">满意</th>
            <th data-options="field:'basicsatisfied4',width:60">基本满意</th>
            <th data-options="field:'unsatisfied4',width:50">不满意</th>
            <th data-options="field:'satisfied5',width:50">满意</th>
            <th data-options="field:'basicsatisfied5',width:60">基本满意</th>
            <th data-options="field:'unsatisfied5',width:50">不满意</th>
        </tr>
      </thead>  
      <tbody>
      	<tr>
      		<td>张三</td>
      		<td>镇长</td>
      		<td></td>
      		<td>√</td>
      		<td></td>
      		<td>√</td>
      		<td></td>
      		<td></td>
      		<td></td>
      		<td>√</td>
      		<td></td>
      		<td>√</td>
      		<td></td>
      		<td></td>
      		<td>√</td>
      		<td></td>
      		<td></td>
      	</tr>
      	<tr>
      		<td>李四</td>
      		<td>科长</td>
      		<td></td>
      		<td>√</td>
      		<td></td>
      		<td>√</td>
      		<td></td>
      		<td></td>
      		<td></td>
      		<td>√</td>
      		<td></td>
      		<td>√</td>
      		<td></td>
      		<td></td>
      		<td>√</td>
      		<td></td>
      		<td></td>
      	</tr>
      <tr>
      		<td>王五</td>
      		<td>副镇长</td>
      		<td></td>
      		<td>√</td>
      		<td></td>
      		<td>√</td>
      		<td></td>
      		<td></td>
      		<td></td>
      		<td>√</td>
      		<td></td>
      		<td>√</td>
      		<td></td>
      		<td></td>
      		<td>√</td>
      		<td></td>
      		<td></td>
      	</tr>
      <tr>
      		<td>小陈</td>
      		<td>科员</td>
      		<td></td>
      		<td>√</td>
      		<td></td>
      		<td>√</td>
      		<td></td>
      		<td></td>
      		<td></td>
      		<td>√</td>
      		<td></td>
      		<td>√</td>
      		<td></td>
      		<td></td>
      		<td>√</td>
      		<td></td>
      		<td></td>
      	</tr>
      <tr>
      		<td>小林</td>
      		<td>镇长</td>
      		<td></td>
      		<td>√</td>
      		<td></td>
      		<td>√</td>
      		<td></td>
      		<td></td>
      		<td></td>
      		<td>√</td>
      		<td></td>
      		<td>√</td>
      		<td></td>
      		<td></td>
      		<td>√</td>
      		<td></td>
      		<td></td>
      	</tr>
      </tbody>
       
</table>

</body>
</html>
