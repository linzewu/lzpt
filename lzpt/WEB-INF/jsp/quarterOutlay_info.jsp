<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.kteam.lzpt.entity.User"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
	
	User user=(User)session.getAttribute("user");
	request.setAttribute("usname", user.getName());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>季度经费详细信息</title>

<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/task.css">

<script type="text/javascript" src="${basePath }js/json2.js"></script>
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath }js/lzpt/quarterQutlay.js"></script>
<script type="text/javascript" src="${basePath }js/dataCode.js"></script>
<style type="text/css">

.great_title {
	width: 18%;
	text-align: center;
	height: 50px;
	border-left: 1px solid #96B0C6;
	border-bottom: 1px solid #96B0C6;
}

.great_contex {
	border-left: 1px solid #96B0C6;
	border-bottom: 1px solid #96B0C6;
	padding-left: 10px;
}

.great_image {
	width: 120px;
	border-left: 1px solid #96B0C6;
	border-bottom: 1px solid #96B0C6;
	text-align: center;
}
</style>
<script type="text/javascript">


$(function(){	
	$("#workArchives").combobox({
		url:'workArchive!queryWorkArchives.action',
		valueField:'id',
		textField:'wname',
		multiple:false,
		required:true
	});
	
	
	$("#qoyear").combobox({
		valueField:'value',
		textField:'label',
		multiple:false,
		data:datacode.years
	});
	
	$("#qoquarter").combobox({
		valueField:'value',
		textField:'label',
		multiple:false,
		data:datacode.quarter
	});
	
	$('#unit').text(getSysUnitById($('#unit').text()));
	
});




</script>
</head>
<body type="add">
	<div class="easyui-panel" title="季度经费详细信息">
		<form method="post" action="quarterOutlay!addQuarterOutlay.action" id="fm">
			<table title="季度经费详细信息" style="margin-left: 20px; margin-top: 10px;border-right: 1px solid #96B0C6; border-top: 1px solid #96B0C6; width: 80%" cellpadding="0" cellspacing="0" >
				<tr>
				    <th rowspan="5" class="great_title"></th>
					<th class="great_title"><label for="task.title">年份:</label></th>
					<td class="great_contex">${qo.qoyear }</td>
				</tr>
				<tr>
					<th class="great_title"><label for="task.title">季度:</label></th>
					<td class="great_contex">第${qo.qoquarter }季度</td>
				</tr>
				<tr>
				<th class="great_title"><label for="qo.wa.id">单位</label></th>
				<td class="great_contex" id="unit">${qo.wa.id }</td>
				</tr>	
				<tr>
					<th class="great_title"><label for="task.title">发布时间:</label></th>
					<td class="great_contex"><fmt:formatDate value="${qo.publicTime }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>
				</tr>
				<tr>
					<th class="great_title"><label for="task.title">状态:</label></th>
					<td class="great_contex">${qo.state == 0?"新增":"发布" }</td>
				</tr>
				<tr>
				    <th class="great_title" rowspan="4">公务接待费 </th>
					<th class="great_title"><label for="task.title">交通费:</label></th>
					<td class="great_contex">${qo.trafficMon }</td>
				</tr>
				
				<tr>
					<th class="great_title"><label for="task.title">住宿费:</label></th>
					<td class="great_contex">${qo.stayMon }</td>
				</tr>
				<tr>
					<th class="great_title" ><label for="task.title">用餐费:</label></th>
					<td class="great_contex">${qo.foodMon }</td>
				</tr>
				
				<tr>
					<th class="great_title"><label for="task.title">其他:</label></th>
					<td class="great_contex">${qo.otherBusiness }</td>
				</tr>
				<tr>
				    <th class="great_title" rowspan="3">因公出国（境）经费</th>
					<th class="great_title"><label for="task.title">境外培训及业务考察:</label></th>
					<td class="great_contex">${qo.trainMon }</td>
				</tr>
				
				<tr>
					<th class="great_title"><label for="task.title">国际招商引资活动:</label></th>
					<td class="great_contex">${qo.bidMon }</td>
				</tr>
				<tr>
					<th class="great_title"><label for="task.title">其他:</label></th>
					<td class="great_contex">${qo.otherAbroadMon }</td>
				</tr>
				<tr>
				    <th class="great_title" rowspan="2">公务用车购置及运行维护费</th>
					<th class="great_title"><label for="task.title">车辆购置费:</label></th>
					<td class="great_contex">${qo.buyCarMon }</td>
				</tr>
				<tr>
					<th class="great_title"><label for="task.title">车辆运行维护费:</label></th>
					<td class="great_contex">${qo.fixCarMon }</td>
				</tr>
				
				
			</table>
		</form>
	</div>
</body>
</html>