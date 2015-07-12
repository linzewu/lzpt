<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>任务列表</title>

<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/task.css">

<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath }js/lzpt/taskProcess.js"></script>

</head>
<body type="list">
	<table id="dg" class="easyui-datagrid" data-options="rownumbers:true,title:'台账列表',onDblClickRow:toProcessOverInfo,onSelect:initTool"
		toolbar="#toolbar" fitColumns="true" singleSelect="true" url="task!getTaskProcessByWorkItem.action?taskProcess.processState=1&task.workItem.id=${param.workItem }">
		<thead>
			<tr> 
				<th data-options="field:'processTitle',width:160">任务标题</th> 
				<th data-options="field:'unit',width:40,formatter:funit">上报单位</th>
				<th data-options="field:'status',width:40,formatter:function(){return '<lable class=A2>已上报</lable>'}">任务状态</th>
<!-- 				<th data-options="field:'cycle',width:40">任务周期</th> -->
				<th data-options="field:'processDate',width:60,formatter:dateToStr">上报时间</th>
			</tr>
		</thead>
	</table>
	<div id="toolbar" style="padding: 5px; height: auto">
		<div style="margin-bottom: 5px">
			<a href="javascript:void(0)" id="info" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="toInfo()">查看详细</a>
		</div>
	</div>
	
</body>
</html>