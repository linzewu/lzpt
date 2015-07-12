var url;
/**
function newEncourage() {
	$('#dlg').dialog('open').dialog('setTitle', '添加奖励诉求');
	$('#fm').form('clear');
	url = 'encourageAppeal!addEncourageAppeal.action';
}
function editEncourage() {
	var row = $('#dg').datagrid('getSelected');
	
	if (row) {
		$('#dlg').dialog('open').dialog('setTitle', '修改奖励诉求');
		
		var row_={};
		
		$.each(row,function(i,n){
			row_["ea."+i]=n;
		});
		//加载单位
		var ea1 = 
			$.ajax({ type: "POST",//http请求方式  
            url: "encourageAppeal!getWaidById.action",    //服务器段url地址  
            data:"ea.id="+row.id,      //发送给服务器段的数据  
            dataType: "text", //告诉JQuery返回的数据格式  
            async: false
			}).responseText;
		$("#ewaid").combobox("select",ea1);
		 
		$('#fm').form('load', row_);
		url = 'encourageAppeal!modifyEncourageAppeal.action?ea.id=' + row.id+"&ea.createTime="+row.createTime;
	}
}
function saveEncourage() {
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
**/
function saveEncourage1(isPush) {
	$('#fm').form('submit', {
		onSubmit : function() {
			if(isPush){
				$("#status").val(1);
			}
			
			return $(this).form('validate');
		},
		success :function(result) {
			if ('succeed' == result) {
				
				window.location.href="encourageAppeal!toPage.action?pageName=list";
				
			} else {
				$.messager.show({
					title : '错误！',
					msg : "保存出错！"
				});

			}
		}
	});
}

function saveEncourage2(isPush) {
	$('#fm').form('submit', {
		onSubmit : function() {
			if(isPush){
				$("#status").val(1);
			}
			
			return $(this).form('validate');
		},
		success :function(result) {
			if ('succeed' == result) {
				
				window.location.href="encourageAppeal!toPage.action?pageName=list1";
				
			} else {
				$.messager.show({
					title : '错误！',
					msg : "保存出错！"
				});

			}
		}
	});
}

function deleteEncourage()
{
var row = $('#dg').datagrid('getSelected');
	
	if (row) {

		if(confirm("确定要删除该奖励诉求？"))
		{
			var row_={};
			
			$.each(row,function(i,n){
				row_["ea."+i]=n;
			});
			
			
			var ea1 = 
				$.ajax({ type: "POST",//http请求方式  
	            url: "encourageAppeal!deleteEncourageAppeal.action",    //服务器段url地址  
	            data:"ea.id="+row.id,      //发送给服务器段的数据  
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

function searchTB(rol,ety)
{
	
	var obj = {
			"ea.etitle":$("#letitle").val(),
			"ea.state":rol,
			"ea.etype":ety
	};
	$('#dg').datagrid({
		url:"encourageAppeal!queryEncourageAppeal.action",
		queryParams:obj
	});

} 

function toInfo(index,data) {
	window.location.href="encourageAppeal!getEncourageAppealById.action?reqUrl=toinfo&ea.id="+data.id;
}

function toEdit() {
	var row = $('#dg').datagrid('getSelected');
	if (row) {
	window.location.href="encourageAppeal!getEncourageAppealById.action?reqUrl=tomodify&ea.id="+row.id;
	}
}

function toadd() {
	window.location.href = "encourageAppeal!toPage.action?pageName=toadd";
}

function toadd1() {
	window.location.href = "encourageAppeal!toPage.action?pageName=toadd1";
}


function pushEncourageAppeal(){
	
	var taskId=$("#dg").datagrid("getSelected").id;
	$.ajax({
		type : "POST",
		url : "encourageAppeal!pushEncourageAppeal.action",
		data : {'ea.state':1,"ea.id":taskId},
		success : function(msg) {
			if(msg=="success"){
				$("#dg").datagrid("reload");
				$.messager.alert("提示","发布成功");
			}
			if(msg=="error"){
				$.messager.alert("提示","发布失败");
			}
		}
	});
	
}

function EncourageAppealtotal(){
	var tot = $("#scores").val();
	$.ajax({
		type : "POST",
		url : "encourageAppeal!modifyEncourageAppealtotal.action",
		data : {'ea.escores':tot,"ea.id":$("#eaid").val()},
		success : function(msg) {
			if(msg=="success"){
				
				$.messager.alert("提示","评分成功");
			}
			if(msg=="error"){
				$.messager.alert("提示","评分失败");
			}
		}
	});
	
}

function converStatus(state){
	
	if(state!=null){
		if(state==0){
			return "<lable class='A0'>未发布</lable>";
		}
		
		if(state==1){
			return "<lable class='A1'>已发布</lable>";
		}
	}
	
	return state;
}

function initTool(rowIndex, rowData){
	
	if(rowData.state==0){
		$("#modifytool").linkbutton("enable");
		$("#pushTask").linkbutton("enable");
		$("#deltool").linkbutton("enable");
	}
	else{
		$("#modifytool").linkbutton("disable");
		$("#pushTask").linkbutton("disable");
		$("#deltool").linkbutton("disable");
	}
}