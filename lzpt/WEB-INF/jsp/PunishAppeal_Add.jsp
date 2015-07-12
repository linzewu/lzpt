<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加惩罚诉求</title>
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
});
</script>
</head>
<body type="add">

		<div class="easyui-panel" title="惩罚诉求详细信息">
		<form id="fm" method="post" action="encourageAppeal!addEncourageAppeal.action">
			<table title="添加惩罚诉求" style="margin-left: 20px; margin-top: 10px;" cellpadding="5px">
				
				<tr>
					<th><label for="ea.ewa.id">单位:</label></th>
					<td><input id="ewaid" name="ea.ewa.id" style="width: 153px;"/></td>
				</tr>
				<tr>
					<th><label for="ea.etitle">标题:</label></th>
					<td><input name="ea.etitle" class="easyui-validatebox" style="width: 600px;" required="true" missingMessage="请输入标题" /></td>
				</tr>
				<tr>
					<th><label for="ea.eremark">备注:</label></th>
					<td><input name="ea.eremark" id="remark" class="easyui-validatebox" style="width: 600px;"/>
					<input style="display: none" name="ea.etype" value="1"/>
					</td>
				</tr>
				<tr>
					<th><label for="ea.econtext">内容:</label></th>
					<td><textarea name="ea.econtext" cols="80" rows="10" id="context"></textarea></td>
				</tr>				
				
			</table>
			<div style="margin:10px 0px 10px 0px;text-align: center;">
				<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="javascript:saveEncourage2()">保存</a>  
        		<a href="encourageAppeal!toPage.action?pageName=list1" class="easyui-linkbutton" iconCls="icon-cancel" >取消</a>
			</div>
		</form>
		</div>
		<!--	<div class="fitem">
				<label>标题:</label> <input name="ea.etitle" class="easyui-validatebox" required="true" missingMessage="请输入标题" >
			</div>
			<div class="fitem">
				<label>内容:</label>
				<textarea name="ea.econtext" rows="5" cols="40"></textarea>
			</div>
			<div class="fitem">
				<label>单位:</label>
				<input id="ewaid" name="ea.ewa.id"/></textarea>
			</div>
			<div class="fitem">
				<label>备注:</label>
				<textarea name="ea.eremark" rows="5" cols="40"></textarea>
				<input style="display: none" name="ea.createUser" value="${ea.createUser }"/>
			</div>
		</form>
	
	<div id="dlg-buttons">  
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveEncourage()">保存</a>  
        <a href="encourageAppeal!toPage.action?pageName=list" class="easyui-linkbutton" iconCls="icon-cancel" >取消</a>  
    </div>  -->
</body>
</html>