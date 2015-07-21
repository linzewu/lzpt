<%@ page language="java" contentType="text/html; charset=UTf-8"
    pageEncoding="UTf-8"%>


<table id="projectList" class="easyui-datagrid"   data-options="url:'/lzpt/project!getProjects.action',border:true,singleSelect:true,fit:true,fitColumns:true,queryParams:{'pro.year':'${param.year }','pro.unit':'${param.unit }'}">
	<thead>
		<tr>
			<th data-options="field:'projectType'" formatter="formatterProject" width="100">项目名称</th>
			<th data-options="field:'year'" width="30">年份</th>
			<th data-options="field:'unit'" width="30" formatter="unitFormatter">单位</th>
			<th data-options="field:'createTime'" width="60">上报时间</th>
			<th data-options="field:'createUser'" width="30">上报人</th>
			<th data-options="field:'isCheck'" width="30"  formatter="isCheckFormatter">是否已被审阅</th>
			<th data-options="field:'score'" width="30">得分</th>
		</tr>
	</thead>
</table>
