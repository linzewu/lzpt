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
<title>三公经费支出监察</title>
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/info.css">
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/lzpt/quarterQutlay.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">


$(function(){	
	$("#workArchives1").combobox({
		url:'workArchive!queryWorkArchives.action',
		valueField:'id',
		textField:'wname',
		multiple:false
	});
	
	$("#lyoyear").combobox({
		valueField:'id',
		textField:'text',
		multiple:false,
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


function  getRowValue(row,value,key){
	
	var nowValue=row[key];
	if(value==null||value==undefined||value==""||value==0){
		return 0;
	}else if(nowValue==""||nowValue==0||nowValue==null||nowValue==undefined){
		return 0;
	}else{
		var n =Number(nowValue)- Number(value);
		return (Number(n/value)*100).toFixed(2)+"%";
	}
}
<%
	for(int i=1;i<=4;i++){
%>
function prior_traffic<%=i%>(value,row,index){
	return getRowValue(row,value,"c_trafficMon<%=i%>");
}
function prior_train<%=i%>(value,row,index){
	return getRowValue(row,value,"c_trainMon<%=i%>");
}
function prior_buyCar<%=i%>(value,row,index){
	return getRowValue(row,value,"c_buyCarMon<%=i%>");
}
function qutlayCount<%=i%>(value,row,index){
	return  (row["c_trafficMon<%=i%>"]+row["c_trainMon<%=i%>"]+row["c_buyCarMon<%=i%>"]).toFixed(2);
}

function qutlayGrowth<%=i%>(value,row,index){
	var count =  row["c_trafficMon<%=i%>"]+row["c_trainMon<%=i%>"]+row["c_buyCarMon<%=i%>"];
	var yearCount=getYearCount(row,"");
	
	if(yearCount==0){
		return 0+"%";
	}
	
	return (Number(count/yearCount)*100).toFixed(2)+"%";
}

<%
	}
%>

function yearCount(value,row,index){
	return getYearCount(row,"");
}

function yearGrowth(value,row,index){
	
	var pc=getYearCount(row,"_Prior");
	
	if(pc==0||isNaN(pc)){
		return 0+"%";
	}
	
	return (((getYearCount(row,"")-pc)/pc)*100).toFixed(2)+"%";
}

function getYearCount(row,prior){
	<%
	for(int i=1;i<=4;i++){
	%>
	var v<%=i%> = row["c_trafficMon<%=i%>"+prior]+row["c_trainMon<%=i%>"+prior]+row["c_buyCarMon<%=i%>"+prior];
	<%}%>
	return (v1+v2+v3+v4).toFixed(2);
}

</script>
</head>
<body>
	<table id="dg1" title="三公经费支出监察" class="easyui-datagrid" 
	    url="quarterOutlay!getQueryOutlayCheck.action"   style="height:450px"
		toolbar="#toolbar" rownumbers="true" fitColumns="true" singleSelect="true">
		<thead data-options="frozen:true">
			<tr>
			   		<th rowspan="2" data-options="field:'c_wname'">单位</th>
			        <th rowspan="2"  data-options="field:'c_qoyear'">年度</th>
			        <th colspan="3">年度预算</th>
			        <th rowspan="2"  data-options="field:'yearCount',formatter:yearCount">全年实际执<br>行情况总计</th>
		        	<th rowspan="2"  data-options="field:'yearGrowth',formatter:yearGrowth">与上年相比<br>增减（%）</th>
			</tr>
			<tr>
				<th data-options="field:'c_gwjdys'">公务接待费<br>预算（万元）</th>
		    	<th data-options="field:'c_ygcgys'">因公出国（境）<br>费用预算（万元）</th>
		    	<th data-options="field:'c_gwycys'">公务用车费<br>用预算（万元）</th>
			</tr>
		</thead>
		
		<thead>
		    <tr>
		    	<th colspan="8">第一季度</th>
		    	<th colspan="8">第二季度</th>
		    	<th colspan="8">第三季度</th>
		    	<th colspan="8">第四季度</th>
		    </tr>
		    <tr>
		    	<th colspan="2" >公务接待费</th>
		    	<th colspan="2" >因公出国<br>（境）经费</th>
		    	<th colspan="2" >公务用车购置<br>及运行维护费</th>
		    	<th rowspan="2" data-options="field:'c_one1',formatter:qutlayCount1">实际执行<br>情况合计<br>（万元）</th>
		    	<th rowspan="2" data-options="field:'bz1',formatter:qutlayGrowth1">占全年总预<br>算比重（%）</th>
		    	
		    	<th colspan="2" >公务接待费</th>
		    	<th colspan="2" >因公出国<br>（境）经费</th>
		    	<th colspan="2" >公务用车购置<br>及运行维护费</th>
		    	<th rowspan="2" data-options="field:'c_one2',formatter:qutlayCount2">实际执行<br>情况合计<br>（万元）</th>
		    	<th rowspan="2" data-options="field:'bz2',formatter:qutlayGrowth2">占全年总预<br>算比重（%）</th>
		    	
		    	<th colspan="2" >公务接待费</th>
		    	<th colspan="2" >因公出国<br>（境）经费</th>
		    	<th colspan="2" >公务用车购置<br>及运行维护费</th>
		    	<th rowspan="2" data-options="field:'c_one3',formatter:qutlayCount3">实际执行<br>情况合计<br>（万元）</th>
		    	<th rowspan="2" data-options="field:'bz3',formatter:qutlayGrowth3">占全年总预<br>算比重（%）</th>
		    	
		    	<th colspan="2" >公务接待费</th>
		    	<th colspan="2" >因公出国<br>（境）经费</th>
		    	<th colspan="2" >公务用车购置<br>及运行维护费</th>
		    	<th rowspan="2" data-options="field:'c_one4',formatter:qutlayCount4">实际执行<br>情况合计<br>（万元）</th>
		    	<th rowspan="2" data-options="field:'bz4',formatter:qutlayGrowth4">占全年总预<br>算比重（%）</th>
		    </tr>
		    <tr>
		    	<th data-options="field:'c_trafficMon1'">实际执行<br>情况（万元）</th>
		    	<th data-options="field:'c_trafficMon1_Prior' ,formatter:prior_traffic1">与上年同期<br>相比增减（%）</th>
		    	<th data-options="field:'c_trainMon1'">实际执行情况<br>（万元）</th>
		    	<th data-options="field:'c_trainMon1_Prior',formatter:prior_train1">与上年同期相<br>比增减（%）</th>
		    	<th data-options="field:'c_buyCarMon1'">实际执行情况<br>（万元）</th>
		    	<th data-options="field:'c_buyCarMon1_Prior',formatter:prior_buyCar1">与上年同期相<br>比增减（%）</th>
		    	
		    	<th data-options="field:'c_trafficMon2'">实际执行<br>情况（万元）</th>
		    	<th data-options="field:'c_trafficMon2_Prior',formatter:prior_traffic2">与上年同期相<br>比增减（%）</th>
		    	<th data-options="field:'c_trainMon2'">实际执行情况<br>（万元）</th>
		    	<th data-options="field:'c_trainMon2_Prior',formatter:prior_train2">与上年同期相<br>比增减（%）</th>
		    	<th data-options="field:'c_buyCarMon2'">实际执行情况<br>（万元）</th>
		    	<th data-options="field:'c_buyCarMon2_Prior',formatter:prior_buyCar2">与上年同期相<br>比增减（%）</th>
		    	
		    	<th data-options="field:'c_trafficMon3'">实际执行情况<br>（万元）</th>
		    	<th data-options="field:'c_trafficMon3_Prior',formatter:prior_traffic3">与上年同期相<br>比增减（%）</th>
		    	<th data-options="field:'c_trainMon3'">实际执行情况<br>（万元）</th>
		    	<th data-options="field:'c_trainMon3_Prior',formatter:prior_train3">与上年同期相<br>比增减（%）</th>
		    	<th data-options="field:'c_buyCarMon3'">实际执行情况<br>（万元）</th>
		    	<th data-options="field:'c_buyCarMon3_Prior',formatter:prior_buyCar3">与上年同期相<br>比增减（%）</th>
		    	
		    	<th data-options="field:'c_trafficMon4'">实际执行情况<br>（万元）</th>
		    	<th data-options="field:'c_trafficMon4_Prior',formatter:prior_traffic4">与上年同期相<br>比增减（%）</th>
		    	<th data-options="field:'c_trainMon4'">实际执行情况<br>（万元）</th>
		    	<th data-options="field:'c_trainMon4_Prior',formatter:prior_train4">与上年同期相<br>比增减（%）</th>
		    	<th data-options="field:'c_buyCarMon4'">实际执行情况<br>（万元）</th>
		    	<th data-options="field:'c_buyCarMon4_Prior',formatter:prior_buyCar4">与上年同期相<br>比增减（%）</th>
		    </tr>
		</thead>
		
	</table>
	<div id="toolbar" style="padding:5px;height:auto">	     
		<div>  
       	年度: <input  style="width:150px" name="qo.qoyear" id="lyoyear"> 
       	<%
       		if ("纪委".equals(roleName)){
       	%> 
       	单位: <input id="workArchives1" name="qo.wa.id"/>
       	<%
       		}
       	%>
       	<input type="hidden" name="workid" id="workid" value="<%=user.getUnitId()%>"/>
        <a href="javascript:searchTB1('${roleName == '纪委'?'':uname }')" class="easyui-linkbutton" iconCls="icon-search">查找</a>  
    </div> 
	</div>
</body>
</html>