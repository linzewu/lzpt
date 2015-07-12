var url;
function newKeyWordsConfig() {
	$('#dlg').dialog('open').dialog('setTitle', '添加关键字信息');
	$('#fm').form('clear');
	url = 'keyWordsConfig!addKeyWordsConfig.action';
}
function editKeyWordsConfig() {
	var row = $('#dg').datagrid('getSelected');
	
	if (row) {
		$('#dlg').dialog('open').dialog('setTitle', '修改关键字信息');
		
		var row_={};
		
		$.each(row,function(i,n){
			row_["kw."+i]=n;
			
			if(i=="swList"){
				var vs=[];
				$.each(n,function(x,y){
					vs.push(n[x].id);
				});
				
				$("#swid").combobox("setValues",vs);
			}
		});
		 
		$('#fm').form('load', row_);
		
		url = 'keyWordsConfig!updateKeyWordsConfig.action?kw.id=' + row.id+"&kw.createTime="+row.createTime;
	}
}
function saveKeyWordsConfig() {
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

function deleteKeyWordsConfig()
{
	if(confirm("你确定要删除该关键字吗？"))
	{
		var row = $('#dg').datagrid('getSelected');
		var result = $.ajax({ type: "POST",//http请求方式  
            url: "keyWordsConfig!deleteKeyWordsConfig.action",    //服务器段url地址  
            data:"kw.id="+row.id,      //发送给服务器段的数据  
            dataType: "text", //告诉JQuery返回的数据格式  
            async: false      		
    	}).responseText;	
		
		
		if ("success" == result)
		{
			$('#dg').datagrid('reload'); 
		}
		else
		{
			alert("删除失败！");
		}
	}
}
