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
<title>年度经费总数对比</title>
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/info.css">
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/lzpt/yearQutlay.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">


$(function(){	
	$("#workArchives1").combobox({
		url:'workArchive!queryWorkArchives.action',
		valueField:'id',
		textField:'wname',
		multiple:false
	});
	
	$("#lyoyear1").combobox({
		valueField:'id',
		textField:'text',
		multiple:false,
		required:true,
		data:[{
		    "id":2012,
		    "text":"2012"
		},{
		    "id":2013,
		    "text":"2013"
		},{
		    "id":2014,
		    "text":"2014"
		},{
		    "id":2015,
		    "text":"2015"
		},{
		    "id":2016,
		    "text":"2016"
		},{
		    "id":2017,
		    "text":"2017"
		},{
		    "id":2018,
		    "text":"2018"
		},{
		    "id":2019,
		    "text":"2019"
		},{
		    "id":2020,
		    "text":"2020"
		},{
		    "id":2021,
		    "text":"2021"
		},{
		    "id":2022,
		    "text":"2022"
		},{
		    "id":2023,
		    "text":"2023"
		},{
		    "id":2024,
		    "text":"2024"
		},{
		    "id":2025,
		    "text":"2025"
		}]

	});
	
	$("#lyoyear").combobox({
		valueField:'id',
		textField:'text',
		multiple:false,
		required:true,
		data:[{
		    "id":2012,
		    "text":"2012"
		},{
		    "id":2013,
		    "text":"2013"
		},{
		    "id":2014,
		    "text":"2014"
		},{
		    "id":2015,
		    "text":"2015"
		},{
		    "id":2016,
		    "text":"2016"
		},{
		    "id":2017,
		    "text":"2017"
		},{
		    "id":2018,
		    "text":"2018"
		},{
		    "id":2019,
		    "text":"2019"
		},{
		    "id":2020,
		    "text":"2020"
		},{
		    "id":2021,
		    "text":"2021"
		},{
		    "id":2022,
		    "text":"2022"
		},{
		    "id":2023,
		    "text":"2023"
		},{
		    "id":2024,
		    "text":"2024"
		},{
		    "id":2025,
		    "text":"2025"
		}]

	});
	
	
	
});


</script>
</head>
<body>
<!-- yearOutlay!getYearOutlayCompare.action -->
	<table id="dg1" title="年度经费总数对比" class="easyui-datagrid"  
		toolbar="#toolbar" rownumbers="true" fitColumns="true" singleSelect="true">
		<thead>
			<tr>
			    <th data-options="field:'c_wname'" width="50" rowspan="2">单位</th>				    
				<th colspan="4" width="50" ><label id="year11" ></label>年决算（单位：万元）</th>		
				<th colspan="4" width="50" ><label id="year22"></label>年决算（单位：万元）</th>	
				<th data-options="field:'yoyear',formatter:minus1" rowspan="2">两年经费总数对比</th>					
			</tr>
			<tr>
			    <th data-options="field:'b1'" width="50">出国（境）费</th>	
			    <th data-options="field:'b2'" width="50">车辆购置及运行费</th>	
				<th data-options="field:'b3'" width="50">公务接待费</th>		
				<th data-options="field:'s1',formatter:sum1" width="50">合计</th>	
				<th data-options="field:'b4'" width="50">出国（境）费</th>	
			    <th data-options="field:'b5'" width="50">车辆购置及运行费</th>	
				<th data-options="field:'b6'" width="50">公务接待费</th>		
				<th data-options="field:'s2',formatter:sum2" width="50">合计</th>					
			</tr>
		</thead>
	</table>
	<div id="toolbar" style="padding:5px;height:auto">	     
		<div>  
       	年度1: <input  style="width:150px" name="year1" id="lyoyear"> 
       	年度2: <input  style="width:150px" name="year1" id="lyoyear1"> 
       	<%
       		if ("纪委".equals(roleName)){
       	%> 
       	单位: <input id="workArchives1" name="yo.wa.id"/>
       	<%
       		}
       	%>
       	<input type="hidden" name="workid" id="workid" value="<%=user.getUnitId()%>"/>
        <a  class="easyui-linkbutton" iconCls="icon-search"  onclick="searchTB1('${roleName == '纪委'?'':uname }')">查找</a>  
    </div> 
	</div>
</body>
</html>