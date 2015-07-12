var url;
var uploadFiles=[];
var taskId;
function toInfo(index,data) {
	window.location.href="task!getTaskByid.action?task.id="+data.id+"&pageName=taskInfo&workItem="+workItem;
}

function toadd() {
	window.location.href = "task!toPage.action?pageName=addTask&workItem="+workItem;
}

function editTask() {
	
	var data=$("#dg").datagrid("getSelected");
	
	if(data!=null){
		window.location.href="task!getTaskByid.action?task.id="+data.id+"&pageName=taskModify&workItem="+workItem;
	}else{
		$.messager.alert('提示','您好，请选择一条数据后再点击修改任务');  
	}
	
}

function saveTask(isPush) {
	$('#fm').form('submit', {
		onSubmit : function() {
			$("#taskFiles").val(JSON.stringify(uploadFiles));
			if(isPush){
				$("#status").val(1);
			}
			
			return $(this).form('validate');
		},
		success :function(result) {
			if ('succeed' == result) {
				
				window.location.href="task!toPage.action?pageName=list&workItem="+$("#workItem").val();
				
			} else {
				$.messager.show({
					title : '错误！',
					msg : "保存出错，请检查你的附件大小是否大于20M，如果不是，请联系管理员！"
				});

			}
		}
	});
}

$(function() {
	
	var pageType=$("body").attr("type");
	
	initTitle(workItems);

	if(pageType=="add"||pageType=="info"||pageType=="modify"){
		
		CKEDITOR.replace('context', {
			skin : 'office2003'
		});
	}
	
	
	if(pageType=="info"){
		$.each(uploadFiles,function(i,n){
			createUploadDiv(n,false);
		});
	}
	
	if(pageType=="modify"){
		
		$.each(uploadFiles,function(i,n){
			createUploadDiv(n,true);
		});
	}
	
	if(pageType=="list"){
		if(title!=null&&title!=""){
			$("#dg").datagrid({
				"title":title
			});
		}
		$("#modify").linkbutton("disable");
		$("#setUnit").linkbutton("disable");
		$("#pushTask").linkbutton("disable");
		$("#del").linkbutton("disable");
		$("#tps").linkbutton("disable");
		
	}
});

var title="";
function  initTitle(workItems){
	
	
	if(workItem!=null&&workItems!=null){
		$.each(workItems,function(i,n){
			if(workItem==n.id){
				title=n.text;
			}
			if(title!=""){
				return;
			}
			
			if(n.children!=null&&n.children.length>0){
				initTitle(n.children);
			}
			
		});
	}
}


function initTool(rowIndex, rowData){
	
	$("#setUnit").linkbutton("enable");
	if(rowData.status==0){
		$("#modify").linkbutton("enable");
		$("#pushTask").linkbutton("enable");
		$("#del").linkbutton("enable");
		$("#unitSave").linkbutton("enable");
		$("#tps").linkbutton("disable");
	}
	else{
		$("#modify").linkbutton("disable");
//		$("#setUnit").linkbutton("disable");
		$("#unitSave").linkbutton("disable");
		$("#pushTask").linkbutton("disable");
		$("#del").linkbutton("disable");
		$("#tps").linkbutton("enable");
	}
}

function ajaxFileUpload() {

	$.ajaxFileUpload({
		url : 'upload!uploadFile.action',
		secureuri : false,
		fileElementId : 'uploadFile',
		dataType : 'json',
		success : function(data, status) {
			if (data[0].message == "success") {
				
				createUploadDiv(data[1],true);
				uploadFiles.push(data[1]);

			}
			if (data[0].message == "error") {
				$.messager.show({
					title : '错误！',
					msg : "上传文件出错，请检查你的附件大小是否大于20M，如果不是，请联系管理员！"
				});
			}
		},
		error : function(data, status, e) {
			$.messager.show({
				title : '错误！',
				msg : "状态" + status + "错误信息：" + e
			});
		}
	});
}

function createUploadDiv(data,isdelete){

	var del = "<a href='javaScript:void(0)' onClick=\"removeFile(this,'" + data.id
	+ "');\">删除</a>";
	
	var fn=encodeURI(encodeURI(data.filename));
	
	var download="<a href='upload!download.action?fileId="+data.id+"&fn="+fn+"'\">下载</a>";
	
	$(".fileInfo").append("<div>" + data.filename + (isdelete==true?del:"") +download + "</div>");
}



function removeFile(e,id) {
	$.ajax({
		type : "POST",
		url : "upload!deleteUploadFile.action",
		data : {'fileId':id},
		success : function(msg) {
			if(msg=="success"){
				var index=-1;
				$.each(uploadFiles,function(i,n){
					if(n.id==id){
						index=i;
					}
				});
				uploadFiles.splice(index,1);
				if($("body").attr("type")=="modify"){
					syncUploadFile(uploadFiles,e);
				}else{
					$(e).parent().remove();
				}
				
			}
			else{
				$.messager.show({
					title : '提示！',
					msg : "删除失败"
				});
			}
		}
	});
}

function syncUploadFile(uploadFiles,e){
	
	var syncData={"task.filesToJson":JSON.stringify(uploadFiles),"task.id":taskId};
	$.ajax({
		type : "POST",
		url : "task!modifyUploadFileToTask.action",
		data:syncData,
		success:function(msg){
			if(msg=="success"){
				$(e).parent().remove();
			}
			else{
				$.messager.show({
					title : '提示！',
					msg : "删除失败"
				});
			}
		}
	});
}

function dateToStr(o){
	if(o!=null){
		var date=new Date(o.time);
		return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
	}else{
		return o;
	}
}


function openUnits(){
	
	var data=$("#dg").datagrid("getSelected");
	
	$(".datagrid-header-check input").removeAttr("checked");
	
	if(data!=null){
		
		$("#units").datagrid("uncheckAll");
		var taskId=$("#dg").datagrid("getSelected").id;
		
		$.ajax({
			type : "POST",
			url : "task!getTaskUnit.action",
			data : {"task.id":taskId},
			success : function(msg) {
				if(msg=="error"){
					$.messager.alert("提示","保存错误");
				}else{
					var allUnits = $("#units").datagrid("getRows");
					var myUnits = jQuery.parseJSON(msg);
					
					$.each(allUnits,function(i,n){
						
						$.each(myUnits,function(j,m){
							if(n.id==m.id){
								$("#units").datagrid("selectRow",i);
							}
							
						});
					});
				}
			}
		});
		
		
		$('#win').window("setTitle",data.title);
		
		$('#win').window('open');
	}else{
		$.messager.alert('提示','您好，请选择一条数据后再点击考核单位');  
	}
}

function saveTaskUnit(){
	
	var checkUnits = $("#units").datagrid("getChecked");
	
	var units_str="";
	
	$.each(checkUnits,function(i,n){
		units_str+=n.id+",";
	});

	units_str=units_str.substring();
	
	var taskId=$("#dg").datagrid("getSelected").id;
	
	
	$.ajax({
		type : "POST",
		url : "task!modifyTaskUnits.action",
		data : {'units':units_str,"task.id":taskId},
		success : function(msg) {
			if(msg=="success"){
				$("#win").window("close");
				$("#dg").datagrid("reload");
			}
			
			if(msg=="error"){
				$.messager.alert("提示","保存错误");
			}
		}
	});
}

function converStatus(status){
	
	if(status!=null){
		if(status==0){
			return "<lable class='A0'>未发布</lable>";
		}
		
		if(status==1){
			return "<lable class='A1'>已发布</lable>";
		}
		if(status==2){
			return "<lable class='A2'>已完结</lable>";
		}
	}
	
	return status;
}


function pushTask(){
	
	var data=$("#dg").datagrid("getSelected");
	var taskId=data.id;
	 
	if(data.units.length>0){
		$.ajax({
			type : "POST",
			url : "task!pushTask.action",
			data : {'task.status':1,"task.id":taskId},
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
	}else{
		$.messager.alert("提示","该任务没有设置考核单位，请点击“考核单位”按钮进行设置！");
	}
}


function toRate(value,row,index){
	
	var count=row.tasksProcess.length;
	var j=0;
	for(var i=0;i<count;i++){
		if(row.tasksProcess[i].processState>=1){
			j++;
		}
	}
	var progress;
	if(count!=0){
		progress=(j/count)*100+"%";
	}else if(row.status==0){
		progress="0%";
	}else{
		progress="100%";
	}
	
	
	var strHtml='<DIV style="WIDTH: 158px" class="easyui-progressbar progressbar" value="'+progress+'">'+
	'<DIV style="WIDTH: 198px" class=progressbar-text>'+ j+'/'+count+'</DIV>'+
	'<DIV style="WIDTH: '+progress+'" class=progressbar-value>&nbsp;</DIV></DIV>';
	
//	return j+"/"+count;
	return strHtml;
}


function rate(){
	var data=$("#dg").datagrid("getSelected");
	$("#tpr").datagrid("loadData",data.tasksProcess);
	$('#taskProcessRate').window('open');
}

function convertState(state){
	return state==1?'<font color=blue>待评分</font>':state==2?'<font color=green>已完成</font>':'<font color=red>未完成</font>';
}

function toDelete(){
	
	var data=$("#dg").datagrid("getSelected");
	if(data.status==0){
		
		$.messager.confirm("警告！","你是否确认删除该数据。",function(r){
			if(r){
				$.ajax({
					type : "POST",
					url : "task!deleteTask.action",
					data : {"task.id":data.id},
					success : function(msg) {
						if(msg=="success"){
							$("#dg").datagrid("reload");
							$.messager.show({
								title:'提示',
								msg:'删除成功！',
								showType:'slide'
							});
						}
						
						if(msg=="error"){
							$.messager.alert("错误","删除失败！");
						}
					}
				});
			}
		});
		
	}
}

function opentpsInfo(id,unit){
	
	$("#tpinfo").attr("src","task!getTaskProcessByid.action?taskProcess.id="+id+"&pageName=taskprocessOverInfo");
	
	$('#tpsInfo').window('setTitle',unit+"任务完成情况");
	
	$('#tpsInfo').window('open');
	
}

function convertLink(value,row,index){
	
	var link="<a href=\"javaScript:void(0)\" onclick=\"opentpsInfo('"+value+"','"+row.unit.wname+"')\">查看详细</a>";
	
	if(row.processState>=1){
		return link;
	}else{
		return "";
	}
	
}

function score(){
	var data=$("#tpr").datagrid("getSelected");
	if(data!=null&&data.processState>=1){
		$('#score_win').window('setTitle',data.unit.wname+"评分");
		
		$("#score").numberbox("setValue",data.score);
		$("#score_scoreRemark").val(data.scoreRemark);
		
		$('#score_win').window('open');
	}else if(data!=null&&data.processState==0){
		$.messager.alert("提示！","该单位未完成任务，无法评分！");
	}else{
		$.messager.alert("提示！","请选择乡镇");
	}
}

function save_score(){
	
	if($("#score_form").form("validate")){
		var score= $('#score').numberbox("getValue");
		var scoreRemark=$("#score_scoreRemark").val();
		var data = $("#tpr").datagrid("getSelected");
		$.ajax({
			type : "POST",
			url : "task!updateScore.action",
			data : {
				"taskProcess.id":data.id,
				"score":score,
				"scoreRemark":scoreRemark
				},
			success : function(msg) {
				if(msg=="success"){
					$('#score_win').window('close');
					$("#taskProcessRate").window("close");
					$.messager.show({
						title:'提示',
						msg:'评分成功！',
						showType:'slide'
					});
					$("#dg").datagrid("reload");
				}
				
				if(msg=="error"){
					$.messager.alert("错误","评分失败！");
				}
			}
		});
		
	}else{
		alert("no")
	}
}

