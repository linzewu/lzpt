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
	Date data=new Date();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	String currentDate = sdf.format(data);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>投诉举报平台</title>
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">
<link rel="stylesheet"  type="text/css" href="${basePath }css/base.css" >
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath }js/json2.js"></script>
<script type="text/javascript" src="${basePath }js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${basePath }js/upload/ajaxfileupload.js"></script>
<script type="text/javascript" src="${basePath }js/dataCode.js"></script>
<script type="text/javascript" src="${basePath }js/lzpt/common.js"></script>
<script type="text/javascript">
        $(function(){
            $('#myform').form({
                success:function(data){
                	var datajson = $.parseJSON(data);
                	if(datajson.state==200){
                		$.messager.alert('提示', "保存成功", 'info',function(){
                			window.location.href="baseManager!ComplainList!toPage.action";
                		});               		
                	}
                }
            });
        });
    </script>
</head>
<body>
	<form action="baseManager!!saveBaseEntity.action"  id="myform" name="myform" method="post" enctype="multipart/form-data">
		<div id="p" class="easyui-panel" style="padding: 10px; min-width: 700px; min-height: 300px;" title="投诉举报  添加">
			<div style="margin-left: auto; margin-right: auto; vertical-align: middle; width: 680px; min-height: 400px;">
				<table style="width: 680px" border="0" class="base_table" cellpadding="0"  cellspacing="0">
					<tbody>
						<tr>
							<td class="info_title">被举报人姓名：</td>
							<td class="info"><input name="be.name" required="true" class="easyui-validatebox"  /></td>
							<td class="info_title">级别：</td>
							<td class="info">
								<input name="be.level" class="easyui-combobox"  required="true"
									 data-options="valueField:'value',textField:'label',data:datacode.jobLevel" />
							</td>
						</tr>
						<tr>
							<td class="info_title">单位：</td>
							<td class="info" colspan="3">
								<input name="be.unitName" class="easyui-validatebox"  required="true" style="width: 460px" /></td>
						</tr>
						<tr>
							<td class="info_title">职务：</td>
							<td class="info"><input name="be.duties" required="true" class="easyui-validatebox" /></td>
							<td class="info_title">问题类别：</td>
							<td class="info">
								<input name="be.complainType" class="easyui-combobox"  required="true"
									 data-options="valueField:'value',textField:'label',data:datacode.complainType" />
							</td>
						</tr>
						<tr>
							<td class="info_title">举报内容：</td>
							<td class="info" colspan="3">
								<textarea name="be.complainContext" required="true" class="easyui-validatebox"  rows="10" cols="70"  id="complainContext"></textarea>
							</td>
						</tr>
						<tr>
							<td class="info_title">相关材料：</td>
							<td class="info" colspan="3">
								<div class="fileInfo" id="fileInfo"></div>
								<input type="file" name="uploadFile" alt="文件上传" id="uploadFile"
						onchange="ajaxFileUpload()" /> <pre><label>请上传与举报的相关材料
可上传文件大小：20M</label></pre>
								<input type="hidden"  name="be.files" id="uplodFilesJson" value="data_[] ">
								<input type="hidden"  name="be.state"  value="0">
								<input type="hidden"  name="be.createUserName"  value="${user.name}">
								<input type="hidden"  name="be.createAccount"  value="${user.userName}">
								<input type="hidden"  name="be.createDate"  value="<%=currentDate %>">
								<input type="hidden"  name="be.actionType"  value="Complain">
							</td>
						</tr>
					</tbody>
				</table>
				<div align="center">
					<a href="javascript:savaDataByFrom('myform')" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a> <a
						href="baseManager!ComplainList!toPage.action" class="easyui-linkbutton" data-options="iconCls:'icon-back'">返回</a>
				</div>
			</div>
		</div>
	</form>

</body>
</html>