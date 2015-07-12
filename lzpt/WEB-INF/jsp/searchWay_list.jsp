<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜索方式列表</title>
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/info.css">
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath }js/lzpt/searchWay.js"></script>
<script type="text/javascript">
//扩展easyui验证,验证角色名称是否唯一
/**
$.extend($.fn.validatebox.defaults.rules, {
    valUniquel: {
        validator: function(value){
        	var results = "false";
        	var row = $('#dg').datagrid('getSelected');
        	var id = null;
        	if (null != row)
        	{
        		id = row.roleName;
        	}
        	
        	if (null == row || '' == row || id != value)
        	{
	        	results=$.ajax({ type: "POST",//http请求方式  
	                url: "role!validateRole.action",    //服务器段url地址  
	                data:"role.roleName="+value,      //发送给服务器段的数据  
	                dataType: "text", //告诉JQuery返回的数据格式  
	                async: false      		
	        	}).responseText;	
	        	if (results == "false")
	        		{
	        			return false;
	        		}
	        	else
	        		{
	        			return true;
	        		}
        	}
        	else
        	{
        		return true;
        	}

        },
        message: '角色名称不正确,系统已有该角色!'
    }
});**/
$(function(){
	$("#dg").datagrid({
		url:'searchWay!querySearchWay.action',
		rownumbers:true,
		title:'搜索方式列表',
		toolbar:"#toolbar",
		pagination:true,
		fitColumns:true,
		singleSelect:true
		
	});	
});
</script>
</head>
<body>
	<table id="dg" >
		<thead>
			<tr>
				<th data-options="field:'searchmode',width:80">搜索方式</th>
				<th data-options="field:'website',width:80">搜索网站</th>
				<th data-options="field:'createUser',width:80">创建者</th>
				<th data-options="field:'createTime',width:80">创建时间</th>
				<th data-options="field:'updateUser',width:80">修改者</th>
				<th data-options="field:'updateTime',width:80">修改时间</th>
			</tr>
		</thead>
	</table>
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add"   onclick="newSearchWay()">添加搜索方式</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit"  onclick="editSearchWay()">修改搜索方式</a>
	</div>

	<div id="dlg" class="easyui-dialog" style="width: 600px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<div class="ftitle">搜索方式信息</div>
		<form id="fm" method="post" novalidate>
			<div class="fitem">
				<label>搜索方式:</label> <input name="sw.searchmode" class="easyui-validatebox" required="true" missingMessage="请输入搜索方式" >
			</div>
			<div class="fitem">
				<label>搜索网站:</label>
				<input name="sw.website" class="easyui-validatebox" required="true" missingMessage="请输入搜索网站"/>
				<input style="display: none" name="sw.createUser" value="${sw.createUser }"/>
			</div>
		</form>
	</div>
	
	<div id="dlg-buttons">  
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveSearchWay()">保存</a>  
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>  
    </div>  
</body>
</html>