<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.kteam.lzpt.entity.User"%>
<%@page import="com.kteam.lzpt.common.UnitUtil"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
	String units = application.getAttribute("units").toString();
	User user = (User) session.getAttribute("user");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>投诉举报平台</title>
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">
<style type="text/css">
.info_title {
	text-align: right;
	width: 14%;
	color: #890C1A
}

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


<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath }js/json2.js"></script>
<script type="text/javascript" src="${basePath }js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${basePath }js/upload/ajaxfileupload.js"></script>
<script type="text/javascript" src="${basePath }js/dataCode.js"></script>
<script type="text/javascript" src="${basePath }js/lzpt/leaderinfo_manager.js"></script>

</head>
<body>
	<form action="baseManager!saveBaseEntity.action" id="myform" name="myform" method="post" enctype="multipart/form-data">
		<div id="p" class="easyui-panel" title="" style="padding: 10px; min-width: 800px; min-height: 300px;">
			<div style="margin-left: auto; margin-right: auto; vertical-align: middle; width: 780px; min-height: 400px;">
				<table style="width: 600px" border="0" class="base_table">
					<tbody>
						<tr>
							<td class="info_title">姓名：</td>
							<td class="info"><input name="ca.cname" required="true" class="easyui-validatebox single_input" /></td>
							<td class="info_title">性别：</td>
							<td class="info"><select name="ca.csex">
									<option value="1">男</option>
									<option value="0">女</option>
							</select></td>
						</tr>
						<tr>
							<td class="info_title">民族：</td>
							<td class="info"><input name="ca.nation" class="single_input" /></td>
							<td class="info_title">出生年月：</td>
							<td class="info"><input class="easyui-datebox single_input" name="ca.cbirthday" /></td>

						</tr>
						<tr>

							<td class="info_title">政治面貌：</td>
							<td class="info"><input name="ca.politicalStatus" / class="single_input"></td>
							<td class="info_title">参加工作时间：</td>
							<td class="info"><input name="ca.worktime" class="easyui-datebox single_input" /></td>
						</tr>
						<tr>
							<td class="info_title">身份证：</td>
							<td class="info"><input name="ca.idCard" class="single_input" /></td>
							<td class="info_title">入党时间：</td>
							<td class="info"><input name="ca.joinparty" class="easyui-datebox single_input" /></td>
						</tr>
						<tr>
							<td class="info_title">学历：</td>
							<td class="info"><input name="ca.education" class="single_input" /></td>
							<td class="info_title">职称：</td>
							<td class="info"><input name="ca.major" class="single_input" /></td>

						</tr>
						<tr>
							<td class="info_title">电话：</td>
							<td class="info"><input name="ca.phone" class="single_input" /></td>
							<td class="info_title">在职情况：</td>
							<td class="info"><input name="ca.workState" type="radio" value="0" checked="checked" />在职<br /> <input name="ca.workState"
								type="radio" value="1" />已退出现职尚未办理退休手续</td>

						</tr>
						<tr>
							<td class="info_title">工作单位：</td>
							<td class="info"><input id="workArchives" name="ca.wa.id" type="hidden" value="${user.unitId }" /><%=UnitUtil.getUnitNameById(user.getUnitId())%></td>
							<td class="info_title">现任职位：</td>
							<td class="info"><input name="ca.job" class="single_input" /></td>
						</tr>
						<tr>
							<td class="info_title">婚姻状况：</td>
							<td class="info" colspan="3">
							<input name="ca.marriageState" type="radio" value="0" />未婚
							<input name="ca.marriageState"  type="radio" value="1" />已婚 
							<input name="ca.marriageState" type="radio" value="2" />离异
							 <input name="ca.marriageState"	type="radio" value="3" />丧偶</td>
						</tr>
						<tr>
							<td class="info_title">户籍地：</td>
							<td class="info" colspan="3"><input name="ca.nativeplace" class="single_input_long" /></td>
						</tr>
					</tbody>
				</table>

			</div>
			<div align="center">
				<a href="javascript:toAddWA()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a> <a
					href="cadreArchive!toPage.action?pageName=list" class="easyui-linkbutton" data-options="iconCls:'icon-back'">返回</a>
			</div>
		</div>
	</form>

</body>
</html>