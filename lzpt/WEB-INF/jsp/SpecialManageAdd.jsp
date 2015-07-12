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
<title>专项治理</title>
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
            	onSubmit:function(param){
            		var isValid = $(this).form('validate');
            		return isValid;
            	},
                success:function(data){
                	var datajson = $.parseJSON(data);
                	if(datajson.state==200){
                		$.messager.alert('提示', "保存成功", 'info',function(){
                			window.location.href="baseManager!SpecialManageList!toPage.action";
                		});               		
                	}
                }
            });
        });
        
    </script>
</head>
<body>
	<form action="baseManager!!saveBaseEntity.action"  id="myform" name="myform" method="post" >
		<div id="p" class="easyui-panel" style="padding: 10px; min-width: 700px; min-height: 300px;" title="专项治理 登记自查自纠人员">
			<div style="margin-left: auto; margin-right: auto; vertical-align: middle; width: 680px; min-height: 400px;">
				<table style="width: 680px" border="0" class="base_table" cellpadding="0"  cellspacing="0">
					<tbody>
						<tr>
							<td class="info_title">单位：</td>
							<td class="info" >
								<%if(user.getDefaultRole().getRoleName().equals("纪委")){ %>
								<input name="be.unitId"  class="easyui-combobox" required="true"  	data-options="url:'workArchive!queryWorkArchives.action',valueField:'id',textField:'wname'"  />
								<%}else{ %>
									<input name="be.unitId"  class="easyui-combobox" required="true"  	data-options="url:'workArchive!queryWorkArchives.action',valueField:'id',disabled:true,textField:'wname'"  value="<%=user.getUnitId() %>" />
								<%} %>
							</td>
							<td class="info_title">姓名：</td>
							<td class="info" ><input name="be.name" class="easyui-validatebox" required="true" /></td>
						</tr>
						<tr>
							<td class="info_title">身份证：</td>
							<td class="info" ><input name="be.idCard" class="easyui-validatebox" validType='length[15,18]'  required="true"  /></td>
							<td class="info_title">性别：</td>
							<td class="info" ><input name="be.sex" class="easyui-combobox" required="true"  data-options="valueField:'value',textField:'label',data:datacode.sex"   /></td>
						</tr>
						
						<tr>
							<td class="info_title">年龄：</td>
							<td class="info" ><input name="be.age"  class="easyui-numberbox"  data-options="min:18,max:120,precision:0" /></td>
							<td class="info_title">级别：</td>
							<td class="info" ><input name="be.level" class="easyui-combobox"  required="true"   data-options="valueField:'value',textField:'label',data:datacode.jobLevel"  /></td>
						</tr>
						<tr>
							<td class="info_title">职务：</td>
							<td class="info"  colspan="3">
								<input name="be.job" class="easyui-validatebox" />
								<input type="hidden"  name="be.actionType"  value="SpecialManage">
							</td>
						</tr>
					</tbody>
				</table>
				<div align="center">
					<a href="javascript:$('#myform').submit();" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
					<a href="baseManager!SpecialManageList!toPage.action" class="easyui-linkbutton" data-options="iconCls:'icon-back'">返回</a>
				</div>
			</div>
		</div>
	</form>
</body>
</html>