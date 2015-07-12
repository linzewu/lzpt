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
	
	$("#lyoyear").combobox({
		valueField:'id',
		textField:'text',
		multiple:false,
		data:[{
		    "id":2012,
		    "text":"2012"
		},{
		    "id":2013,
		    "text":"2013",
		    "selected":true
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


</script>
</head>
<body>
	<table id="dg" title="年度经费列表" class="easyui-datagrid" 
	    url="yearOutlay!queryYearOutlays.action?uname=${roleName == '纪委'?'':uname }"
	    data-options="onDblClickRow:toInfo,onSelect:initTool"
		toolbar="#toolbar" rownumbers="true" fitColumns="true" singleSelect="true" pagination="true">
		<thead>
			<tr>
			    <th data-options="field:'yoyear',width:80">年度</th>	
			    <th data-options="field:'publicTime',width:80">公布时间</th>	
				<th data-options="field:'surplusMon',width:80" >剩余经费</th>		
				<th data-options="field:'state',width:80,formatter:converStatus" >状态</th>					
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
		<a href="javascript:void(0)" id="pushTask" class="easyui-linkbutton" iconCls="icon-redo" plain="true"  onclick="pushyearOutlay()">发布</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove"  plain="true" id="deltool"  onclick="deleteyearOutlay()">删除</a>
		</div>
		<%
	    	}
		%>
		<div>  
       	年度: <input  style="width:150px" name="yo.yoyear" id="lyoyear">  
       	<%
       		if ("纪委".equals(roleName)){
       	%> 
       	单位: <input id="workArchives1" name="yo.wa.id"/>
       	<%
       		}
       	%>
       	<input type="hidden" name="workid" id="workid" value="<%=user.getUnitId()%>"/>
        <a href="javascript:searchTB('${roleName == '纪委'?'':uname }')" class="easyui-linkbutton" iconCls="icon-search">查找</a>  
    </div> 
	</div>
</body>
</html>