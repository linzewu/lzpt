<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.kteam.lzpt.entity.User"%>
<%@page import="com.kteam.lzpt.common.UnitUtil"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
	String units = application.getAttribute("units").toString();
	User user = (User) session.getAttribute("user");
	Date data = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String currentDate = sdf.format(data);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通知</title>
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/base.css">
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath }js/json2.js"></script>
<script type="text/javascript" src="${basePath }js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${basePath }js/upload/ajaxfileupload.js"></script>
<script type="text/javascript" src="${basePath }js/dataCode.js"></script>
<script type="text/javascript" src="${basePath }js/lzpt/common.js"></script>

<script type="text/javascript">
	$(function() {
		loadInfo("baseManager!!getBaseEntity.action", 'Notice',
				"${param['be.id']}", "myform");
	});
</script>
</head>
<body>
	<form action="baseManager!saveBaseEntity.action" id="myform" name="myform" method="post" enctype="multipart/form-data">
		<div id="p" class="easyui-panel" style="padding: 10px; min-width: 700px; min-height: 300px;" title="通知 详细">
			<div style="margin-left: auto; margin-right: auto; vertical-align: middle; width: 780px; min-height: 400px;">
				<table style="width: 780px" border="0" class="base_table" cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<td class="info_title">标题：</td>
							<td class="info2" colspan="3"><span name="be.title" class="readField"></span></td>						
						</tr>
						
						<tr>
							<td class="info_title">是否有效：</td>
							<td class="info2" colspan="3"><span name="be.isAvail" dataKey="avails" class="dataFormater readField"></span></td>
						</tr>
											
						<tr>
							<td class="info2" colspan="4"  ><div name="be.contents"  class="readField" style="word-break:break-all;width:500px; text-align:center;margin-left: auto;margin-right: auto;"></div> 
							</td>
						</tr>
					</tbody>
				</table>
				<div align="center">
					<a href="baseManager!NoticeAndCriticismList!toPage.action" class="easyui-linkbutton" data-options="iconCls:'icon-back'">返回</a>
				</div>
			</div>
		</div>
	</form>

</body>
</html>