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
<title>廉政任务统计报表</title>

<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">  
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath }js/dataCode.js"></script>
<script type="text/javascript" src="${basePath }js/lzpt/common.js"></script>
<script type="text/javascript">

	
	function formatterUnit(value){
		return getLabelByid("workUnit", value);
	}
	function formattertaskType(value){
		return getLabelByid("taskType", value);
	}
	
	function reloadTable(tid){
		var year = $("#year").combobox("getValue");
		var unit = $("#unit").combobox("getValue");
		var param={};
		if(year!=null&&year!=""){
			param['be.year']=year;
		}
		if(unit!=null&&unit!=""){
			param['be.unit']=unit;
		}
		console.log(param)
		$("#"+tid).datagrid("load",param);
	}
	
	function formatterUnit(value){
		return getSysUnitById(value);
	}
	
	function clearSearch(){
		$("#year").combobox("setValue",null);
		$("#unit").combobox("setValue",null);
	}
	
	
</script>
</head>
<body>

<div id="tt" class="easyui-tabs"  data-options="onSelect:tabOnSelect">
    <div title="乡镇廉政指数评估明细"  style="overflow:auto;padding:10px;">
    <input value="false"  type="hidden" name="isInit"  tableId="criticismReport">
      <table id="criticismReport"   data-options="url:'baseManager!!getBaseList.action?be.queryType=TaskProcessScoreQuery',
			rownumbers:true,
			pagination:true,
			fitColumns:true,
			toolbar:'#toolbar2',
			singleSelect:true">  
	    <thead>
	        <tr>  
	           <th data-options="field:'year',width:10" >年份</th>
	            <th data-options="field:'unit',width:20"  formatter="formatterUnit" >单位名称</th>  
	            <th data-options="field:'type',width:30"  formatter="formattertaskType" >任务类型</th>
	             <th data-options="field:'title',width:60"  >任务标题</th> 
	            <th data-options="field:'dt',width:30" >执行时段</th>
	          <!--  <th data-options="field:'lastDate',width:20" >最后期限</th> --> 
	             <th data-options="field:'processDate',width:20" >完成时间</th>
	            <th data-options="field:'systemScore',width:10" >得分</th>
	        </tr>  
	      </thead>  
	</table>
	<div id="toolbar2"  style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			  年度：<input id="year" class="easyui-combobox"   data-options="valueField:'value',  textField:'label',data:datacode.years,editable:false"  panelHeight="auto" style="width:100px" />
	          单位：<input id="unit" class="easyui-combobox"   	data-options="url:'workArchive!queryWorkArchives.action',valueField:'id',textField:'wname'"   style="width:100px" />
            <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="reloadTable('criticismReport')">查询</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-cancel " onclick="clearSearch('criticismReport')">清空条件</a>
	    </div>
	</div>
    </div>
</div>
</body>
</html>