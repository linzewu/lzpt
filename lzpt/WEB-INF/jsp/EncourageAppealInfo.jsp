<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.kteam.lzpt.entity.User"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
	User user=(User)session.getAttribute("user");
	String  roleName=user.getDefaultRole().getRoleName();
	request.setAttribute("roleName", roleName);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>奖励诉求详细信息</title>
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/lzpt/encourageAppeal.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath }js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${basePath }js/upload/ajaxfileupload.js"></script>
<link rel="stylesheet" type="text/css" href="${basePath }css/task.css">
<script type="text/javascript">

$(function(){
	$("#ewaid").combobox({
		url:'workArchive!queryWorkArchives.action',
		valueField:'id',
		textField:'wname',
		multiple:false,
		required:true
	});
var pageType=$("body").attr("type");
	

	if(pageType=="add"||pageType=="info"||pageType=="modify"){
		
		CKEDITOR.replace('context', {
			skin : 'office2003'
		});
	}
	
	//加载单位
	var ea1 = 
		$.ajax({ type: "POST",//http请求方式  
        url: "encourageAppeal!getWaidById.action",    //服务器段url地址  
        data:"ea.id=${ea.id}",      //发送给服务器段的数据  
        dataType: "text", //告诉JQuery返回的数据格式  
        async: false
		}).responseText;

	$("#ewaid").combobox("select",ea1);
});
</script>
</head>
<body type="info">
<div class="easyui-panel" title="奖励诉求详细信息">
		<form id="fm" method="post" action="">
			<table title="修改奖励诉求" style="margin-left: 20px; margin-top: 10px;" cellpadding="5px">
				<tr>
					<th><label for="ea.ewa.id">单位:</label></th>
					<td><input id="ewaid" name="ea.ewa.id" disabled="disabled" style="width: 153px;"/></td>
				</tr>
				
				<tr>
					<th><label for="ea.etitle">标题:</label></th>
					<td><input name="ea.etitle" class="easyui-validatebox" style="width: 600px;" value="${ea.etitle }" disabled="disabled" required="true" missingMessage="请输入标题" /></td>
				</tr>
				<tr>
					<th><label for="ea.eremark">备注:</label></th>
					<td><input name="ea.eremark" id="remark" style="width: 600px;" disabled="disabled" value="${ea.eremark }" />
					<input style="display: none" name="ea.createUser" value="${ea.createUser }"/>
					
					<input style="display: none;" name="ea.id" id="eaid" value="${ea.id }"/>
					</td>
				</tr>
				<tr>
					<th><label for="ea.econtext">内容:</label></th>
					<td><textarea name="ea.econtext" cols="80" rows="10" id="context" disabled="disabled">${ea.econtext }</textarea></td>
				</tr>				
				
				<tr>
					<th><label for="ea.escores">加分:</label></th>
					<td><input name="ea.escores" id="scores" class="easyui-validatebox" value="${ea.escores }"  ${roleName == "纪委"?"":"disabled='disabled'"} /></td>
				</tr>
			</table>
			<%
	    	if ("纪委".equals(roleName)){
	    %>
			<div style="margin:10px 0px 10px 0px;text-align: center;">
				<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="javascript:EncourageAppealtotal()">评分</a>  
        		<a href="encourageAppeal!toPage.action?pageName=list" class="easyui-linkbutton" iconCls="icon-cancel" >取消</a>
			</div>
			<%
	    	}
			%>
		</form>
		</div>
</body>
</html>