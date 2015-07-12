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
<title>用户列表</title>
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/info.css">
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/lzpt/user.js"></script>
<script type="text/javascript" src="${basePath }js/lzpt/common.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	function changeRole(newValue,oldValue){
		var roles = $(this).combobox("getText").split(",");
		
		var flag=false;
		
		for(var i=0;i<roles.length;i++){
			if(roles[i]=="乡镇单位管理员"){
				flag=true;
			}
		}
		
		var uinitid=$("#unitId").combobox("getValue");
		
		if(flag){
			$("#unitId").combobox({
				url:"workArchive!queryWorkArchives.action",
				valueField:"id" ,
				textField:"wname",
				editable:false,
				missingMessage:"请选择单位",
				required:true
			});
			
		}else{
			
			$("#unitId").combobox({
				url:"workArchive!queryWorkArchives.action",
				valueField:"id" ,
				textField:"wname",
				editable:false,
				missingMessage:"请选择单位",
				required:false
			});
		}
		
		$("#unitId").combobox("setValue",uinitid);
		
	}

</script>
</head>
<body>
	<table id="dg" >
		<thead>
			<tr>
				<th data-options="field:'userName',width:80">用户名</th>
				<th data-options="field:'name',width:80">姓名</th>
				<!--<th formatter="formatterRole" data-options="field:'userName',width:80">角色</th>-->
				<th data-options="field:'updateTime',width:80" >修改时间</th>
				<th data-options="field:'lastLoingTime',width:80">上次登陆时间</th>
			</tr>
		</thead>
	</table>
	<div id="toolbar" style="padding:5px;height:auto">
	   <div>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add"   onclick="newUser()">添加用户</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit"  onclick="editUser()">修改用户</a>
	   </div>
	   <div>  
       	姓名: <input  style="width:150px" name="user.name" id="uname">  
        <a href="javascript:searchTB()" class="easyui-linkbutton" iconCls="icon-search">查找</a>  
    </div> 
	</div>

	<div id="dlg" class="easyui-dialog" style="width: 600px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<div class="ftitle">用户信息</div>
		<form id="fm" method="post" novalidate>
			<div class="fitem">
				<label>姓名:</label> <input id="name" name="user.name" class="easyui-validatebox" style="width: 180px; margin-bottom: 10px;" required="true"  missingMessage="请填写姓名" >
			</div>
			<div class="fitem">
				<label>角色:</label> <input id="roles" name="user.roleid" url="role!queryRoles.action" textField="roleName" multiple="true" editable="false" valueField="id" class="easyui-combobox" style="width: 180px; margin-bottom: 10px;" required="true"  missingMessage="请选择角色" data-options="onSelect:changeRole,onUnselect:changeRole">
			</div>
			<div class="fitem">
				<label>所属单位:</label> <input id="unitId"  name="user.unitId"   style="width: 180px; margin-bottom: 10px;"  >
			</div>
			<div class="fitem">
				<label>用户名:</label> <input id="userName"  name="user.userName" class="easyui-validatebox" style="width: 180px; margin-bottom: 10px;" missingMessage="请输入账号" data-options="required:true" validType="valUniquel">
			</div>
			<div class="fitem">
				<label>密码:</label> <input id="password" name="user.password" type="password" class="easyui-validatebox" style="width: 180px; margin-bottom: 10px;" required="true" missingMessage="请输密码">
			</div>
		</form>
	</div>
	
	<div id="dlg-buttons">  
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>  
    </div>  
</body>
</html>