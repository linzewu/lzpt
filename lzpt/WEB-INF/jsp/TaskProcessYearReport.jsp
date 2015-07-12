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

    var yearScoreManage=new baseEntityManager("taskProcessYeadReport","UnitYearScore");
   
    function rowClick(index){
    	yearScoreManage.onClickRow(index);
	}
   
	
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
	
	function dataRejectChanage(){
		yearScoreManage.reject();
	}
	
	
	function formatterTotalScore(value,row){
		return (row['avgScore']*0.7 +row['be.score']*0.3).toFixed(2);
	}
	
	function scoreFormater(value){
		return Number(value).toFixed(2);
	}
	
</script>
</head>
<body>

<div id="tt" class="easyui-tabs"  data-options="onSelect:tabOnSelect">
    <div title="乡镇廉政年度综合考核表"  style="overflow:auto;padding:10px;">
    <input value="false"  type="hidden" name="isInit"  tableId="taskProcessYeadReport">
    <%if(user.getDefaultRole().getRoleName().equals("纪委")){ %>
    <span style="color: red;">提示：双击一行数据，可以编辑纪委得分。</span>
    <%} %>
      <table id="taskProcessYeadReport"   data-options="url:'baseManager!!getBaseList.action?be.queryType=TaskProcessYearReportQuery',
			rownumbers:true,
			pagination:true,
			  <%if(user.getDefaultRole().getRoleName().equals("纪委")){ %>
			onDblClickRow: rowClick,
			<%} %>
			fitColumns:true,
			toolbar:'#toolbar2',
			onBeforeLoad:dataRejectChanage,
			singleSelect:true">  
	    <thead>
	        <tr>  
	           <th data-options="field:'be.year',width:10" >年份</th>
	            <th data-options="field:'be.unitId',width:20"  formatter="formatterUnit" >单位名称</th>  
	            <th data-options="field:'avgScore',width:10"  formatter="scoreFormater">系统得分（70%）</th>
	            <th data-options="field:'be.score',width:10,editor:{
																                         type:'numberbox',options:{
																                         required:true,
																                          precision:0,
																                         max:100,
																                         min:0}
																                     }"  >纪委得分（30%）</th>
	            <th data-options="field:'totalScore',width:10"  formatter="formatterTotalScore"  >总得分</th>
	        </tr>  
	      </thead>  
	</table>
	<div id="toolbar2"  style="padding:5px;height:auto">
		 <%if(user.getDefaultRole().getRoleName().equals("纪委")){ %>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-save',plain:true" onclick="yearScoreManage.accept()">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="yearScoreManage.reject()">撤销</a>
		<%} %>
		<div style="margin-bottom:5px">
			  年度：<input id="year" class="easyui-combobox"   data-options="valueField:'value',  textField:'label',data:datacode.years,editable:false"  panelHeight="auto" style="width:100px" />
	          单位：<input id="unit" class="easyui-combobox"   	data-options="url:'workArchive!queryWorkArchives.action',valueField:'id',textField:'wname'"   style="width:100px" />
            <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="reloadTable('taskProcessYeadReport')">查询</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-cancel " onclick="clearSearch()">清空条件</a>
	    </div>
	</div>
    </div>
</div>
</body>
</html>