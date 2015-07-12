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
<title>单位年度预算</title>

<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">  
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath }js/dataCode.js"></script>
<script type="text/javascript" src="${basePath }js/lzpt/common.js"></script>
<script type="text/javascript">
	function toadd(){
		window.location.href="baseManager!UnitYearBudgetAdd!toPage.action";
	}
	function toedit(tid){
		var row = $('#'+tid).datagrid("getSelected");
		if(null!=row){
			if(row['be.state']==0){
				window.location.href = "baseManager!UnitYearBudgetEdit!toPage.action?be.id="+row['be.id'];
			}else{
				$.messager.alert("提示","该年度预算已经被锁定，不能修改，如需改动，请联系纪委解锁。","warning");
			}
		}else{
			$.messager.alert("提示","请选择需要修改的数据","warning");
		}
	}
	
	function lock(tid,state){
		var row = $('#'+tid).datagrid("getSelected");
		if(null!=row){
			console.log(state);
			row['be.state']=state;
			row['be.actionType']='UnitYearBudget';
			var sid =saveData(row);
			if(sid!=null){
				$('#'+tid).datagrid("reload");
			}
		}else{
			$.messager.alert("提示","请选择需要锁定的数据","warning");
		}
	}
	
	function del(tid){
		var row = $('#'+tid).datagrid("getSelected");
		if(row!=null){
			if(row['be.state']==0){
				delBaseEntity("UnitYearBudget", row['be.id'], function(){
					$('#'+tid).datagrid("reload");
				});
			}else{
				$.messager.alert("提示","该年度预算已被锁定，不能删除","warning");
			}
		}else{
			$.messager.alert("提示","请选择需要删除的数据","warning");
		}
	}

	
	function dbclick(rowIndex,rowData){
		var row = $(this).datagrid("getSelected");
		if(null != row)
		{
		   window.location.href = "baseManager!UnitYearBudgetInfo!toPage.action?be.id="+row['be.id'];
		}
	}
	
	function formatterUnit(value){
		return getSysUnitById(value);
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
	
	function formatterYBS(value){
		return getLabelByid("yearBudgetState", value);
	}
	var tid="#UnitYearBudget";
	function reloadTable(){
		var year = $("#year").combobox("getValue");
		var unit = $("#unit").combobox("getValue");
		var param={};
		if(year!=null&&year!=""){
			param['be.year']=year;
		}
		if(unit!=null&&unit!=""){
			param['be.unitId']=unit;
		}
		$(tid).datagrid("load",param);
	}
	
	function clearSearch(){
		$("#year").combobox("setValue",null);
		$("#unit").combobox("setValue",null);
	}
	
	
	
</script>
</head>
<body>

<div id="tt" class="easyui-tabs"  data-options="onSelect:tabOnSelect">
    <div title="单位年度预算信息"  style="overflow:auto;padding:10px;">
    <input value="false"  type="hidden" name="isInit"  tableId="UnitYearBudget">
      <table id="UnitYearBudget"   data-options="url:'baseManager!!getBaseEntityList.action?be.actionType=UnitYearBudget&be.queryType=UnitYearBudgetCriterion',
			rownumbers:true,
			pagination:true,
			fitColumns:true,
			toolbar:'#toolbar2',
			singleSelect:true,
			onDblClickRow:dbclick">  
	    <thead>
	        <tr>  
	            <th data-options="field:'be.year',width:15"  >年份</th>  
	            <th data-options="field:'be.unitId',width:15"  formatter="formatterUnit">单位</th>
	            <th data-options="field:'be.gwjdys',width:40"  >公务接待费预算（万元）</th>
	            <th data-options="field:'be.ygcgys',width:50"  >因公出国（境）费用预算（万元）</th>
	            <th data-options="field:'be.gwycys',width:40"  >公务用车费用预算（万元）</th>
	            <th data-options="field:'be.money',width:25"  >预算总金额</th>
	            <th data-options="field:'be.state',width:40" formatter="formatterYBS">预算状态</th>
	        </tr>  
	      </thead>  
	</table>
	<div id="toolbar2"  style="padding:5px;height:auto">
		<%if(user.getDefaultRole().getRoleName().equals("乡镇单位管理员")){ %>
       			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="toadd()">添加预算</a> 
		       <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="toedit('UnitYearBudget')">修改预算</a>
		       <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="del('UnitYearBudget')">删除预算</a>
       <%} %>	      
	
       <%if(user.getDefaultRole().getRoleName().equals("纪委")){ %>
       		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-lock" plain="true" onclick="lock('UnitYearBudget','1')">预算锁定</a>
       		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-lock-open" plain="true" onclick="lock('UnitYearBudget','0')">预算解锁</a>
       
			<div style="margin-bottom:5px">    
			  年度：<input class="easyui-combobox"   data-options="valueField:'value',  textField:'label',data:datacode.years,editable:false"  id="year" panelHeight="auto" style="width:100px" />
	          单位：<input class="easyui-combobox"   data-options="valueField:'id',  textField:'wname',data:sysUnits,editable:false"  id="unit"  style="width:100px" /> 
	            <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="reloadTable()">查询</a>
	             <a href="#" class="easyui-linkbutton" iconCls="icon-cancel " onclick="clearSearch()">清空条件</a>
	    	</div>       
	    	<%} %>
	       
	</div>
    </div>
</div>
</body>
</html>