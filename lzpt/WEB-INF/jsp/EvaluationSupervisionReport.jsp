<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"   import="com.kteam.lzpt.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	User user = (User) session.getAttribute("user");
	String roleName = user.getDefaultRole().getRoleName();
	request.setAttribute("basePath", basePath);
	Date data=new Date();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	String currentDate = sdf.format(data);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>监督员评价</title>

<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">  
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath }js/dataCode.js"></script>
<script type="text/javascript" src="${basePath }js/lzpt/common.js"></script>
<script type="text/javascript">
	var currentDate=new Date();
	var tid="#EvaluationSupervision";
	$(function(){	
		$("#year").combobox("setValue",currentDate.getFullYear());
		$("#month").combobox("setValue",currentDate.getMonth()+1);
	});

	
	function reloadTable(){
		var year = $("#year").combobox("getValue");
		var month = $("#month").combobox("getValue");
		var unit = $("#unit").combobox("getValue");
		var param={};
		if(year!=null&&year!=""){
			param['be.year']=year;
		}
		if(month!=null&&month!=""){
			param['be.month']=month;
		}
		if(unit!=null&&unit!=""){
			param['be.unit']=unit;
		}
		$(tid).datagrid("load",param);
	}
	
	function clearSearch(){
		$("#year").combobox("setValue",null);
		$("#month").combobox("setValue",null);
		$("#unit").combobox("setValue",null);
	}
	
	
	function reloadTable1(tid){
		var year = $("#year1").combobox("getValue");
		var unit = $("#unit1").combobox("getValue");
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
	
	function clearSearch1(){
		$("#year1").combobox("setValue",null);
		$("#unit1").combobox("setValue",null);
	}
	
	
	function yearFormatter(value){
		return getLabelByid("years",value);
	}
	
	function monthFormatter(value){
		return getLabelByid("months",value);
	}
	
	function unitFormatter(value){
		return getLabelByid("units",value);
	}
	
	function esReportload(data){
		console.log(data);
		if(data.state==200){
			var datalist=[];
			$.each(data.rows,function(i,n){
				var d={};
				d['be.score']=n[0];
				d['be.year']=n[1];
				d['be.month']=n[2];
				d['be.unit']=n[3];
				datalist.push(d);
			});

			$("#esReport").datagrid('loadData',datalist);
		}
	}
	
	function scoreFormatter(value){
		return Number(value).toFixed(2);
	}

	
</script>
</head>
<body>
<div id="tt" class="easyui-tabs"  data-options="onSelect:tabOnSelect">
	<div title="监督员评价年度统计"  style="padding:10px;">
		<input name="isInit"  value="false" hidden="true"  tableId="esReport">
		<table id="esReport"   data-options="
														                iconCls: 'icon-edit',
														                url:'baseManager!!getBaseEntityListNoPagination.action?be.actionType=EvaluationSupervision&be.queryType=ESCriterion&be.esReport=0',
														                singleSelect: true,
														                toolbar: '#esReportTool',
														                title:'监督员评价',
														                fitColumns:true">
					  <thead>
					        <tr>
					        	<th data-options="field:'year',
																	                     width : 30,
																	                     formatter:yearFormatter">年度</th>
								<th data-options="field:'unit',
																	                     width : 80,
																	                     formatter:unitFormatter">单位</th>
								<th data-options="field:'score',width : 30,formatter:scoreFormatter">平均分</th>	
					        </tr>
					 </thead>
				</table>
		<div id="esReportTool" style="height: auto">
			 <div>
	          年度：<input class="easyui-combobox"   data-options="valueField:'value',  textField:'label',data:datacode.years,editable:false"  id="year1" panelHeight="auto" style="width:100px" />
	          单位：<input class="easyui-combobox"   data-options="valueField:'value',  textField:'label',data:datacode.units,editable:false"  id="unit1"  style="width:100px" />
	            <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="reloadTable1('esReport')">查询</a>
	             <a href="#" class="easyui-linkbutton" iconCls="icon-cancel " onclick="clearSearch1()">清空条件</a>
	        </div>
		</div>
	</div>
</div>
</body>
</html>