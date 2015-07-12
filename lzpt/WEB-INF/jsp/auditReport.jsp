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
<title>审计报告</title>

<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">  
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath }js/dataCode.js"></script>
<script type="text/javascript" src="${basePath }js/lzpt/common.js"></script>
<script type="text/javascript">
	function toadd(audittype){
		window.location.href="baseManager!auditReportAdd!toPage.action?be.auditType="+audittype;
	}
	function toedit(tid){
		var row = $('#'+tid).datagrid("getSelected");
		if(null!=row){
			window.location.href = "baseManager!AuditReportEdit!toPage.action?be.id="+row['be.id'];
		}else{
			$.messager.alert("提示","请选择需要修改的审计报告","warning");
		}
	}
	function del(tid){
		var row = $('#'+tid).datagrid("getSelected");
		if(row!=null){
			delBaseEntity("AuditReport", row['be.id'], function(){
				$('#'+tid).datagrid("reload");
			});
		}else{
			$.messager.alert("提示","请选择需要删除的审计报告","warning");
		}
	}
	$(function(){	
		$("#dg").datagrid();
	});
	
	function dbclick(rowIndex,rowData){
		var row = $(this).datagrid("getSelected");
		if(null != row)
		{
		   window.location.href = "baseManager!AuditTypeInfo!toPage.action?be.id="+row['be.id'];
		}
	}
	
	function auditTypeFormatter(value){
		return  getLabelByid("auditType", value)
	}
	
	function unitFormatter(value){
		return  getLabelByid("units", value);
	}
	
	function reloadTableSpecialAudit(unitName,userName,auditId,auditType){
		var sunitName = $("#"+unitName).combobox("getValue");
		console.log(sunitName);
		var suserName = $("#"+userName).val();
		var param={};
		if(sunitName!=null&&sunitName!=""){
			param['be.unitName']=sunitName;
		}
		if(suserName!=null&&suserName!=""){
			param['be.userName']=suserName;
		}
		param['be.auditType']=auditType;
		$("#"+auditId).datagrid("load",param);
	}
	
</script>
</head>
<body>


<div id="tt" class="easyui-tabs"  data-options="onSelect:tabOnSelect">
    <div title="专项审计"  style="padding:10px;">
    	<input value="false"  type="hidden" name="isInit"  tableId="specialAudit">
	    <table id="specialAudit"   data-options="url:'baseManager!!getBaseEntityList.action?be.actionType=AuditReport&be.queryType=AuditReportCriterion&be.auditType=0',
				rownumbers:true,
				toolbar:'#toolbar',
				pagination:true,
				fitColumns:true,
				singleSelect:true,
				onDblClickRow:dbclick">  
	   	<thead>  
	        <tr>  
	            <th data-options="field:'be.unitName',width:80" formatter="unitFormatter">单位</th>  
	            <th data-options="field:'be.auditType',width:60"   formatter="auditTypeFormatter">审计类型</th>  
	            <th data-options="field:'be.userName',width:100" >名称</th>
	            <th data-options="field:'be.remark',width:80">备注说明</th>
	            
	        </tr>  
	      </thead>  
		</table>
		<div id="toolbar"  style="padding:5px;height:auto">
			<div style="margin-bottom:5px">				
		       <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="toadd('0')">添加审计报告</a> 
		       <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="toedit('specialAudit')">修改审计报告</a>
		       <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="del('specialAudit')">删除审计报告</a>		      
		       <div>  
			       	单位: <input  style="width:150px" class="easyui-combobox"  data-options="valueField:'value',textField:'label',data:datacode.units"   name="sunitName" id="sunitName"> 
			       	姓名: <input  style="width:150px" name="suserName" id="suserName">  
			        <a href="javascript:reloadTableSpecialAudit('sunitName','suserName','specialAudit','0')" class="easyui-linkbutton" iconCls="icon-search">查找</a>  
			    </div> 
		    </div>
		</div>
    </div>
    <div title="单位年度审计"  style="overflow:auto;padding:10px;">
    	<input value="false"  type="hidden" name="isInit"  tableId="yearAudit">
      <table id="yearAudit"   data-options="url:'baseManager!!getBaseEntityList.action?be.actionType=AuditReport&be.queryType=AuditReportCriterion&be.auditType=1',
			rownumbers:true,
			pagination:true,
			fitColumns:true,
			toolbar:'#toolbar2',
			singleSelect:true,
			onDblClickRow:dbclick">  
	    <thead>
	        <tr>  
	              <th data-options="field:'be.unitName',width:80" formatter="unitFormatter">单位</th>  
	            <th data-options="field:'be.auditType',width:60"   formatter="auditTypeFormatter">审计类型</th>  
	            <th data-options="field:'be.userName',width:100" >名称</th>
	            <th data-options="field:'be.remark',width:80">备注说明</th>
	        </tr>  
	      </thead>  
	</table>
	<div id="toolbar2"  style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="toadd('1')">添加审计报告</a> 
			       <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="toedit('yearAudit')">修改审计报告</a>
			       <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="del('yearAudit')">删除审计报告</a>		      
			       <div>  
			       	单位: <input  style="width:150px" class="easyui-combobox"  data-options="valueField:'value',textField:'label',data:datacode.units"  name="yunitName" id="yunitName"> 
			       	姓名: <input  style="width:150px" name="yuserName" id="yuserName">  
			        <a href="javascript:reloadTableSpecialAudit('yunitName','yuserName','yearAudit','1')" class="easyui-linkbutton" iconCls="icon-search">查找</a>  
			    </div>  
	    </div>
	</div>
    </div>
    <%if("纪委".equals(user.getDefaultRole().getRoleName())){ %>
    <div title="干部任期审计"  style="padding:10px;">
    	<input value="false"  type="hidden" name="isInit"  tableId="leaderAudit">
    	<table id="leaderAudit"   data-options="url:'baseManager!!getBaseEntityList.action?be.actionType=AuditReport&be.queryType=AuditReportCriterion&be.auditType=2',
			rownumbers:true,
			pagination:true,
			fitColumns:true,
			toolbar:'#toolbar3',
			singleSelect:true,
			onDblClickRow:dbclick">  
	    <thead>  
	        <tr>  
	              <th data-options="field:'be.unitName',width:80" formatter="unitFormatter">单位</th>  
	            <th data-options="field:'be.auditType',width:60"   formatter="auditTypeFormatter">审计类型</th>  
	            <th data-options="field:'be.userName',width:100" >名称</th>
	            <th data-options="field:'be.remark',width:80">备注说明</th>
	        </tr>  
	      </thead>  
	</table>
	<div id="toolbar3"  style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
	       		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="toadd('2')">添加审计报告</a> 
			       <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="toedit('leaderAudit')">修改审计报告</a>
			       <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="del('leaderAudit')">删除审计报告</a>		      
			       <div>  
			       	单位: <input  style="width:150px"  class="easyui-combobox"  data-options="valueField:'value',textField:'label',data:datacode.units"      name="lunitName" id="lunitName"> 
			       	姓名: <input  style="width:150px" name="luserName" id="luserName">  
			        <a href="javascript:reloadTableSpecialAudit('lunitName','luserName','leaderAudit','2')" class="easyui-linkbutton" iconCls="icon-search">查找</a>  
			    </div>  
	    </div>
	</div> 
    </div>
    <%} %>
</div>
</body>
</html>