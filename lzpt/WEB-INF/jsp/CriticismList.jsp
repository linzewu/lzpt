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
			window.location.href = "baseManager!CriticismEdit!toPage.action?be.id="+row['be.id'];
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
	
	function formatterUnit(value){
		return getLabelByid("workUnit", value);
	}
	
	function formatterContents(value){
		var strs=value.split(",");
		var labels="";
		for(var i in strs){
			labels+=getLabelByid("irregularities", strs[i])+",";
		}
		if(labels!=""){
			labels=labels.substring(0, labels.length-1);
		}
		return labels;
	}
	
</script>
</head>
<body>

<div id="tt" class="easyui-tabs"  data-options="onSelect:tabOnSelect">
    <div title="批评警告列表"  style="overflow:auto;padding:10px;">
    <input value="false"  type="hidden" name="isInit"  tableId="criticism">
      <table id="criticism"   data-options="url:'baseManager!!getBaseEntityList.action?be.actionType=Criticism&be.df=d2',
			rownumbers:true,
			pagination:true,
			fitColumns:true,
			toolbar:'#toolbar2',
			singleSelect:true,
			onDblClickRow:dbclickCriticism">  
	    <thead>
	        <tr>  
	            <th data-options="field:'be.unit',width:100"  formatter="formatterUnit">单位</th>
	            <th data-options="field:'be.jobNumber',width:40"  >编号</th>  
	            <th data-options="field:'be.startTime',width:60"  >创建时间</th>
	            <th data-options="field:'be.stays',width:30" >播放时间</th>
	            <th data-options="field:'be.contents',width:200" formatter="formatterContents">违规行为</th>
	        </tr>  
	      </thead>  
	</table>
	<div id="toolbar2"  style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addCriticism()">添加批评警告消息</a> 
	       <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="toeditCriticism('criticism')">修改批评警告消息</a>
	       <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="delCriticism('criticism')">删除数据</a>		      
	    </div>
	</div>
    </div>
</div>
</body>
</html>