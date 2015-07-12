<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>单位廉政档案列表</title>

<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">

<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
	function toInfo() {
		var row = $("#dg").datagrid("getSelected");
		if(null != row)
		{
		   window.location.href = "workArchive!getWorkArchiveById.action?wa.id="+row.id;
		}else{
			$.messager.alert('提示','您好请选择一条记录!');  
		}
	}
	
	function toEdit()
	{
		var row = $("#dg").datagrid("getSelected");
		if(null != row)
		{
		   window.location.href = "workArchive!beforeUpdateWorkArchiveById.action?wa.id="+row.id;
		}else{
			$.messager.alert('提示','您好请选择一条记录!');  
		}
		
	}
	
	function toadd(){
		window.location.href="workArchive!toPage.action?pageName=addUnit";
		
	}
	
	function toDelete()
	{
		var row = $("#dg").datagrid("getSelected");
		var results = null;
		if(null != row)
		{
			var id = row.id;
			results=$.ajax({ type: "POST",//http请求方式  
                url: "workArchive!deleteWorkArchive.action",    //服务器段url地址  
                data:"wa.id="+id,      //发送给服务器段的数据  
                dataType: "text", //告诉JQuery返回的数据格式  
                async: false      		
        	}).responseText;	
        	if (results == "false")
        		{
        			alert("删除失败");
        		}
        	else
        		{
        			alert("删除成功");
        		}
        	$("#dg").datagrid("reload");
		}else{
			$.messager.alert('提示','您好请选择一条记录!');  
		}
	}
	
	$(function(){
		
		$("#dg").datagrid({
			url:'workArchive!queryWorkArchive.action',
			rownumbers:true,
			title:'单位机构廉政档案  列表',
			toolbar:"#toolbar",
			pagination:true,
			fitColumns:true,
			singleSelect:true,
			onDblClickRow:function(rowIndex,rowData){
				var row = $("#dg").datagrid("getSelected");
				if(null != row)
				{
				   window.location.href = "workArchive!getWorkArchiveById.action?wa.id="+row.id;
				}
			}

		});
	
	$('#ss').searchbox({   
		width:300,   
		prompt:'请输入单位名称',
		searcher:function(value,name){   
			var obj = {
					"wa.wname":value
			};
			$("#dg").datagrid({
				url:'workArchive!queryWorkArchive.action',
				queryParams:obj
			});

		}
		  
	}); 
});

</script>
</head>
<body>

	<table id="dg" >
		<thead>
			<tr>
				<th data-options="field:'wname',width:80">单位名称</th>
				<th data-options="field:'zipcode',width:80">单位编码</th>
				<th data-options="field:'address',width:160">单位地址</th>
				<th data-options="field:'principal',width:80">负责人</th>
				<th data-options="field:'phone',width:80">联系电话</th>
				<th data-options="field:'peoNum',width:80">单位人数</th>
			</tr>
		</thead>
	</table>
	<div id="toolbar" style="padding: 5px; height: auto">
		<div style="margin-bottom: 5px">
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="toadd()">添加档案</a> <a
				href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="toEdit()">修改档案</a> <a
				href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="toDelete()">删除档案</a>
		</div>
		<div>
			 <input id="ss"></input>  
		</div>
	</div>

</body>
</html>