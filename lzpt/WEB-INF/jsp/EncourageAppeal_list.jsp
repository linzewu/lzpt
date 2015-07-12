<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>奖励诉求列表</title>
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/info.css">
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/lzpt/encourageAppeal.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
$(function(){
	$("#ewaid").combobox({
		url:'workArchive!queryWorkArchives.action',
		valueField:'id',
		textField:'wname',
		multiple:false,
		required:true
	});
});
</script>
</head>
<body>
	<table id="dg" title="奖励诉求列表" class="easyui-datagrid" data-options="onDblClickRow:toInfo,onSelect:initTool"
	    url="encourageAppeal!queryEncourageAppeal.action?ea.etype=0${roleName == '纪委'?'&ea.state=1':'' }"
		toolbar="#toolbar" rownumbers="true" fitColumns="true" singleSelect="true" pagination="true">
		<thead>
			<tr>
				<th data-options="field:'etitle',width:80"  width="50">标题</th>
				<!--<th data-options="field:'econtext',width:80" width="50">内容</th>-->
				<th data-options="field:'state',width:40,formatter:converStatus">状态</th>
				<th data-options="field:'createUser',width:80">创建者</th>
				<th data-options="field:'createTime',width:80">创建时间</th>
				<th data-options="field:'updateUser',width:80">修改者</th>
				<th data-options="field:'updateTime',width:80">修改时间</th>
			</tr>
		</thead>
	</table>
	<div id="toolbar" style="padding:5px;height:auto">
	     <%
	    	if ("廉政监督员".equals(roleName)){
	    %>
	    <div>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add"  plain="true" id="addtool"   onclick="toadd()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit"  plain="true" id="modifytool"  onclick="toEdit()">修改</a>
		<a href="javascript:void(0)" id="pushTask" class="easyui-linkbutton" iconCls="icon-redo" plain="true"  onclick="pushEncourageAppeal()">发布</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove"  plain="true" id="deltool"  onclick="deleteEncourage()">删除</a>
		</div>
		<%
	    	}
		%>
		<div>  
       	标题: <input  style="width:150px" name="ea.etitle" id="letitle">  
        <a href="javascript:searchTB(${roleName == '纪委'?'1':'0' },0)" class="easyui-linkbutton" iconCls="icon-search">查找</a>  
    </div> 
	</div>

	<!--<div id="dlg" class="easyui-dialog" style="width: 600px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<div class="ftitle">奖励诉求信息</div>
		<form id="fm" method="post" novalidate>
			<div class="fitem">
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
	</div>
	
	<div id="dlg-buttons">  
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveEncourage()">保存</a>  
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>  
    </div>  -->
</body>
</html>