var url;
function newSearchWay() {
	$('#dlg').dialog('open').dialog('setTitle', '添加搜索方式信息');
	$('#fm').form('clear');
	url = 'searchWay!addSearchWay.action';
}
function editSearchWay() {
	var row = $('#dg').datagrid('getSelected');
	
	if (row) {
		$('#dlg').dialog('open').dialog('setTitle', '修改搜索方式信息');
		
		var row_={};
		
		$.each(row,function(i,n){
			row_["sw."+i]=n;
		});
		 
		$('#fm').form('load', row_);
		
		url = 'searchWay!updateSearchWay.action?sw.id=' + row.id+"&sw.createTime="+row.createTime;
	}
}
function saveSearchWay() {
	$('#fm').form('submit', {
		url : url,
		onSubmit : function() {
			return $(this).form('validate');
		},
		success : function(result) {
			if('succeed'==result){
				$('#dlg').dialog('close'); 
				$('#dg').datagrid('reload'); 
			}
			else{
				$.messager.show({
					title : '错误！',
					msg : "保存出错，请联系管理员！"
				});
			}
		}
	});
}