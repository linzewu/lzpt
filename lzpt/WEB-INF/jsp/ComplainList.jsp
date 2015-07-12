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
	function toadd(){
		window.location.href="baseManager!ComplainAdd!toPage.action";
	}
	function toedit(tid){
		var row = $('#'+tid).datagrid("getSelected");
		if(null!=row){
			window.location.href = "baseManager!ComplainProcess!toPage.action?be.id="+row['be.id'];
		}else{
			$.messager.alert("提示","请选择需要处理的案件","warning");
		}
	}
	
	function del(tid){
		var row = $('#'+tid).datagrid("getSelected");
		if(row!=null){
			delBaseEntity("Complain", row['be.id'], function(){
				$('#'+tid).datagrid("reload");
			});
		}else{
			$.messager.alert("提示","请选择需要删除的案件","warning");
		}
	}
	
	function dbclick(rowIndex,rowData){
		var row = $(this).datagrid("getSelected");
		if(null != row)
		{
		   window.location.href = "baseManager!ComplainInfo!toPage.action?be.id="+row['be.id'];
		}
	}
	
	function levelFormatter(value){
		return  getLabelByid("jobLevel", value)
	}
	function complainTypeFormatter(value){
		return  getLabelByid("complainType", value);
	}
</script>
</head>
<body>


<div id="tt" class="easyui-tabs"  data-options="onSelect:tabOnSelect">
    <div title="未处理案件"  style="padding:10px;">
    	<input value="false"  type="hidden" name="isInit"  tableId="noProcess">
	    <table id="noProcess"   data-options="url:'baseManager!!getBaseEntityList.action?be.actionType=Complain&be.queryType=ComplainCriterion&be.state=0',
				rownumbers:true,
				toolbar:'#toolbar',
				pagination:true,
				fitColumns:true,
				singleSelect:true,
				onDblClickRow:dbclick">  
	   	<thead>  
	        <tr>  
	            <th data-options="field:'be.name',width:80">被举报人姓名</th>  
	            <th data-options="field:'be.level',width:60"   formatter="levelFormatter">级别</th>  
	            <th data-options="field:'be.unitName',width:100" >单位</th>
	            <th data-options="field:'be.duties',width:80">职务</th>
	            <th data-options="field:'be.complainType',width:80" formatter="complainTypeFormatter">问题类别</th>
	        </tr>  
	      </thead>  
		</table>
		<div id="toolbar"  style="padding:5px;height:auto">
			<div style="margin-bottom:5px">
				<%if("廉政监督员".equals(roleName)) {%>
			       <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="toadd()">添加举报事件</a> 
			       <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="del('noProcess')">删除举报事件</a>
		       <%} %>
		       
		       <%if("纪委".equals(roleName)||"纪委工作人员".equals(roleName) ) {%>
			       <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="toedit('noProcess')">处理案件</a> 
		       <%} %>
		       
		    </div>
		</div>
    </div>
    <div title="处理中案件"  style="overflow:auto;padding:10px;">
    	<input value="false"  type="hidden" name="isInit"  tableId="processing">
      <table id="processing"   data-options="url:'baseManager!!getBaseEntityList.action?be.actionType=Complain&be.queryType=ComplainCriterion&be.state=1',
			rownumbers:true,
			pagination:true,
			fitColumns:true,
			toolbar:'#toolbar2',
			singleSelect:true,
			onDblClickRow:dbclick">  
	    <thead>
	        <tr>  
	            <th data-options="field:'be.name',width:80">被举报人姓名</th>  
	            <th data-options="field:'be.level',width:60"   formatter="levelFormatter">级别</th>  
	            <th data-options="field:'be.unitName',width:100" >单位</th>
	            <th data-options="field:'be.duties',width:80">职务</th>
	            <th data-options="field:'be.complainType',width:80" formatter="complainTypeFormatter">问题类别</th>
	        </tr>  
	      </thead>  
	</table>
	<div id="toolbar2"  style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
		<%if("廉政监督员".equals(roleName)) {%>
	       <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="toadd()">添加举报事件</a> 
	     <%} %>
	     
	      <%if("纪委".equals(roleName)||"纪委工作人员".equals(roleName) ) {%>
			  <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="toedit('processing')">处理案件</a> 
		  <%} %>
	    </div>
	</div>
    </div>
    <div title="已处理案件"  style="padding:10px;">
    	<input value="false"  type="hidden" name="isInit"  tableId="processed">
    	<table id="processed"   data-options="url:'baseManager!!getBaseEntityList.action?be.actionType=Complain&be.queryType=ComplainCriterion&be.state=2,3',
			rownumbers:true,
			pagination:true,
			fitColumns:true,
			toolbar:'#toolbar3',
			singleSelect:true,
			onDblClickRow:dbclick">  
	    <thead>  
	        <tr>  
	            <th data-options="field:'be.name',width:80">被举报人姓名</th>  
	            <th data-options="field:'be.level',width:60"   formatter="levelFormatter">级别</th>  
	            <th data-options="field:'be.unitName',width:100" >单位</th>
	            <th data-options="field:'be.duties',width:80">职务</th>
	            <th data-options="field:'be.complainType',width:80" formatter="complainTypeFormatter">问题类别</th>
	        </tr>  
	      </thead>  
	</table>
	<div id="toolbar3"  style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
	       <%if("廉政监督员".equals(roleName)) {%>
	       <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="toadd()">添加举报事件</a> 
	     <%} %> 
	    </div>
	</div> 
    </div>
</div>
</body>
</html>