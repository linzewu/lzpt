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
<title>添加批评警告</title>
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
            	onSubmit:function(){
            		var isValid = $(this).form('validate');
            		
            		var cbs = $("#contentsBox").combobox("getValues");
            		var values="";
            		for(var i=0;i<cbs.length;i++){
            			values=values+cbs[i];
            			if(i!=cbs.length-1){
            				values=values+",";
            			}
            		}
            		 $("#contents").val(values);
            		return isValid;
            	},
                success:function(data){
                	var datajson = $.parseJSON(data);
                	if(datajson.state==200){
                		$.messager.alert('提示', "保存成功", 'info',function(){
                			window.location.href="baseManager!CriticismList!toPage.action";
                		});               		
                	}
                }
            });
        });
    </script>
</head>
<body>
	<form action="baseManager!!saveBaseEntity.action"  id="myform" name="myform" method="post" enctype="multipart/form-data">
		<div id="p" class="easyui-panel" style="padding: 10px; min-width: 700px; min-height: 300px;" title="通知  批评警告">
			<div style="margin-left: auto; margin-right: auto; vertical-align: middle; width: 680px; min-height: 400px;">
				<table style="width: 680px" border="0" class="base_table" cellpadding="0"  cellspacing="0">
					<tbody>
						<tr>
							<td class="info_title">单位：</td>
							<td class="info"  >
								<input name="be.unit" class="easyui-combobox"   data-options="valueField:'value',textField:'label',data:datacode.workUnit" required="true"    />
							</td>
							<td class="info_title">编号：</td>
							<td class="info" ><input name="be.jobNumber"  /></td>
						</tr>
						
						<tr>
							<td class="info_title">播放时间：</td>
							<td class="info"  colspan="3"><input name="be.stays" class="easyui-numberbox"  data-options="min:5,precision:0" required="true" value="30"  />(分钟)</td>
						</tr>
						
						<tr>
							<td class="info_title">违规行为：</td>
							<td class="info" colspan="3">
								<input id="contentsBox"  class="easyui-combobox"  required="true"
									 data-options="valueField:'value',textField:'label',data:datacode.irregularities,multiple:true,editable:false" style="width: 480px" />
								
								<input type="hidden"  name="be.actionType"  value="Criticism">
								<input type="hidden"  name="be.contents" id="contents"  >
								<input name="be.isClose" type="hidden" value="N"/>
							</td>
						</tr>
					</tbody>
				</table>
				<div align="center">
					<a href="javascript:$('#myform').submit();" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a> <a
						href="baseManager!CriticismList!toPage.action" class="easyui-linkbutton" data-options="iconCls:'icon-back'">返回</a>
				</div>
			</div>
		</div>
	</form>
</body>
</html>