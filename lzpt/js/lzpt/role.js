var url;
function newRole() {
	$('#dlg').dialog('open').dialog('setTitle', '添加用户');
	$('#fm').form('clear');
	url = 'role!addRole.action';
}
function editRole() {
	var row = $('#dg').datagrid('getSelected');
	
	if (row) {
		$('#dlg').dialog('open').dialog('setTitle', '修改用户信息');
		
		var row_={};
		
		$.each(row,function(i,n){
			row_["role."+i]=n;
		});
		 
		$('#fm').form('load', row_);
		url = 'role!modifyRole.action?role.id=' + row.id;
	}
}
function saveRole() {
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