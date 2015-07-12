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
<title>添加季度经费</title>

<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/task.css">

<script type="text/javascript" src="${basePath }js/json2.js"></script>
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath }js/lzpt/quarterQutlay.js"></script>
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
		valueField:'id',
		textField:'text',
		multiple:false,
		required:true,
		data:[{
		    "id":2012,
		    "text":"2012"
		},{
		    "id":2013,
		    "text":"2013",
		    "selected":true
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
	
	$("#qoquarter").combobox({
		valueField:'id',
		textField:'text',
		multiple:false,
		required:true,
		data:[{
		    "id":1,
		    "text":"第一季度"
		},{
		    "id":2,
		    "text":"第二季度"
		},{
		    "id":3,
		    "text":"第三季度"
		},{
		    "id":4,
		    "text":"第四季度"
		}]
	});
	
	$("#qoyear").combobox("setValue","${qo.qoyear}");
	$("#qoquarter").combobox("setValue","${qo.qoquarter}");
	
	//$("#workArchives").combobox("setValue","${qo.wa.id}");
	
});


</script>
</head>
<body type="add">
	<div class="easyui-panel" title="季度经费详细信息">
		<form method="post" action="quarterOutlay!modifyQuarterOutlay.action" id="fm">
			<table title="添加季度经费" style="margin-left: 20px; margin-top: 10px;border-right: 1px solid #96B0C6; border-top: 1px solid #96B0C6; width: 80%" cellpadding="0" cellspacing="0" >
				<tr>
				    <th rowspan="2" class="great_title"></th>
					<th class="great_title"><label for="task.title">年份:</label></th>
					<td class="great_contex"><input class="easyui-validatebox" id="qoyear" 
						type="text" name="qoyears" disabled="disabled" /></td>
				</tr>
				<tr>
					<th class="great_title"><label for="task.title">季度:</label></th>
					<td class="great_contex"><input class="easyui-validatebox" id="qoquarter" 
						type="text" name="qoquarters" disabled="disabled"/>
					<input style="display: none" name="qo.qoyear" value="${qo.qoyear }"/>
					<input style="display: none" name="qo.qoquarter" value="${qo.qoquarter }"/>	
				</td>
				</tr>
				<!--<tr>
				<th class="great_title"><label for="qo.wa.id">单位</label></th>
				<td class="great_contex"><input id="workArchives" name="qo.wa.id"/></td>
				</tr>-->	
				<tr>
				    <th class="great_title" rowspan="4">公务接待费 </th>
					<th class="great_title"><label for="task.title">交通费:</label></th>
					<td class="great_contex"><input class="easyui-numberbox" data-options="min:0,precision:2" id="trafficMon" style="width: 124px;"
						type="text" name="qo.trafficMon" value="${qo.trafficMon }"/></td>
				</tr>
				
				<tr>
					<th class="great_title"><label for="task.title">住宿费:</label></th>
					<td class="great_contex"><input class="easyui-numberbox" data-options="min:0,precision:2" id="stayMon" style="width: 124px;"
						type="text" name="qo.stayMon" value="${qo.stayMon }"/></td>
				</tr>
				<tr>
					<th class="great_title" ><label for="task.title">用餐费:</label></th>
					<td class="great_contex"><input class="easyui-numberbox" data-options="min:0,precision:2" id="foodMon" style="width: 124px;"
						type="text" name="qo.foodMon" value="${qo.foodMon }"/></td>
				</tr>
				
				<tr>
					<th class="great_title"><label for="task.title">其他:</label></th>
					<td class="great_contex"><input class="easyui-numberbox" data-options="min:0,precision:2" id="otherBusiness" style="width: 124px;"
						type="text" name="qo.otherBusiness" value="${qo.otherBusiness }"/></td>
				</tr>
				<tr>
				    <th class="great_title" rowspan="3">因公出国（境）经费</th>
					<th class="great_title"><label for="task.title">境外培训及业务考察:</label></th>
					<td class="great_contex"><input class="easyui-numberbox" data-options="min:0,precision:2" id="trainMon" style="width: 124px;"
						type="text" name="qo.trainMon" value="${qo.trainMon }"/></td>
				</tr>
				
				<tr>
					<th class="great_title"><label for="task.title">国际招商引资活动:</label></th>
					<td class="great_contex"><input class="easyui-numberbox" data-options="min:0,precision:2" id="bidMon" style="width: 124px;"
						type="text" name="qo.bidMon" value="${qo.bidMon }"/></td>
				</tr>
				<tr>
					<th class="great_title"><label for="task.title">其他:</label></th>
					<td class="great_contex"><input class="easyui-numberbox" data-options="min:0,precision:2" id="otherAbroadMon" style="width: 124px;"
						type="text" name="qo.otherAbroadMon" value="${qo.otherAbroadMon }"/></td>
				</tr>
				<tr>
				    <th class="great_title" rowspan="2">公务用车购置及运行维护费</th>
					<th class="great_title"><label for="task.title">车辆购置费:</label></th>
					<td class="great_contex"><input class="easyui-numberbox" data-options="min:0,precision:2" id="buyCarMon" style="width: 124px;"
						type="text" name="qo.buyCarMon" value="${qo.buyCarMon }"/></td>
				</tr>
				<tr>
					<th class="great_title"><label for="task.title">车辆运行维护费:</label></th>
					<td class="great_contex"><input class="easyui-numberbox" data-options="min:0,precision:2" id="fixCarMon" style="width: 124px;"
						type="text" name="qo.fixCarMon" value="${qo.fixCarMon }"/></td>
				</tr>
				
				
			</table>
				
			<div style="margin:10px 0px 10px 0px;text-align: center; width: 80%">
			<!-- <a href="#" class="easyui-linkbutton" onclick="javascript:saveTask(true);" data-options="iconCls:'icon-save'">保存并发布</a> -->
				<a href="#" class="easyui-linkbutton" onclick="javascript:saveQuarterOutlay();" data-options="iconCls:'icon-save'">保存</a> <a
					href="quarterOutlay!toPage.action?pageName=list&uname=${usname }" class="easyui-linkbutton" iconCls="icon-cancel">返回</a>
			</div>
			<input type="hidden" value="${qo.state }" name="qo.state" id="state">
			<input type="hidden" value="${qo.id }" name="qo.id" id="id">
			<input style="display: none" name="qo.createUser" value="${qo.createUser }"/>
			<input style="display: none" name="qo.createTime" value="<fmt:formatDate value="${qo.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/>"/>
			<input  name="qo.wa.id" type="hidden" value="<%=user.getUnitId()%>"/>		
		</form>
	</div>
</body>
</html>