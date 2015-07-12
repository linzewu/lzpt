<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div style="width: 100%;height: 90%;">
	<table id="projectType" class="easyui-datagrid"  data-options="onClickRow:ptClickRow,url:'/lzpt/project!getProjectType.action',border:false,singleSelect:true,fit:true,fitColumns:true,queryParams:{'pt.group':'${param.group}',}">
		<thead>
			<tr>
				<th data-options="field:'name'" width="100">请选择考核项目</th>
			</tr>
		</thead>
	</table>
</div>

<script>

var projectType;
var projectTypeId;

function ptClickRow(index,row){
	
	projectType=row.name;
	projectTypeId=row.id;
	
	$("body").layout("panel","center").panel("refresh","plist.jsp");
	
}
 </script>
