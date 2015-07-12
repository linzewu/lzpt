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
<title>任务列表</title>

<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/task.css">

<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath }js/lzpt/task.js"></script>

<script type="text/javascript">

var workItem="${param.workItem }";

var workItems=${wis==""?"[]":wis};


</script>

</head>
<body type="list">
	<table id="dg" class="easyui-datagrid" data-options="rownumbers:true,title:'任务列表',onDblClickRow:toInfo,onSelect:initTool"
		toolbar="#toolbar" pagination="true" fitColumns="true" singleSelect="true" url="task!getTasks.action?task.workItem.id=${param.workItem }">
		<thead>
			<tr>
				<th data-options="field:'title',width:120">任务标题</th>
				<th data-options="field:'status',width:40,formatter:converStatus">任务状态</th>
<!-- 				<th data-options="field:'cycle',width:40">任务周期</th> -->
				<th data-options="field:'id',width:100,formatter:toRate">任务完成进度</th>
				<th data-options="field:'startDate',width:60">开始时间</th>
				<th data-options="field:'endDate',width:60">结束时间</th>
			</tr>
		</thead>
	</table>
	<div id="toolbar" style="padding: 5px; height: auto">
		<div style="margin-bottom: 5px">
			<a href="javascript:void(0)" id="add" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="toadd(); return false;">添加任务</a>
			<a href="javascript:void(0)" id="modify" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editTask()">修改任务</a>
		 	<a href="javascript:void(0)" id="setUnit" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="openUnits()">考核单位</a> 
			<a href="javascript:void(0)" id="pushTask" class="easyui-linkbutton" iconCls="icon-redo" plain="true" onclick="pushTask()">发布</a>
			<a href="javascript:void(0)" id="tps" class="easyui-linkbutton" iconCls="icon-tip" plain="true" onclick="rate()">完成情况</a>
			<a href="javascript:void(0)" id="del" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="toDelete()">删除任务</a>
		</div>
		<div>
			<input class="easyui-searchbox" data-options="prompt:'请输入单位名称'" style="width: 300px"></input>
		</div>
	</div>
	
	<div id="win" class="easyui-window" title="aa" style="width:700px;height:450px"  
        data-options="iconCls:'icon-save',modal:true,closed:true,maximizable:false,minimizable:false" >  
   		<table id="units" class="easyui-datagrid" url='workArchive!queryWorkArchives.action' rownumbers="true" title='单位列表'
			fitColumns="true" singleSelect="false" selectOnCheck="true" checkOnSelect="true" >
			<thead>
				<tr>
					<th data-options="field:'id',width:80,checkbox:true">单位名称</th>
					<th data-options="field:'wname',width:80">单位名称</th>
					<th data-options="field:'zipcode',width:80">单位编码</th>
					<th data-options="field:'address',width:160">单位地址</th>
					<th data-options="field:'principal',width:80">负责人</th>
					<th data-options="field:'phone',width:80">联系电话</th>
				</tr>
			</thead>
		</table>
		<div style="margin:10px 0px 10px 0px;text-align: center;">
			<a href="#" id="unitSave" class="easyui-linkbutton" onclick="javascript:saveTaskUnit();" data-options="iconCls:'icon-save'">保存</a> <a
				href="javascript:void(0)"  class="easyui-linkbutton" onclick="$('#win').window('close');" iconCls="icon-cancel">返回</a>
		</div>
	</div>
	
	<div id="taskProcessRate" class="easyui-window" title="任务完成情况" style="width:700px;height:350px"  
        data-options="modal:true,closed:true,maximizable:false,minimizable:false"   singleSelect="true">  
   		<table id="tpr" class="easyui-datagrid"  rownumbers="true"  singleSelect="true"   toolbar="#tb"
			fitColumns="true">
			<thead>
				<tr>
					<th data-options="field:'unit',width:160,formatter:function(unit){return unit.wname}">单位名称</th>
					<th data-options="field:'processState',width:60,formatter:convertState">状态</th>
					<th data-options="field:'id',width:60,formatter:convertLink">完成情况</th>
				</tr>
			</thead>
		</table>
		
		<div id="tb" style="padding: 5px; height: auto">
			<div style="margin-bottom: 5px">
				<a href="javascript:void(0)" id="but_score" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="score()">评分</a>
			</div>
		</div>
	</div> 
	
	<div id="score_win" class="easyui-window" title="任务完成情况" style="width:400px;height:180px"  
        data-options="modal:true,closed:true,maximizable:false,minimizable:false">
        <form action="" id="score_form">
	        <table>
	        	<tr>
	        		<td>分数</td>
	        		<td><input class="easyui-numberbox" data-options="min:0,precision:0,max:100" id="score"/></td>
	        	</tr>
	        	<tr>
	        		<td>备注</td>
	        		<td>
	        			<textarea style="width: 240px;height: 50px;" id="score_scoreRemark"></textarea>
	        		</td>
	        	</tr>
	        </table>
	        <div style="margin: 10px 0px 0px 100px;">
	        	<a href="javascript:void(0)"  id="save_score" class="easyui-linkbutton" iconCls="icon-save"  onclick="save_score()">评分</a>
	        </div>
	    </form>
	
	</div> 
	
	<div id="tpsInfo" class="easyui-window" title="任务完成情况" style="width:900px;height:450px"  
        data-options="modal:true,closed:true,maximizable:false,minimizable:false" >
        <iframe style="width: 880px;height: 410px" id="tpinfo" name="tpinfo" src=""></iframe>
	</div> 
	
</body>
</html>