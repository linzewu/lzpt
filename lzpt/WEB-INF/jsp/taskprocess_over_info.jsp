<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/task.css">

<script type="text/javascript" src="${basePath }js/json2.js"></script>
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath }js/lzpt/taskProcess.js"></script>
<script type="text/javascript" src="${basePath }js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${basePath }js/upload/ajaxfileupload.js"></script>
<script type="text/javascript">
	this.uploadFiles=${taskProcess.task.filesToJson==""?"[]":taskProcess.task.filesToJson};	
	
	processUploadFiles=${taskProcess.processfilesJson==""?"[]":taskProcess.processfilesJson};

</script>
</head>
<body type="info">
<div id="tt" class="easyui-tabs" > 
	<div title="任务详细">
		<table style="margin-left: 20px; margin-top: 10px;" cellpadding="5px">
			<tr>
				<th><label for="task.title">项目标题:</label></th>
				<td><input class="easyui-validatebox" id="title" style="width: 600px;" disabled="true"
					type="text" value="${taskProcess.task.title }" /><br /> <label>完成纪检监察工作项目名称，不超过100字</label></td>
			</tr>
			
			<tr>
				<th><label for="task.startDate">执行时段:</label></th>
				<td><input class="easyui-datebox" id="startDate" value="${taskProcess.task.startDate }" style="width: 200px;" disabled="true" 
					type="text" />至<input class="easyui-datebox" value="${taskProcess.task.endDate }" disabled="true" id="endDate" style="width: 200px;"
					type="text" /><br /> <label>单位完成任务并提交的有效时段，如果超出这个时间段系统将会扣分。</label></td>
			</tr>
			
			
			<tr>
				<th><label for="task.percentage">过期分数:</label></th>
				<td><input class="easyui-numberbox" id="task.percentage" value="${taskProcess.task.percentage }" data-options="min:0,max:100,precision:0"
				style="width: 30px;" disabled="true"  type="text" name="task.percentage" />%<br /> <label>如果任务执行超过有效时段并在最后期限之前，则只得到相应百分比的分数。默认70%</label></td>
			</tr>
			
			<tr>
				<th><label for="task.lastDate">最后期限:</label></th>
				<td><input class="easyui-datebox" id="lastDate" style="width: 200px;" disabled="true" 
					type="text"  value="${taskProcess.task.lastDate }" /><br /> <label>如果超过这个期限，任务将会过期，单位得分为0。</label></td>
			</tr>
			
			<tr>
				<th><label for="task.context">主要内容:</label></th>
				<td><textarea cols="80" rows="10" id="context" name="task.context" disabled="disabled">${taskProcess.task.context }</textarea><br> <label>纪检工作主要内容及说明，不超过500字，如内容较多请选择“附近”栏上传附件</label></td>
				</tr>
				<tr>
					<th><label for="taskFile">附件:</label></th>
					<td>
						<div class="fileInfo" id="taskFileInfo"></div> 
					</td>
				</tr>
				<tr>
					<th><label for="task.remark">备注:</label></th>
					<td><textarea cols="80" id="remark" rows="5" disabled="disabled" name="task.remark">${taskProcess.task.remark}</textarea><br> <label>备注信息，不超出200字</label></td>
			</tr>
		</table>
		<div style="margin:10px 0px 10px 0px;text-align: center;">
			<a href="javaScript:void(0)" onclick="history.back();" class="easyui-linkbutton" iconCls="icon-cancel">返回</a>
		</div>
		
	</div>
	
	<div title="执行信息">
			<table style="margin-left: 20px; margin-top: 10px;" cellpadding="5px">
				<tr>
					<th><label for="taskProcess.processTitle">上报标题:</label></th>
					<td><input class="easyui-validatebox" id="title" style="width: 600px;" 
						type="text" value="${taskProcess.processTitle }" disabled="disabled" /><br /> <label>完成纪检监察工作项目名称，不超过100字</label></td>
				</tr>
				<tr>
					<th><label for="task.context">主要内容:</label></th>
					<td><textarea cols="80" rows="10" id="processContext" disabled="disabled" >${taskProcess.processContext }</textarea><br> <label>纪检工作主要内容及说明，不超过500字，如内容较多请选择“附近”栏上传附件</label></td>
				</tr>
				<tr>
					<th><label for="taskFile">附件:</label></th>
					<td>
						<div class="fileInfo" id="taskProcessFileInfo"></div> <input type="file" name="uploadFile" disabled="disabled" alt="文件上传" id="uploadFile"
						onchange="ajaxFileUpload()"  /> <pre><label>请上传与本项纪检工作相关的文本、表格、图片等资料 
可上传文件类型：.doc,.xls,.docx,.xlsx,.ppt,.pptx,.txt,
可上传文件大小：20M</label></pre>
					</td>
				</tr>
				<tr>
					<th><label for="taskProcess.remark">备注:</label></th>
					<td><textarea cols="80" id="remark" rows="5"  disabled="disabled" >${taskProcess.processRemark }</textarea><br> <label>备注信息，不超出200字</label></td>
				</tr>
			</table>
			<input type="hidden" value="${taskProcess.processfilesJson }" name="" id="taskFiles" >
			
			<div style="margin:10px 0px 10px 0px;text-align: center;">
				<a href="javaScript:void(0)" onclick="history.back();" class="easyui-linkbutton" iconCls="icon-cancel">返回</a>
			</div>
	</div>
</div>

</body>
</html>