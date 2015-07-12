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
<title>领导班子年度党风廉政建设责任制考核民主测评表</title>
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/menu.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/nav.css">
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
</head>
<script type="text/javascript">
$(function(){
	$("#dg").datagrid({
			url:'js/jsonfile/rldbz_mzcp.json',
			rownumbers:true,
			title:'领导班子   年度党风廉政建设责任制考核民主测评表',
			singleSelect:true,
			showFooter: true  
		});
	
	});
</script>
<body>

<table id="dg"  style="height: 450px;">

	<thead frozen="true">
		<tr>
			<th >内容</th>
		</tr>
		<tr>
			<th data-options="field:'context',width:70">评价</th>
		</tr>
	</thead>
	
    <thead>  
        <tr>  
           
		   <th colspan="3">领导重视</th>
		   <th colspan="3">制度建设</th>
		   <th colspan="3">廉洁自律</th>
		   <th colspan="3">工作实施</th>
		   <th colspan="3">责任落实</th>
		   <th colspan="3">综合评价</th>
        </tr>
        <tr>
		   <th data-options="field:'satisfied1',width:70">满意</th>
		   <th data-options="field:'basicsatisfied1',width:80">基本满意</th>
		   <th data-options="field:'unsatisfied1',width:70">不满意</th>
		   <th data-options="field:'satisfied2',width:70">满意</th>
		   <th data-options="field:'basicsatisfied2',width:80">基本满意</th>
		   <th data-options="field:'unsatisfied2',width:70">不满意</th>
		   <th data-options="field:'satisfied3',width:70">满意</th>
		   <th data-options="field:'basicsatisfied3',width:80">基本满意</th>
		   <th data-options="field:'unsatisfied3',width:70">不满意</th>
		   <th data-options="field:'satisfied4',width:70">满意</th>
		   <th data-options="field:'basicsatisfied4',width:80">基本满意</th>
		   <th data-options="field:'unsatisfied4',width:70">不满意</th>
		   <th data-options="field:'satisfied5',width:70">满意</th>
		   <th data-options="field:'basicsatisfied5',width:80">基本满意</th>
		   <th data-options="field:'unsatisfied5',width:70">不满意</th>
		   <th data-options="field:'satisfied6',width:70">满意</th>
		   <th data-options="field:'basicsatisfied6',width:80">基本满意</th>
		   <th data-options="field:'unsatisfied6',width:70">不满意</th>
        </tr>
      </thead>  
       
</table>

</body>
</html>
