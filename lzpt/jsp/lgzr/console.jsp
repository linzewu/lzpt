<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
function startProject(state){
	
	var year=$("#year").combobox("getValue");
	
	if(year==""){
		$.messager.alert("警告","请选择"+(state==0?"开启":"关闭")+"考核项目的年份");
		return ;
	}
	$.messager.progress({"title":"提示","msg":"全力处理中。"});
	$.messager.confirm("确认","您确认"+(state==0?"开启":"关闭")+year+"年年度考核项目",function(r){
	    if (r){
	    	$.post("project!saveProjectConsole.action",{"pc.year":year,"pc.state":state},function(data){
	    		if(data.success){
	    			$.messager.progress("close");
	    			$.messager.alert("提示",year+"年度项目"+(state==0?"开启":"关闭")+"成功");
	    			$("#consoleList").datagrid("reload");
	    		}
	    	});
	    }
	})
}

function stateFormatter(value,row,index){
	
	return value==0?"开启":"关闭";
}

</script>
<div>
	<label>年份</label><input id="year" class="easyui-combobox" data-options="valueField: 'label',textField: 'value',data:years"/>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-large-smartart'"
        onclick="javascript:startProject('0')">开启</a>
    	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
        onclick="javascript:startProject('1')">关闭</a>
</div>
<table id="consoleList" style="width:700px;height:250px" class="easyui-datagrid"   data-options="url:'/lzpt/project!getConsoleList.action',border:true,singleSelect:true,fit:true,fitColumns:true">
	<thead>
		<tr>
			<th data-options="field:'year'" width="100">年份</th>
			<th data-options="field:'state'" width="100" formatter="stateFormatter">状态</th>
		</tr>
	</thead>
</table>