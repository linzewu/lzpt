<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.kteam.lzpt.entity.User"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
	
	User user=(User)session.getAttribute("user");
	String  roleName=user.getDefaultRole().getRoleName();
	request.setAttribute("roleName", roleName);
	request.setAttribute("uname", user.getUserName());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>三公经费列表</title>
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/info.css">
<style type="text/css">
.cg{
	color: green;
}
.cy{
color: orange;
}
.cr{
	color: red;
}
</style>
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath }js/dataCode.js"></script>
<script type="text/javascript">


$(function(){
	
	$("#unitId").combobox({
		url:'workArchive!queryWorkArchives.action',
		valueField:'id',
		textField:'wname',
		multiple:false
	});
	
	$("#lqoyear").combobox({
		valueField:'value',
		textField:'label',
		multiple:false,
		data:datacode.years

	});
	
	$("#lqoquarter").combobox({
		valueField:'value',
		textField:'label',
		multiple:false,
		data:datacode.quarter
	});
});

function formatteUnit(value){
	return getSysUnitById(value);
}

function formatteQuarter(value){
	return getLabelByid("quarter", value);
}

function total1(value,row){
	var trafficMon = row['c_trafficMon']==null?0:row['c_trafficMon'];
	var stayMon = row['c_stayMon']==null?0:row['c_stayMon'];
	var foodMon = row['c_foodMon']==null?0:row['c_foodMon'];
	var otherBusiness = row['c_otherBusiness']==null?0:row['c_otherBusiness'];
	return (trafficMon+stayMon+foodMon+otherBusiness).toFixed(2);
}

function total2(value,row){
	var trainMon = row['c_trainMon']==null?0:row['c_trainMon'];
	var bidMon = row['c_bidMon']==null?0:row['c_bidMon'];
	var otherAbroadMon = row['c_otherAbroadMon']==null?0:row['c_otherAbroadMon'];
	return (trainMon+bidMon+otherAbroadMon).toFixed(2);
}

function totalAll(value,row){
	var trafficMon = row['c_trafficMon']==null?0:row['c_trafficMon'];
	var stayMon = row['c_stayMon']==null?0:row['c_stayMon'];
	var foodMon = row['c_foodMon']==null?0:row['c_foodMon'];
	var otherBusiness = row['c_otherBusiness']==null?0:row['c_otherBusiness'];
	var trainMon = row['c_trainMon']==null?0:row['c_trainMon'];
	var bidMon = row['c_bidMon']==null?0:row['c_bidMon'];
	var otherAbroadMon = row['c_otherAbroadMon']==null?0:row['c_otherAbroadMon'];
	var buyCarMon = row['c_buyCarMon']==null?0:row['c_buyCarMon'];
	var fixCarMon = row['c_fixCarMon']==null?0:row['c_fixCarMon'];
	var total=trafficMon +stayMon+foodMon+otherBusiness+trainMon+bidMon+otherAbroadMon+buyCarMon+fixCarMon;
	var cs = row['quarterTotal']==null?'cy': row['quarterTotal']>=total?'cg':'cr';
	
	return "<span class="+cs+">"+total.toFixed(2)+"</span>";
}

function reloadTable(tid){

	var year = $("#lqoyear").combobox("getValue");
	var quarter = $("#lqoquarter").combobox("getValue");
	var unitId = $("#unitId").combobox("getValue");
	var param={};
	if(year!=null&&year!=""){
		param['be.year']=year;
	}
	if(quarter!=null&&quarter!=""){
		param['be.quarter']=quarter;
	}
	if(unitId!=null&&unitId!=""){
		param['be.unitId']=unitId;
	}
	$("#"+tid).datagrid("load",param);
}

function clearSearch(){
	$("#lqoyear").combobox("setValue",null);
	$("#lqoquarter").combobox("setValue",null);
	$("#unitId").combobox("setValue",null);
}


</script>
</head>
<body>
	<div>
		<span class="cy" style="font-size: 12px;">橙色，该单位没有填写本年度预算</span>
		<span class="cg" style="font-size: 12px;">绿色，该单位本季度费用没有超过年度预算的1/4</span>
		<span class="cr" style="font-size: 12px;">红色，该单位本季度费用超过了年度预算的1/4</span>
	</div>
	<table id="dg" title="季度经费列表" class="easyui-datagrid" 
	    url="baseManager!!getBaseList.action?be.queryType=UnitYearBudgetReportQuery"
		toolbar="#toolbar" rownumbers="true" fitColumns="true" singleSelect="true" pagination="true">
		<thead>
			<tr>
			    <th data-options="field:'c_qoyear',width:80" rowspan="2">年度</th>	
			    <th data-options="field:'c_qoquarter',width:80" rowspan="2" formatter="formatteQuarter">季度</th>
			    <th data-options="field:'t_waid',width:80" rowspan="2" formatter="formatteUnit">单位</th>
			    <th rowspan="2" data-options="field:'totalAll',width:80"   formatter="totalAll">合计</th>
			    <th rowspan="2" data-options="field:'quarterTotal',width:80"  >季度预算（万元） <br>（年度预算1/4）</th>		
				<th rowspan="2"  data-options="field:'total1',width:80"   formatter="total1" >公务接待费<br>（万元）</th>		
				<th rowspan="2" data-options="field:'total2',width:80"   formatter="total2">因公出国(境)<br>经费（万元）</th>
				<th colspan="2" >公务用车购置及运行维护费</th>	
			</tr>
			<tr>	
				<th data-options="field:'c_trafficMon',width:80,hidden:true">交通费</th>
				<th data-options="field:'c_stayMon',width:80,hidden:true">住宿费</th>
				<th data-options="field:'c_foodMon',width:80,hidden:true">用餐费</th>
				<th data-options="field:'c_otherBusiness',width:80,hidden:true">其他</th>
				<th data-options="field:'c_trainMon',width:120,hidden:true">境外培训及业务考察</th>
				<th data-options="field:'c_bidMon',width:120,hidden:true">国际招商引资活动</th>
				<th data-options="field:'c_otherAbroadMon',width:80,hidden:true">其他</th>
				<th data-options="field:'c_buyCarMon',width:100">车辆购置费(万元)</th>
				<th data-options="field:'c_fixCarMon',width:100">车辆运行维护费(万元)</th>
			</tr>
		</thead>
	</table>
	<div id="toolbar" style="padding:5px;height:auto">
		<div>  
       	年度: <input  style="width:150px" name="qo.qoyear" id="lqoyear">  
       	季度: <input  style="width:150px" name="qo.qoquarter" id="lqoquarter"> 
       	单位: <input id="unitId" name="qo.wa.id" />
        <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="reloadTable('dg')">查询</a>  
    	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel " onclick="clearSearch()">清空条件</a>
    </div> 
	</div>
</body>
</html>