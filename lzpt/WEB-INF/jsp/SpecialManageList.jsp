<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.kteam.lzpt.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	User user = (User) session.getAttribute("user");
	String roleName = user.getDefaultRole().getRoleName();
	request.setAttribute("basePath", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>专项治理</title>

<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath }js/dataCode.js"></script>
<script type="text/javascript" src="${basePath }js/lzpt/common.js"></script>

<script type="text/javascript">
	function toadd() {
		window.location.href = "baseManager!SpecialManageAdd!toPage.action";
	}
	function toedit(tid) {
		var row = $('#' + tid).datagrid("getSelected");
		if (null != row) {
			window.location.href = "baseManager!SpecialManageEdit!toPage.action?be.id="
					+ row['be.id'];
		} else {
			$.messager.alert("提示", "请选择一条记录", "warning");
		}
	}

	function del(tid) {
		var row = $('#' + tid).datagrid("getSelected");
		if (row != null) {
			delBaseEntity("SpecialManage", row['be.id'], function() {
				$('#' + tid).datagrid("reload");
			});
		} else {
			$.messager.alert("提示", "请选择需要删除的记录", "warning");
		}
	}

	function dbclick(rowIndex, rowData) {
		var row = $(this).datagrid("getSelected");
		if (null != row) {
			window.location.href = "baseManager!SpecialManageInfo!toPage.action?be.id="
					+ row['be.id'];
		}
	}

	function formatterSex(value) {
		return getLabelByid("sex", value)
	}
	function formatterLevel(value) {
		return getLabelByid("jobLevel", value);
	}
	
	function formatterUnit(value){
		return getSysUnitById(value);
	}
	
	function reloadTable(tid){
		var name = $("#name").val();
		var unit = $("#unit").combobox("getValue");
		var param={};
		if(name!=null&&name!=""){
			param['be.name']=name;
		}
		if(unit!=null&&unit!=""){
			param['be.unit']=unit;
		}
		$("#"+tid).datagrid("load",param);
	}
	
	function clearSearch(){
		$("#name").val("");
		$("#unit").combobox("setValue",null);
	}
	
</script>
</head>
<body>

	<table id="SpecialManage"
		class="easyui-datagrid"
		data-options="url:'baseManager!!getBaseEntityList.action?be.actionType=SpecialManage&be.queryType=SpecialManageCriterion',
				rownumbers:true,
				toolbar:'#toolbar',
				pagination:true,
				fitColumns:true,
				singleSelect:true">
		<thead>
			<tr>
				<th data-options="field:'be.unitId',width:60"  formatter="formatterUnit">单位</th>
				<th data-options="field:'be.name',width:60" >姓名</th>
				<th data-options="field:'be.age',width:40">年龄</th>
				<th data-options="field:'be.sex',width:40" formatter="formatterSex">性别</th>
				<th data-options="field:'be.idCard',width:60" >身份证</th>
				<th data-options="field:'be.level',width:40" formatter="formatterLevel">级别</th>
				<th data-options="field:'be.job',width:120" >职务</th>
			</tr>
		</thead>
	</table>
	<div id="toolbar" style="padding: 5px; height: auto">
		<div style="margin-bottom: 5px">
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="toadd()">添加登记人</a> 
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="toedit('SpecialManage')">专项治理内容</a> 
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="del('SpecialManage')">删除登记人</a>
		</div>
		
		<div>
			  姓名:<input   id="name"  style="width:100px" />
	          <%
	          	if("纪委工作人员".equals(user.getDefaultRole().getRoleName())||"纪委".equals(user.getDefaultRole().getRoleName())){
	          %>
	          单位：<input name="be.unitId" id="unit"  class="easyui-combobox"   	data-options="url:'workArchive!queryWorkArchives.action',valueField:'id',textField:'wname'"  />
	         <%
	          	}
	         %> 
	            <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="reloadTable('SpecialManage')">查询</a>
	             <a href="#" class="easyui-linkbutton" iconCls="icon-cancel " onclick="clearSearch()">清空条件</a>
	        </div>
	</div>

</body>
</html>