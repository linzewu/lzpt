<%@ page language="java" contentType="text/html; charset=UTf-8"
	import="java.util.UUID"
    pageEncoding="UTf-8"%>
<%
String tid=UUID.randomUUID().toString();
%>
<script type="text/javascript">

var isreolad=true;

function loadData(data){
	
	var tid='<%=tid%>';
	var sumScore=0;
	$.each(data.rows,function(i,n){
		sumScore+=n.score;
	});
	
	$.each(data.rows,function(j,d){
		$.each(projectTypes,function(i,n){
			if(n.id==d.projectType){
				d.group=n.group;
			}
		})
	});
	
	if(isreolad){
		isreolad=false;
		$('#'+tid).datagrid("loadData",data);
		$('#'+tid).datagrid('reloadFooter',[{createUser: '合计', score: sumScore.toFixed(2)}]);
		
	}
	
	
	

	
}

function group(value,rows){
	var title;
	$.each(groupConfig,function(key,data){
		if(key==value){
			title=data;
			return false;
		}
	});
	
    return title;
}

</script>

<table id="<%=tid %>" class="easyui-datagrid" data-options="url:'/lzpt/project!getProjects.action',border:true,singleSelect:true,fit:true,fitColumns:true,queryParams:{'pro.year':'${param.year }','pro.unit':'${param.unit }'}, rownumbers: true, showFooter: true,onLoadSuccess:loadData,  groupField:'group',
                groupFormatter:group,view:groupview">
	<thead>
		<tr>
			<th data-options="field:'projectType'" formatter="formatterProject" width="100">项目名称</th>
			<th data-options="field:'year'" width="30">年份</th>
			<th data-options="field:'unit'" width="30" formatter="unitFormatter">单位</th>
			<th data-options="field:'createTime'" width="60">上报时间</th>
			<th data-options="field:'isCheck'" width="30"  formatter="isCheckFormatter">是否已被审阅</th>
			<th data-options="field:'createUser'" width="30">上报人</th>
			<th data-options="field:'score'" width="30">得分</th>
		</tr>
	</thead>
</table>
