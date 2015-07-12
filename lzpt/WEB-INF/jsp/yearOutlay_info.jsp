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
<title>年度经费详细信息</title>

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

</script>
</head>
<body type="add">
	<div class="easyui-panel" title="年度经费详细信息">
		<form method="post" action="yearOutlay!addYearOutlay.action" id="fm">
			<table title="年度经费详细信息" style="margin-left: 20px; margin-top: 10px;border-right: 1px solid #96B0C6; border-top: 1px solid #96B0C6; width: 80%" cellpadding="0" cellspacing="0" >
				<tr>
				    
					<th class="great_title"><label for="task.title">年份:</label></th>
					<td class="great_contex">${yo.yoyear }</td>
				</tr>
				<tr>
					<th class="great_title"><label for="task.title">剩余经费:</label></th>
					<td class="great_contex">${yo.surplusMon }</td>
				</tr>
				<tr>
				<th class="great_title"><label for="qo.wa.id">单位</label></th>
				<td class="great_contex">${yo.wa.wname }</td>
				</tr>	
				<tr>
					<th class="great_title"><label for="task.title">发布时间:</label></th>
					<td class="great_contex"><fmt:formatDate value="${yo.publicTime }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>
				</tr>
				<tr>
					<th class="great_title"><label for="task.title">状态:</label></th>
					<td class="great_contex">${yo.state == 0?"新增":"发布" }</td>
				</tr>		
				
			</table>
				
			
		</form>
	</div>
</body>
</html>