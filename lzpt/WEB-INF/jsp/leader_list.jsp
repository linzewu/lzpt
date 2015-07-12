<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>干部廉政档案</title>

<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">  

<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
	function toInfo(){
		var row = $("#dg").datagrid("getSelected");
		if(null != row)
		{
		   window.location.href = "cadreArchive!getCadreArchive.action?ca.id="+row.id;
		}else{
			$.messager.alert('提示','您好请选择一条记录!');  
		}
	}
	
	function toadd(){
		window.location.href="cadreArchive!toPage.action?pageName=addLeader";
	}
	
	function toEdit()
	{
		var row = $("#dg").datagrid("getSelected");
		if(null != row)
		{
		   window.location.href = "cadreArchive!beforeUpdateCadreArchive.action?ca.id="+row.id;
		}
		else{
			$.messager.alert('提示','您好请选择一条记录!');  
		}
		
		
	}
	
	function toDelete()
	{
		var row = $("#dg").datagrid("getSelected");
		var results = null;
		if(null != row)
		{
			var id = row.id;
			results=$.ajax({ type: "POST",//http请求方式  
                url: "cadreArchive!deleteCadreArchive.action",    //服务器段url地址  
                data:{'ca.id':id},      //发送给服务器段的数据  
                dataType: "text", //告诉JQuery返回的数据格式  
                async: false      		
        	}).responseText;
			
        	if (results == "success")
        	{
        		$.messager.alert("提示","删除成功" , "info", function(){
        			$("#dg").datagrid("reload");
        		});
        	}
        	else{
        		$.messager.alert("提示","删除失败","info");
        		console.log(results);
        	}
		}
		else{
			$.messager.alert('提示','您好请选择一条记录!');  
		}
		
	}
	$(function(){	
		$("#wa").combobox({
			url:'workArchive!queryWorkArchives.action',
			valueField:'id',
			textField:'wname',
			multiple:false
		});
		
		$("#dg").datagrid({
			url:'cadreArchive!queryWorkArchive.action',
			rownumbers:true,
			title:'干部廉政档案  列表',
			toolbar:"#toolbar",
			pagination:true,
			fitColumns:true,
			singleSelect:true,
			onDblClickRow:function(rowIndex,rowData){
				var row = $("#dg").datagrid("getSelected");
				if(null != row)
				{
				   window.location.href = "cadreArchive!getCadreArchive.action?ca.id="+row.id;
				}
			}
		});
	});
	
	function searchTB()
	{
		
		var obj = {
				"ca.cname":$("#ccname").val(),
				"ca.waid":$("#wa").combobox("getValue")
		};
		$('#dg').datagrid({
			url:"cadreArchive!queryWorkArchive.action",
			queryParams:obj

		});

	} 
	
	function formatterSex(val){
		if(val==0){
			return '女';
		}
		if(val==1){
			return '男';
		}
	}
	
	function formatterDate(val){
		
		if(val!=null&&val.length>10){
			return val.substring(0,10);
		}
		
		
	}
	
	
</script>
</head>
<body>

<table id="dg" >  
    <thead>  
        <tr>  
            <th data-options="field:'cname',width:80">姓名</th>  
            <th data-options="field:'csex',width:60" formatter="formatterSex">性别</th>  
            <th data-options="field:'cbirthday',width:80" formatter="formatterDate">出生日期</th>
            <th data-options="field:'nativeplace',width:100">籍贯</th>
            <th data-options="field:'major',width:100">职称</th>
            <th data-options="field:'nation',width:80">民族</th>
            <th data-options="field:'education',width:80">学历</th>
            <th data-options="field:'joinparty',width:80" formatter="formatterDate">入党时间</th> 
            <th data-options="field:'worktime',width:80" formatter="formatterDate">参加工作时间</th> 
            <th data-options="field:'phone',width:80">电话</th> 
        </tr>  
      </thead>  
       
</table>
<div id="toolbar"  style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
       <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="toadd()">添加档案</a>  
       <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="toEdit()">修改档案</a>  
       <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="toDelete()">删除档案</a>
    </div>
    <div>  
       	姓名: <input  style="width:150px" name="ccname" id="ccname">
       	<c:if test="${user.defaultRole.roleName eq '纪委' }">
       		单位: <input id="wa" name="wa"/> 
        	<a href="javascript:searchTB()" class="easyui-linkbutton" iconCls="icon-search">查找</a>
        </c:if>  
    </div>  
</div>  

</body>
</html>