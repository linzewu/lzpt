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
<title>投诉举报平台</title>
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
		loadInfo("baseManager!!getBaseEntity.action", 'Complain',
				"${param['be.id']}", "myform");
		
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
	<form action="baseManager!!saveBaseEntity.action" id="myform" name="myform" method="post" enctype="multipart/form-data">
		<div id="p" class="easyui-panel" style="padding: 10px; min-width: 700px; min-height: 300px;" title="投诉举报  案件处理">
			<div style="margin-left: auto; margin-right: auto; vertical-align: middle; width: 680px; min-height: 400px;">
				<table style="width: 680px" border="0" class="base_table" cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<td class="info_title">监督员姓名：</td>
							<td class="info"><span name="be.createUserName" class="readField"></span> <input name="be.createUserName" value=""  type="hidden" /></td>
							<td class="info_title">监督员账号：</td>
							<td class="info"><span name="be.createAccount" class="readField"  ></span><input name="be.createAccount" value="" type="hidden" /></td>
						</tr>
						
						<tr>
							<td class="info_title">投诉举报时间：</td>
							<td class="info"><span name="be.createDate" class="readField"></span> <input name="be.createDate" value="" type="hidden" /></td>
							<td class="info_title">处理状态：</td>
							<td class="info">
								<input name="be.state"  class="easyui-combobox"  required="true"
									 data-options="valueField:'value',textField:'label',data:datacode.processState" />
							</td>
						</tr>
						
						<tr>
							<td class="info_title">被举报人姓名：</td>
							<td class="info"><span name="be.name" class="readField"></span> <input name="be.name" value="" type="hidden" /></td>
							<td class="info_title">级别：</td>
							<td class="info"><span name="be.level"  dataKey="jobLevel" class="dataFormater readField"></span> <input name="be.level" value="" type="hidden" /></td>
						</tr>
						<tr>
							<td class="info_title">单位：</td>
							<td class="info" colspan="3"><span name="be.unitName" class="readField"></span> <input name="be.unitName" value=""   type="hidden" /></td>
						</tr>
						<tr>
							<td class="info_title">职务：</td>
							<td class="info"><span name="be.duties" class="readField"></span> <input name="be.duties" value="" type="hidden" /></td>
							<td class="info_title">问题类别：</td>
							<td class="info"><span name="be.complainType"    dataKey="complainType" class="dataFormater readField"></span>
							 <input name="be.complainType" value=""  type="hidden" />
							</td>
						</tr>
						<tr>
							<td class="info_title">举报内容：</td>
							<td class="info" colspan="3"><div name="be.complainContext"  class="readField" style="word-break:break-all;width:500px;"></div> 
							<input name="be.complainContext"  value="" type="hidden" /></td>
						</tr>
						<tr>
							<td class="info_title">相关材料：</td>
							<td class="info" colspan="3">
								<div class="fileInfo readField" id="fileInfo" name="be.files"  ></div> 
								<input type="hidden" name="be.files" id="uplodFilesJson">
							</td>
						</tr>
						
						<tr>
							<td class="info_title">处理情况：</td>
							<td class="info" colspan="3">
								<textarea  rows="5" cols="70"  name="be.processInfo" ></textarea>
							</td>
						</tr>
						<tr>
							<td class="info_title">处理结果：</td>
							<td class="info" colspan="3">
								<textarea  rows="5" cols="70"  name="be.processResults" ></textarea>
								<input type="hidden"  name="be.id"  >
								<input type="hidden"  name="be.createAccount"  >
								<input type="hidden"  name="be.createDate"  >
								<input type="hidden"  name="be.actionType"  value="Complain">
							</td>
						</tr>
					</tbody>
				</table>
				<div align="center">
					<a href="javascript:savaDataByFrom('myform')" class="easyui-linkbutton" data-options="iconCls:'icon-save'">提交</a>
					<a href="baseManager!ComplainList!toPage.action" class="easyui-linkbutton" data-options="iconCls:'icon-back'">返回</a>
				</div>
			</div>
		</div>
	</form>

</body>
</html>