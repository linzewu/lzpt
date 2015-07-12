var url;
function saveQuarterOutlay(isPush) {
	$('#fm').form('submit', {
		onSubmit : function() {
			if(isPush){
				$("#state").val(1);
			}
			
			return $(this).form('validate');
		},
		success :function(result) {
			if ('success' == result) {
				
				window.location.href="quarterOutlay!toPage.action?pageName=list";
				
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
				
				window.location.href="quarterOutlay!toPage.action?pageName=list1";
				
			} else {
				$.messager.show({
					title : '错误！',
					msg : "保存出错！"
				});

			}
		}
	});
}

function deleteQuarterOutlay()
{
var row = $('#dg').datagrid('getSelected');
	
	if (row) {

		if(confirm("确定要删除该经费信息？"))
		{
			var row_={};
			
			$.each(row,function(i,n){
				row_["qo."+i]=n;
			});
			
			
			var ea1 = 
				$.ajax({ type: "POST",//http请求方式  
	            url: "quarterOutlay!deleteQuarterOutlay.action",    //服务器段url地址  
	            data:"qo.id="+row.id,      //发送给服务器段的数据  
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
			"qo.qoyear":$("#lqoyear").combobox("getValue") == ''?0:$("#lqoyear").combobox("getValue"),
			"qo.qoquarter":$("#lqoquarter").combobox("getValue") == ''?0:$("#lqoquarter").combobox("getValue"),
			"uname":rol,
			"qo.wa.id":waid
	};
	$('#dg').datagrid({
		url:"quarterOutlay!queryQuarterOutlays.action",
		queryParams:obj
	});

} 

function toInfo(index,data) {
	window.location.href="quarterOutlay!getQuarterOutlayById.action?reqUrl=toinfo&qo.id="+data.id;
}

function toEdit() {
	var row = $('#dg').datagrid('getSelected');
	if (row) {
	window.location.href="quarterOutlay!getQuarterOutlayById.action?reqUrl=tomodify&qo.id="+row.id;
	}
}

function toadd() {
	window.location.href = "quarterOutlay!toPage.action?pageName=toadd";
}

function toadd1() {
	window.location.href = "encourageAppeal!toPage.action?pageName=toadd1";
}


function pushQuarterOutlay(){
	
	var taskId=$("#dg").datagrid("getSelected").id;
	$.ajax({
		type : "POST",
		url : "quarterOutlay!pushQuarterOutlay.action",
		data : {'qo.state':1,"qo.id":taskId},
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
		url : "quarterOutlay!modifyEncourageAppealtotal.action",
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
	
	var sum = row.c_trafficMon1 + row.c_stayMon1 + row.c_foodMon1 +
	row.c_otherBusiness1 + row.c_trainMon1 + row.c_bidMon1 +
	row.c_otherAbroadMon1 + row.c_buyCarMon1 +row.c_fixCarMon1 ;
	
	return sum;
}
function sum2(value,row,index)
{
	
	var sum = row.c_trafficMon2 + row.c_stayMon2 + row.c_foodMon2 +
	row.c_otherBusiness2 + row.c_trainMon2 + row.c_bidMon2 +
	row.c_otherAbroadMon2 + row.c_buyCarMon2 +row.c_fixCarMon2 ;
	
	return sum;
}
function sum3(value,row,index)
{
	
	var sum = row.c_trafficMon3 + row.c_stayMon3 + row.c_foodMon3 +
	row.c_otherBusiness3 + row.c_trainMon3 + row.c_bidMon3 +
	row.c_otherAbroadMon3 + row.c_buyCarMon3 +row.c_fixCarMon3 ;
	
	return sum;
}
function sum4(value,row,index)
{
	
	var sum = row.c_trafficMon4 + row.c_stayMon4 + row.c_foodMon4 +
	row.c_otherBusiness4 + row.c_trainMon4 + row.c_bidMon4 +
	row.c_otherAbroadMon4 + row.c_buyCarMon4 +row.c_fixCarMon4 ;
	
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
		waid = $("#workid").val();
	}
	
    
	var obj = {
			"qo.qoyear":$("#lyoyear").combobox("getValue") == ''?0:$("#lyoyear").combobox("getValue"),
			"uname":rol,
			"qo.wa.id":waid
	};
	$('#dg1').datagrid({
		url:"quarterOutlay!getQueryOutlayCheck.action",
		queryParams:obj
	});

} 



$.extend($.fn.validatebox.defaults.rules, {
    valUniquel: {
        validator: function(value,param){
        	//alert("aaaaaaaaa");
        	var results = "false";
        	var lqoyear = $("#qoyear").combobox("getValue"); 
        	var lqoquarter = $("#qoquarter").combobox("getValue");
        	if (null != lqoyear && '' != lqoyear && null != lqoquarter && '' != lqoquarter)
        	{
        		results=$.ajax({ type: "POST",//http请求方式  
	                url: "quarterOutlay!isQuarterExist.action",    //服务器段url地址  
	                data:"qo.qoyear="+lqoyear+"&qo.qoquarter="+lqoquarter,      //发送给服务器段的数据  
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

        },
        message: '该年份对应的季度已经存在'
    }
});