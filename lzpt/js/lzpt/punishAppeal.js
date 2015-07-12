var url;
function newPunishAppeal() {
	$('#dlg').dialog('open').dialog('setTitle', '添加惩罚诉求');
	$('#fm').form('clear');
	url = 'punishAppeal!addPunishAppeal.action';
}
function editPunishAppeal() {
	var row = $('#dg').datagrid('getSelected');
	
	if (row) {
		$('#dlg').dialog('open').dialog('setTitle', '修改惩罚诉求');
		
		var row_={};
		
		$.each(row,function(i,n){
			row_["pa."+i]=n;
		});
		//加载单位
		var ea1 = 
			$.ajax({ type: "POST",//http请求方式  
            url: "punishAppeal!getWaidById.action",    //服务器段url地址  
            data:"pa.id="+row.id,      //发送给服务器段的数据  
            dataType: "text", //告诉JQuery返回的数据格式  
            async: false
			}).responseText;
		$("#pwaid").combobox("select",ea1);
		 
		$('#fm').form('load', row_);
		url = 'punishAppeal!modifyPunishAppeal.action?pa.id=' + row.id+"&pa.createTime="+row.createTime;
	}
}
function savePunishAppeal() {
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

function deletePunishAppeal()
{
var row = $('#dg').datagrid('getSelected');
	
	if (row) {

		if(confirm("确定要删除该惩罚诉求？"))
		{
			var row_={};
			
			$.each(row,function(i,n){
				row_["pa."+i]=n;
			});
			
			
			var ea1 = 
				$.ajax({ type: "POST",//http请求方式  
	            url: "punishAppeal!deletePunishAppeal.action",    //服务器段url地址  
	            data:"pa.id="+row.id,      //发送给服务器段的数据  
	            dataType: "text", //告诉JQuery返回的数据格式  
	            async: false
				}).responseText;
			
			if ("success" == ea1)
			{
				$('#dg').datagrid('reload'); 
			}
			else
			{
				alert("删除失败！");
			}
		}
		
	}
}

function searchTB()
{
	
	var obj = {
			"pa.ptitle":$("#lptitle").val()
	};
	$('#dg').datagrid({
		url:"punishAppeal!queryPunishAppeal.action",
		queryParams:obj
	});

} 