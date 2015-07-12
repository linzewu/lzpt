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
<title>审计报告</title>
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
		loadInfo("baseManager!!getBaseEntity.action", 'AuditReport',
				"${param['be.id']}", "myform");
		
		$('#myform').form({
            success:function(data){
            	var datajson = $.parseJSON(data);
            	if(datajson.state==200){
            		$.messager.alert('提示', "保存成功", 'info',function(){
            			window.location.href="baseManager!auditReport!toPage.action";
            		});               		
            	}
            }
        });
	});
</script>
</head>
<body>
	<form action="baseManager!!saveBaseEntity.action" id="myform" name="myform" method="post" enctype="multipart/form-data">
		<div id="p" class="easyui-panel" style="padding: 10px; min-width: 700px; min-height: 300px;" title="审计报表 编辑">
			<div style="margin-left: auto; margin-right: auto; vertical-align: middle; width: 680px; min-height: 400px;">
				<table style="width: 680px" border="0" class="base_table" cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<td class="info_title">姓名：</td>
							<td class="info"><input name="be.userName" value=""  /></td>
							<td class="info_title">审计类型：</td>
							<td class="info"><input name="be.auditType" class="easyui-combobox"  required="true" id="auditType"
									 data-options="valueField:'value',textField:'label',data:datacode.auditType" /></td>
						</tr>						
						
						<tr>
							<td class="info_title">单位：</td>
							<td class="info" colspan="3"><input name="be.unitName" class="easyui-combobox"  data-options="valueField:'value',textField:'label',data:datacode.units"     required="true"   style="width: 300px" /></td>
						</tr>
						
						<tr>
							<td class="info_title">备注说明：</td>
							<td class="info" colspan="3">
							<textarea name="be.remark" required="true" class="easyui-validatebox"  rows="10" cols="70"  ></textarea>
							</td>
						</tr>
						<tr>
							<td class="info_title">上传报告：</td>
							<td class="info" colspan="3">
								<div class="fileInfo" id="fileInfo"></div>
								<input type="file" name="uploadFile" alt="文件上传" id="uploadFile"
						onchange="ajaxFileUpload()" /> <pre><label>请上传与审计相关的材料
可上传文件大小：20M</label></pre>
								<input type="hidden"  name="be.files" id="uplodFilesJson" value="data_[] ">
							</td>
						</tr>
						
							<input type="hidden"  name="be.id" >
							<input type="hidden"  name="be.actionType"  value="AuditReport">
					</tbody>
				</table>
				<div align="center">
					<a href="javascript:savaDataByFrom('myform')" class="easyui-linkbutton" data-options="iconCls:'icon-save'">提交</a>
					<a href="baseManager!auditReport!toPage.action" class="easyui-linkbutton" data-options="iconCls:'icon-back'">返回</a>
				</div>
			</div>
		</div>
	</form>

</body>
</html>