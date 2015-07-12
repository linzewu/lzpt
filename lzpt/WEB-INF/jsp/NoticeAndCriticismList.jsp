<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"   import="com.kteam.lzpt.entity.User"%>
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
<title>通知和批评警告</title>

<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">  
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath }js/dataCode.js"></script>
<script type="text/javascript" src="${basePath }js/lzpt/common.js"></script>
<script type="text/javascript">
	function toadd(){
		window.location.href="baseManager!NoticeAdd!toPage.action";
	}
	function toedit(tid){
		var row = $('#'+tid).datagrid("getSelected");
		if(null!=row){
			window.location.href = "baseManager!NoticeEdit!toPage.action?be.id="+row['be.id'];
		}else{
			$.messager.alert("提示","请选择需要修改的通知","warning");
		}
	}
	function del(tid){
		var row = $('#'+tid).datagrid("getSelected");
		if(row!=null){
			delBaseEntity("Notice", row['be.id'], function(){
				$('#'+tid).datagrid("reload");
			});
		}else{
			$.messager.alert("提示","请选择需要删除的通知","warning");
		}
	}
	$(function(){	
		$("#dg").datagrid();
	});
	
	function dbclick(rowIndex,rowData){
		var row = $(this).datagrid("getSelected");
		if(null != row)
		{
		   window.location.href = "baseManager!NoticeInfo!toPage.action?be.id="+row['be.id'];
		}
	}
	
	function availsFormatter(value){
		return  getLabelByid("avails", value)
	}
	
	function addCriticism (){
		window.location.href="baseManager!CriticismAdd!toPage.action";
	}
	
	function toeditCriticism(tid){
		var row = $('#'+tid).datagrid("getSelected");
		if(null!=row){
			//window.location.href = "baseManager!CriticismEdit!toPage.action?be.id="+row['be.id'];
			row["be.isClose"] = "Y";
			row["be.actionType"] = "Criticism";
			$.ajax({
				type: "POST",
				url : "baseManager!!saveBaseEntity.action",
				data : row,
				success : function(data, status){
					$.messager.alert("提示","关闭成功","warning");
					$('#'+tid).datagrid("reload");
				}
			});
		}else{
			$.messager.alert("提示","请选择需要修改的批评警告","warning");
		}
	}
	function delCriticism(tid){
		var row = $('#'+tid).datagrid("getSelected");
		if(row!=null){
			delBaseEntity("Criticism", row['be.id'], function(){
				$('#'+tid).datagrid("reload");
			});
		}else{
			$.messager.alert("提示","请选择需要删除的批评警告","warning");
		}
	}
	function dbclickCriticism(rowIndex,rowData){
		var row = $(this).datagrid("getSelected");
		if(null != row)
		{
		   window.location.href = "baseManager!CriticismInfo!toPage.action?be.id="+row['be.id'];
		}
	}
	
	
</script>
</head>
<body>


<div id="tt" class="easyui-tabs"  data-options="onSelect:tabOnSelect">
    <div title="通知列表"  style="padding:10px;">
    	<input value="false"  type="hidden" name="isInit"  tableId="notices">
	    <table id="notices"   data-options="url:'baseManager!!getBaseEntityList.action?be.actionType=Notice',
				rownumbers:true,
				toolbar:'#toolbar',
				pagination:true,
				fitColumns:true,
				singleSelect:true,
				onDblClickRow:dbclick">  
	   	<thead>  
	        <tr>  
	            <th data-options="field:'be.title',width:80">标题</th>  
	            <th data-options="field:'be.isAvail',width:60"   formatter="availsFormatter">是否有效</th>  	            
	        </tr>  
	      </thead>  
		</table>
		<div id="toolbar"  style="padding:5px;height:auto">
			<div style="margin-bottom:5px">				
		       <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="toadd()">添加通知</a> 
		       <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="toedit('notices')">修改通知</a>
		       <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="del('notices')">删除通知</a>		      
		       		       
		    </div>
		</div>
    </div>
</div>
</body>
</html>