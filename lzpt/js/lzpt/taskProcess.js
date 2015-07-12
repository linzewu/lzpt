var url;
var uploadFiles=[];
var processUploadFiles=[];
var taskId;
function toInfo(index,data) {
	
	if(data==null){
		data=$("#dg").datagrid("getSelected");
	}
	window.location.href="task!getTaskByid.action?task.id="+data.id+"&pageName=taskprocessInfo";
}


function toOverInfo(index,data){
	window.location.href="task!getTaskAndProcessByid.action?task.id="+data.id+"&pageName=taskprocessOverInfo";
}


function toProcessOverInfo(index,data){
	window.location.href="task!getTaskProcessByid.action?taskProcess.id="+data.id+"&pageName=taskprocessOverInfo";
}

$(function() {
	
	var pageType=$("body").attr("type");

	if(pageType=="add"||pageType=="info"||pageType=="modify"){
		CKEDITOR.replace('context', {
			skin : 'office2003'
		});
		CKEDITOR.replace('processContext', {
			skin : 'office2003'
		});
	}
	
	if(pageType=="info"){
		$.each(uploadFiles,function(i,n){
			createUploadDiv(n,false,"taskFileInfo");
		});
		
		
		$.each(processUploadFiles,function(i,n){
			createUploadDiv(n,false,"taskProcessFileInfo");
		});
		
	}
	if(pageType=="list"){
		$("#info").linkbutton("disable");
	}
	
});


function initTool(rowIndex, rowData){
	$("#info").linkbutton("enable");
}

function saveProcess(){
	$('#fm').form("submit",{
		onSubmit : function() {
			$("#taskFiles").val(JSON.stringify(uploadFiles));
			return $(this).form('validate');
		},
		success :function(result) {
			if ('success' == result) {
				window.location.href="task!toPage.action?pageName=processOverList";
				
			} else {
				$.messager.show({
					title : '错误！',
					msg : "保存出错！"
				});
			}
		}
	
	});
}


function ajaxFileUpload() {

	$.ajaxFileUpload({
		url : 'upload!uploadFile.action',
		secureuri : false,
		fileElementId : 'uploadFile',
		dataType : 'json',
		success : function(data, status) {
			if (data[0].message == "success") {
				
				createUploadDiv(data[1],true,"taskProcessFileInfo");
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

function createUploadDiv(data,isdelete,contex){

	var del = "<a href='javaScript:void(0)' onClick=\"removeFile(this,'" + data.id
	+ "');\">删除</a>";
	
	var fn=encodeURI(encodeURI(data.filename));
	
	var download="<a href='upload!download.action?fileId="+data.id+"&fn="+fn+"'\">下载</a>";
	
	$("#"+contex).append("<div>" + data.filename + (isdelete==true?del:"") +download + "</div>");
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

function funit(data){
	return data.wname;
}

