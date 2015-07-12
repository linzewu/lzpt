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
<title>关键字列表</title>
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/info.css">
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath }js/lzpt/keyWordsConfig.js"></script>
<script type="text/javascript">

$(function(){
	$("#dg").datagrid({
		url:'keyWordsConfig!queryKeyWordsConfig.action',
		rownumbers:true,
		title:'关键字列表',
		toolbar:"#toolbar",
		pagination:true,
		fitColumns:true,
		singleSelect:true,
		onDblClickRow:function(rowIndex,rowData){
			var row = $("#dg").datagrid("getSelected");
			if(null != row)
			{
			   window.location.href = "keyWordsConfig!getKeyWordsConfigById.action?kw.id="+row.id;
			}
		}
		
	});	
	
	$("#swid").combobox({
		url:'searchWay!querySearchWays.action',
		required:true,
		valueField:'id',
	    textField:'searchmode',
	    multiple:true,
		panelHeight:'auto'
	});
});
</script>
</head>
<body>
	<table id="dg" >
		<thead>
			<tr>
				<th data-options="field:'keyWords',width:80">关键字</th>
				<th data-options="field:'createUser',width:80">创建者</th>
				<th data-options="field:'createTime',width:80">创建时间</th>
				<th data-options="field:'updateUser',width:80">修改者</th>
				<th data-options="field:'updateTime',width:80">修改时间</th>
			</tr>
		</thead>
	</table>
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add"   onclick="newKeyWordsConfig()">添加关键字</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit"  onclick="editKeyWordsConfig()">修改关键字</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" onclick="deleteKeyWordsConfig()">删除关键字</a>
	</div>

	<div id="dlg" class="easyui-dialog" style="width: 600px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<div class="ftitle">关键字信息</div>
		<form id="fm" method="post" novalidate>
			<div class="fitem">
				<label>关键字:</label> <input name="kw.keyWords" class="easyui-validatebox" required="true" missingMessage="请输入关键字" >
			</div>
			<div class="fitem">
				<label>搜索方式:</label>
				<input name="swid" id="swid"/>
				<input style="display: none" name="kw.createUser" value="${kw.createUser }"/>
			</div>
		</form>
	</div>
	
	<div id="dlg-buttons">  
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveKeyWordsConfig()">保存</a>  
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>  
    </div>  
</body>
</html>