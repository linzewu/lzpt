<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>

</script>
<div class="easyui-tabs">
	<div title="工作计划" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi1" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				<tr>
					<td class="info_title"><label for="date">时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" required="required" /></td>
				</tr>
				<tr>
					<td class="info_title"><label for="plan">工作计划或要点:</label></td>
					<td class="info2"><textarea  id="plan" name="plan"></textarea></td>
				</tr>
				<tr>
					<td class="info_title">附件：</td>
					<td class="info2">
						<div class="fileInfo" id="fileInfo"></div> <input type="file"  
						name="uploadFile" alt="文件上传" id="uploadFile" onchange="ajaxFileUpload2('uploadFile')" /> <pre>
						<input type="hidden"  name="uploadFileJson" id="uploadFileJson" value="data_[] ">
						</pre>
					</td>
				</tr>
				
			</table>
			<div align="center">
					<a href="#" onclick="$('#pi1').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.piname" value="pi1">
		</form> 
	</div>
	<div title="任务分工/措施"></div>
	<div title="工作总结"></div>
</div>

<script type="text/javascript">

var pconfig={
		"pi1":{"uploadfile":"uploadFile","edit":"plan"}
	};
	

$(function(){
	loadEidt('plan');
	formBind('pi1');
	if(pid){
		loadProjectInfo();
	}
});

</script>