<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div style="width: 100%;height: 90%;">
	 <div id="proTab" class="easyui-tabs"  style="height:480px">
	 <div title="项目列表" >
		<table id="projectList" class="easyui-datagrid"   data-options="onDblClickRow:pClickRow,url:'/lzpt/project!getProjects.action',border:true,singleSelect:true,fit:true,fitColumns:true,queryParams:{'pro.projectType':projectTypeId},footer:'#ft',toolbar:'#tb'">
			<thead>
				<tr>
					<th data-options="field:'year'" width="100">年份</th>
					<th data-options="field:'unit'" width="100" formatter="unitFormatter">单位</th>
					<th data-options="field:'createTime'" width="100">上报时间</th>
					<th data-options="field:'createUser'" width="100">上报人</th>
					<th data-options="field:'isCheck'" width="100"  formatter="isCheckFormatter">是否已被审阅</th>
					<th data-options="field:'score'" width="100">得分</th>
				</tr>
			</thead>
		</table>
		</div>
	</div>
</div>
  <div id="ft" style="padding:2px 5px;">
       <!--  <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="toAdd()">添加</a> -->
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="toEidt()">修改</a>
<!--         <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="toDel()">删除</a> -->
 </div>
 <div id="tb" style="padding:2px 5px;">
                            年份: <input id="year" class="easyui-combobox" panelHeight="auto" style="width:100px" />
                            单位: 
        <input id="unit" class="easyui-combobox" panelHeight="auto" style="width:100px" data-options="data:units"   valueField="id" textField="wname" />
        <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="queryProject()">查询</a>
 </div>
<script>


var pid=null;

var score=null;



$(function(){
	$("#projectList").datagrid({
		title:projectType
	});
	
	$("#year").combobox({
		valueField: 'label',
		textField: 'value',
		data:years
	});
});

function queryProject(){
	
	var params={'pro.projectType':projectTypeId}
	
	var year = $("#year").combobox("getValue");
	
	if(year!=""){
		params['pro.year']=year
	}
	
	var unit = $("#unit").combobox("getValue");
	
	if(unit!=""){
		params['pro.unit']=unit
	}
	
	$("#projectList").datagrid("reload",params);
}


function toAdd(){
	var tabName=projectType;
	var isAdd = !$("#proTab").tabs("exists",tabName);
	pid=null;
	if(isAdd){
		$("#proTab").tabs('add',{
			title: tabName,
			selected: true,
			closable:true,
			href:projectPage
		});
		
	}else{
		$("#proTab").tabs("select",tabName);
		var tab = $('#proTab').tabs('getSelected');
		tab.panel('refresh');
	}
}

function toEidt(){
	
	var row = $("#projectList").datagrid("getSelected");
	if(!row){
		$.messager.alert("提醒","请选择一个项目进行修改。");
		return ;
	}
	initEidt(row)
}

function initEidt(data){
	
	pid=data.id;
	
	var tabName=projectType;
	var isAdd = !$("#proTab").tabs("exists",tabName);
	if(isAdd){
		$("#proTab").tabs('add',{
			title: tabName,
			selected: true,
			closable:true,
			href:projectPage
		})
	}else{
		$("#proTab").tabs("select",tabName);
		var tab = $('#proTab').tabs('getSelected');
		tab.panel('refresh');
	}
}

function pClickRow(index,row){
	initEidt(row);
}

function toDel(){
	var row = $("#projectList").datagrid("getSelected");
	if(!row){
		$.messager.alert("提醒","请选择项目。");
		return ;
	}else{
		$.messager.confirm('确认', '您确认要删除该数据。', function(r){
			if (r){
				var url="project!delProject.action";
				var queryParam={};
				queryParam['pro.id']=row.id;
				$.post(url,queryParam,function(data){
					if(data.success){
						$.messager.alert("提示","删除成功");
						$("#projectList").datagrid("reload");
					}
				});
			}
		});
	}
}
 </script>
