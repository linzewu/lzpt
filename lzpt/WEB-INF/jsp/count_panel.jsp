<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>统计面板</title>

<link rel="stylesheet" type="text/css" href="${basePath}js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">

<script type="text/javascript" src="${basePath}js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath}js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath}js/json2.js"></script>

<style type="text/css">
.c-panel {
	float: left;
	margin: 6px;
}
</style>

<script type="text/javascript">
function toPage(index,rowData){
}

</script>

</head>
<body>
	<div style="margin: 0 auto; width: 1000px;">
		<div class="c-panel">
			<div id="p3" class="easyui-panel" title="最新上报任务 top10"
				style="width: 450px; height: 240px; background: #fafafa;" data-options="">
				
				<table class="easyui-datagrid" style="width: 448px; height: 212px"
					data-options="url:'c_panel!getProcessTaskTop_n.action',fitColumns:true,singleSelect:true">
					<thead>
						<tr>
							<th data-options="field:'processTitle',width:80">标题</th>
							<!-- <th data-options="field:'id',width:20,align:'right'">详细</th> -->
						</tr>
					</thead>
				</table>
				
				</div>
		</div>
		<%-- <div class="c-panel">
			<div id="p4" class="easyui-panel" title="待评分任务"
				style="width: 450px; height: 240px; background: #fafafa;" data-options="">
				
				<table class="easyui-datagrid" style="width: 448px; height: 212px"
					data-options="url:'c_panel!getTaskProcessByState.action?processState=1',fitColumns:true,singleSelect:true">
					<thead>
						<tr>
							<th data-options="field:'processTitle',width:80">标题</th>
							<th data-options="field:'id',width:20,align:'right'">详细</th>
						</tr>
					</thead>
				</table>
				</div>
		</div>  --%>
		<div class="c-panel">
			<div id="p1" class="easyui-panel" title="近两周过期任务"
				style="width: 450px; height: 240px;background: #fafafa;" data-options="">
				<table class="easyui-datagrid" style="width: 448px; height: 212px"
					data-options="url:'c_panel!getOverdueTask.action?type=0',fitColumns:true,singleSelect:true">
					<thead>
						<tr>
							<th data-options="field:'title',width:80">标题</th>
							<!-- <th data-options="field:'id',width:20,align:'right'">详细</th> -->
						</tr>
					</thead>
				</table>
			</div>
		</div>
		<div class="c-panel">
			<div id="p2" class="easyui-panel" title="近两周终止任务"
				style="width: 450px; height: 240px; background: #fafafa;" >
				<table class="easyui-datagrid" style="width: 448px; height: 212px" 
					data-options="url:'c_panel!getOverdueTask.action?type=1',fitColumns:true,singleSelect:true,onDblClickRow:toPage">
					<thead>
						<tr>
							<th data-options="field:'title',width:80">标题</th>
							<!-- <th data-options="field:'id',width:20,align:'right'">详细</th> -->
						</tr>
					</thead>
				</table>
					
			</div>
		</div>
	</div>
</body>
</html>