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
<title>投诉举报</title>

<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">  
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath }js/dataCode.js"></script>
<script type="text/javascript" src="${basePath }js/lzpt/common.js"></script>
<script type="text/javascript">
	
	function levelFormatter(value){
		return  getLabelByid("jobLevel", value)
	}
	function complainTypeFormatter(value){
		return  getLabelByid("complainType", value);
	}
	
	function reloadTable(tid){
		console.log("#"+tid+"Toolbar [comboname=level]")
		var level = $("#"+tid+"Toolbar [comboname=level]").combobox("getValues");
		var year = $("#"+tid+"Toolbar [comboname=year]").combobox("getValue");
		var param={};
		if(level!=null&&level.length!=0){
			param['be.level']=array2str(level,",");
		}
		
		if(year!=null&&year!=""){
			param['be.year']=year;
		}
		
		console.log(param);
		$("#"+tid).datagrid("load",param);
	}
	
</script>
</head>
<body>


<div id="tt" class="easyui-tabs"  data-options="onSelect:tabOnSelect">
    <div title="专项治理红包自查自纠情况汇总统计表"  style="padding:10px;">
    	<input value="false"  type="hidden" name="isInit"  tableId="KickbacksReport">
	    <table id="KickbacksReport"   data-options="url:'baseManager!!getBaseList.action?be.queryType=KicReportQuery',
				rownumbers:true,
				toolbar:'#KickbacksReportToolbar',
				fitColumns:true,
				singleSelect:true">  
	   	<thead>  
	        <tr>  
	            <th data-options="field:'year',width:80">年度</th>  
	            <th data-options="field:'peopleCount',width:60"  >上交人数</th>  
	            <th data-options="field:'moneyCount',width:100" >上交金额(元)</th>
	        </tr>  
	      </thead>  
		</table>
		<div id="KickbacksReportToolbar"  style="padding:5px;height:auto">
			<div style="margin-bottom:5px">
				年份：<input  id="year"  name="year" class="easyui-combobox"   data-options="valueField:'value',  textField:'label',data:datacode.years,editable:false"   panelHeight="auto"  style="width: 120px;">
				级别：<input  id="level"  name="level" class="easyui-combobox"   data-options="valueField:'value',  textField:'label',data:datacode.jobLevel,editable:false,multiple:true"   panelHeight="auto"  style="width: 200px;">
				<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="reloadTable('KickbacksReport')">查询</a>
		    </div>
		</div>
    </div>
    <div title="专项治理违规插手工程建设项目情况汇总统计表"  style="overflow:auto;padding:10px;">
    <input value="false"  type="hidden" name="isInit"  tableId="IllegalProjectReport">
      <table id="IllegalProjectReport"   data-options="url:'baseManager!!getBaseList.action?be.queryType=IllReportQuery',
			rownumbers:true,
			fitColumns:true,
			toolbar:'#IllegalProjectReportToolbar',
			singleSelect:true">  
	    <thead>
	        <tr>  
	            <th data-options="field:'year',width:80">年度</th>  
	            <th data-options="field:'peopleCount',width:60" >上交人数</th>  
	            <th data-options="field:'moneyCount',width:100" >上交金额</th>
	        </tr>  
	      </thead>  
	</table>
	<div id="IllegalProjectReportToolbar"  style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<div style="margin-bottom:5px">
				年份：<input  id="year2"  name="year" class="easyui-combobox"   data-options="valueField:'value',  textField:'label',data:datacode.years,editable:false"   panelHeight="auto"  style="width: 120px;">
				级别：<input  id="level2" name="level"  class="easyui-combobox"   data-options="valueField:'value',  textField:'label',data:datacode.jobLevel,editable:false,multiple:true"     style="width: 200px;">
				<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="reloadTable('IllegalProjectReport')">查询</a>
		    </div>
	    </div>
	</div>
    </div>
</div>
</body>
</html>