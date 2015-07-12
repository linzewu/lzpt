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
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/lzpt/quarterQutlay.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath }js/dataCode.js"></script>
<script type="text/javascript">


$(function(){	
	$("#workArchives1").combobox({
		url:'workArchive!queryWorkArchives.action',
		valueField:'id',
		textField:'wname',
		multiple:false
	});
	
	$("#lqoyear").combobox({
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
	
	$("#lqoquarter").combobox({
		valueField:'id',
		textField:'text',
		multiple:false,
		data:[{
		    "id":1,
		    "text":"第一季度"
		},{
		    "id":2,
		    "text":"第二季度"
		},{
		    "id":3,
		    "text":"第三季度"
		},{
		    "id":4,
		    "text":"第四季度"
		}]
	});
	
});

function formatteUnit(value){
	return getSysUnitById(value)
}


</script>
</head>
<body>
	<table id="dg" title="季度经费列表" class="easyui-datagrid" 
	    url="quarterOutlay!queryQuarterOutlays.action<%=user.getDefaultRole().getRoleName().equals("纪委")?"":"?qo.wa.id="+user.getUnitId() %>"
	    data-options="onDblClickRow:toInfo,onSelect:initTool"
		toolbar="#toolbar" rownumbers="true" fitColumns="true" singleSelect="true" pagination="true">
		<thead>
			<tr>
			    <th data-options="field:'qoyear',width:80" rowspan="2">年度</th>	
			    <th data-options="field:'qoquarter',width:80" rowspan="2">季度</th>
			    <th data-options="field:'waid',width:80" rowspan="2" formatter="formatteUnit">单位</th>
				<th colspan="4" >公务接待费</th>		
				<th colspan="3" >因公出国(境)经费</th>			
				<th colspan="2" >公务用车购置及运行维护费</th>		
			</tr>
			<tr>	
			    		
				<th data-options="field:'trafficMon',width:80">交通费</th>
				<th data-options="field:'stayMon',width:80">住宿费</th>
				<th data-options="field:'foodMon',width:80">用餐费</th>
				<th data-options="field:'otherBusiness',width:80">其他</th>
				<th data-options="field:'trainMon',width:120">境外培训及业务考察</th>
				<th data-options="field:'bidMon',width:120">国际招商引资活动</th>
				<th data-options="field:'otherAbroadMon',width:80">其他</th>
				<th data-options="field:'buyCarMon',width:100">车辆购置费</th>
				<th data-options="field:'fixCarMon',width:100">车辆运行维护费</th>
			</tr>
		</thead>
	</table>
	<div id="toolbar" style="padding:5px;height:auto">
	     <%
	    	if ("乡镇单位管理员".equals(roleName)){
	    %>
	    <div>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add"  plain="true" id="addtool"   onclick="toadd()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit"  plain="true" id="modifytool"  onclick="toEdit()">修改</a>
		<a href="javascript:void(0)" id="pushTask" class="easyui-linkbutton" iconCls="icon-redo" plain="true"  onclick="pushQuarterOutlay()">发布</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove"  plain="true" id="deltool"  onclick="deleteQuarterOutlay()">删除</a>
		</div>
		<%
	    	}
		%>
		<div>  
       	年度: <input  style="width:150px" name="qo.qoyear" id="lqoyear">  
       	季度: <input  style="width:150px" name="qo.qoquarter" id="lqoquarter"> 
       	<%
       		if ("纪委".equals(roleName)){
       	%> 
       	单位: <input id="workArchives1" name="qo.wa.id"/>
       	<%
       		}
       	%>
       	<input type="hidden" name="workid" id="workid" value="<%=user.getUnitId()%>"/>
        <a href="javascript:searchTB('${roleName == '纪委'?'':uname }')" class="easyui-linkbutton" iconCls="icon-search">查找</a>  
    </div> 
	</div>
</body>
</html>