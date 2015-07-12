var url;
function newUser() {
	
	$(function(){
		
		$("#unitId").combobox({
			url:"workArchive!queryWorkArchives.action",
			valueField:"id" ,
			textField:"wname",
			editable:false,
			missingMessage:"请选择单位",
			required:false
		});
	});
	
	$('#dlg').dialog('open').dialog('setTitle', '添加用户');
	$("#userName").removeAttr("readonly");
	$('#fm').form('clear');
	url = 'user!addUser.action'; 
}


function editUser() {
	var row = $('#dg').datagrid('getSelected');
	if (row) {
		
		$("#unitId").combobox({
			url:"workArchive!queryWorkArchives.action",
			valueField:"id" ,
			textField:"wname",
			editable:false,
			missingMessage:"请选择单位",
			required:false
		});
		
		$('#dlg').dialog('open').dialog('setTitle', '修改用户信息');
		$('#fm').form('load', row);
		
//		alert(JSON.stringify(row));
		
		$("#userName").attr("readonly","readonly");
		
		$.each(row,function(i,n){
			if(i=="name"){
				$("#name").val(n);
			}
			
//			alert(i);
			
			
			if(i=="userName"){
				$("#userName").val(n);
			}
			if(i=="password"){
				$("#password").val(n);
			}
			if(i=="roles"){
				var vs=[];
				$.each(n,function(x,y){
					
					
					if(y.roleName=="乡镇单位管理员"){
						
						$("#unitId").combobox({
							url:"workArchive!queryWorkArchives.action",
							valueField:"id" ,
							textField:"wname",
							editable:false,
							missingMessage:"请选择单位",
							required:true
						});
						
					}
					
					vs.push(n[x].id);
				});
				
				$("#roles").combobox("setValues",vs);
			}
			
			if(i=="unitId"){
				$("#unitId").combobox("setValue",n);
				
				//$("#unitId").val(n);
			}
		});
		
		url = 'user!modifyUser.action?user.id=' + row.id;
	}
}
function saveUser() {
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

/**
 * 格式化显示
 * @param value
 * @param row
 * @param index
 * @returns {String}
 */
function  formatterRole(value,row,index){
	
	var roleName="";
	
	$.each(value,function(i,n){
		roleName+=value[i].roleName+",";
	});
	if(roleName.length>0){
		roleName = roleName.substring(0, roleName.length-1);
	}
	return roleName;
}



$(function(){
	$("#dg").datagrid({
		url:'user!queryUsers.action',
		rownumbers:true,
		title:'用户列表',
		toolbar:"#toolbar",
		pagination:true,
		fitColumns:true,
		singleSelect:true
		
	});	
});

$.extend($.fn.validatebox.defaults.rules, {
    valUniquel: {
        validator: function(value){
        	var results = "false";
        	var row = $('#dg').datagrid('getSelected');        	
        	var id = null;
        	if (null != row)
        	{
        		id = row.userName;
        	}
        	
        	if (null == row || '' == row || id != value)
        	{
	        	results=$.ajax({ type: "POST",//http请求方式  
	                url: "user!validateUser.action",    //服务器段url地址  
	                data:"user.userName="+value,      //发送给服务器段的数据  
	                dataType: "text", //告诉JQuery返回的数据格式  
	                async: false      		
	        	}).responseText;	
	        	if (results == "false")
	        		{
	        			return false;
	        		}
	        	else
	        		{
	        			return true;
	        		}
        	}
        	else
        	{
        		return true;
        	}

        },
        message: '该用户名已经存在'
    }
});

function searchTB()
{
	
	var obj = {
			"user.name":$("#uname").val()
	};
	$('#dg').datagrid({
		url:"user!queryUsers.action",
		queryParams:obj
	});

} 