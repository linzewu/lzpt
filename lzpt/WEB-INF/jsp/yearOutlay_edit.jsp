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
<title>修改年度经费</title>

<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/task.css">

<script type="text/javascript" src="${basePath }js/json2.js"></script>
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath }js/lzpt/yearQutlay.js"></script>
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
		
	$("#yoyear").combobox({
		valueField:'id',
		textField:'text',
		multiple:false,
		required:true,
		data:[{
		    "id":2012,
		    "text":"2012"
		},{
		    "id":2013,
		    "text":"2013"
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
	$("#yoyear").combobox("setValue","${yo.yoyear}");
});


</script>
</head>
<body type="add">
	<div class="easyui-panel" title="修改年度经费">
		<form method="post" action="yearOutlay!modifyYearOutlay.action" id="fm">
			<table title="修改年度经费" style="margin-left: 20px; margin-top: 10px;border-right: 1px solid #96B0C6; border-top: 1px solid #96B0C6; width: 80%" cellpadding="0" cellspacing="0" >
				<tr>
				    
					<th class="great_title"><label for="task.title">年份:</label></th>
					<td class="great_contex"><input class="easyui-validatebox" id="yoyear" 
						type="text" name="yoyears" disabled="disabled"/></td>
				</tr>
				<tr>
					<th class="great_title"><label for="task.title">剩余经费:</label></th>
					<td class="great_contex"><input class="easyui-numberbox" data-options="min:0,precision:2" id="surplusMon" 
						type="text" name="yo.surplusMon" style="width: 124px;" value="${yo.surplusMon }"/>					
						</td>
				</tr>		
				
			</table>
				
			<div style="margin:10px 0px 10px 0px;text-align: center; width: 80%">
			<!-- <a href="#" class="easyui-linkbutton" onclick="javascript:saveTask(true);" data-options="iconCls:'icon-save'">保存并发布</a> -->
				<a href="#" class="easyui-linkbutton" onclick="javascript:saveYearOutlay();" data-options="iconCls:'icon-save'">保存</a> <a
					href="yearOutlay!toPage.action?pageName=list&uname=${usname }" class="easyui-linkbutton" iconCls="icon-cancel">返回</a>
			</div>
			<input type="hidden" value="${yo.state }" name="yo.state" id="state">
			<input type="hidden" value="${yo.id }" name="yo.id" id="id">
			<input style="display: none" name="yo.createUser" value="${yo.createUser }"/>
			<input style="display: none" name="yo.createTime" value="<fmt:formatDate value="${yo.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/>"/>
			<input  name="yo.wa.id" type="hidden" value="<%=user.getUnitId()%>"/>
			<input style="display: none" name="yo.yoyear" value="${yo.yoyear }"/>	
		</form>
	</div>
</body>
</html>