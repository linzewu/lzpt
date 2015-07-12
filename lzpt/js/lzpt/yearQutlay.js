var url;
function saveYearOutlay(isPush) {
	$('#fm').form('submit', {
		onSubmit : function() {
			if(isPush){
				$("#state").val(1);
			}
			
			return $(this).form('validate');
		},
		success :function(result) {
			if ('success' == result) {
				
				window.location.href="yearOutlay!toPage.action?pageName=list";
				
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
				
				window.location.href="yearOutlay!toPage.action?pageName=list1";
				
			} else {
				$.messager.show({
					title : '错误！',
					msg : "保存出错！"
				});

			}
		}
	});
}

function deleteyearOutlay()
{
var row = $('#dg').datagrid('getSelected');
	
	if (row) {

		if(confirm("确定要删除该年度经费信息？"))
		{
			var row_={};
			
			$.each(row,function(i,n){
				row_["yo."+i]=n;
			});
			
			
			var ea1 = 
				$.ajax({ type: "POST",//http请求方式  
	            url: "yearOutlay!deleteYearOutlay.action",    //服务器段url地址  
	            data:"yo.id="+row.id,      //发送给服务器段的数据  
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

function searchTB(rol)
{
	
	var waid = "";
	if (null == rol || "" == rol)
	{
		waid = $("#workArchives1").combobox("getValue");
	}
	else
	{
		waid = $("#workid").val();
	}
	
    
	var obj = {
			"yo.yoyear":$("#lyoyear").combobox("getValue") == ''?0:$("#lyoyear").combobox("getValue"),
			"uname":rol,
			"yo.wa.id":waid
	};
	$('#dg').datagrid({
		url:"yearOutlay!queryYearOutlays.action",
		queryParams:obj
	});

} 

function toInfo(index,data) {
	window.location.href="yearOutlay!getYearOutlayById.action?reqUrl=toinfo&yo.id="+data.id;
}

function toEdit() {
	var row = $('#dg').datagrid('getSelected');
	if (row) {
	window.location.href="yearOutlay!getYearOutlayById.action?reqUrl=tomodify&yo.id="+row.id;
	}
}

function toadd() {
	window.location.href = "yearOutlay!toPage.action?pageName=toadd";
}

function toadd1() {
	window.location.href = "encourageAppeal!toPage.action?pageName=toadd1";
}


function pushyearOutlay(){
	
	var taskId=$("#dg").datagrid("getSelected").id;
	$.ajax({
		type : "POST",
		url : "yearOutlay!pushYearOutlay.action",
		data : {'yo.state':1,"yo.id":taskId},
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
		url : "yearOutlay!modifyEncourageAppealtotal.action",
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
		//$("#modifytool").linkbutton("disable");
		$("#pushTask").linkbutton("disable");
		$("#deltool").linkbutton("disable");
	}
}

function sum1(value,row,index)
{
	
	var sum = row.b1 + row.b2 + row.b3 ;
	
	return sum.toFixed(2);
}
function sum2(value,row,index)
{
	
	var sum = row.b4 + row.b5 + row.b6 ;
	
	return sum.toFixed(2);
}

function minus1(value,row,index)
{
	var s11 = row.b1 + row.b2 + row.b3 ;
	var s22 = row.b4 + row.b5 + row.b6 ;
	var sum = s11 - s22;
	
	if (sum > 0){
		return "<label style='color: green;'>"+sum.toFixed(2)+"↓</label>";
	}else{
		sum = sum * (-1);
		return "<label style='color: red;'>"+sum.toFixed(2)+"↑</label>";
	}
		
	return sum;
}


function searchTB1(rol)
{
	
	var waid = "";
	if (null == rol || "" == rol)
	{
		waid = $("#workArchives1").combobox("getValue");
	}
	else
	{
		waid = $("#workid").val(); //↑↓
	}
	
    
	var obj = {
			"year1":$("#lyoyear").combobox("getValue") == ''?0:$("#lyoyear").combobox("getValue"),
			"year2":$("#lyoyear1").combobox("getValue") == ''?0:$("#lyoyear1").combobox("getValue"),
			"uname":rol,
			"waid":waid
	};
	$('#dg1').datagrid({
		url:"yearOutlay!getYearOutlayCompare.action",
		queryParams:obj,
		onLoadSuccess:function(){
			$("#year11").html($("#lyoyear").combobox("getValue"));
			$("#year22").html($("#lyoyear1").combobox("getValue"));
		}
	});

} 