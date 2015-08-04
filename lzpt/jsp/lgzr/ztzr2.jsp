<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>

</script>
<div class="easyui-tabs">
	<div title="党风廉政建设工作会议" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi4" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				<tr>
					<td class="info_title"><label for="date">时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" required="required" /></td>
				</tr>
				<tr>
					<td class="info_title"><label for="date">会议主题:</label></td>
					<td class="info2"><input name="title"
						class="easyui-textbox" required="required" /></td>
				</tr>
				<tr>
					<td class="info_title"><label for="plan0">会议纪要:</label></td>
					<td class="info2"><textarea  id="plan0" name="plan0"></textarea></td>
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
					<a href="javascript:void(0);" onclick="$('#pi4').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.2">
			<input type="hidden" name="pi.piname" value="pi4">
		</form> 
	</div>
	
	<div title="解决党风廉政建设工作问题" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi5" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				<tr>
					<td class="info_title"><label for="date">处理时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" required="required" /></td>
				</tr>

				<tr>
					<td class="info_title"><label for="solution">解决方案或结果:</label></td>
					<td class="info2"><textarea  id="solution" name="solution"></textarea></td>
				</tr>
				<tr>
					<td class="info_title">附件：</td>
					<td class="info2">
						<div class="fileInfo" id="fileInfo"></div> <input type="file"  
						name="uploadFile" alt="文件上传" id="uploadFile2" onchange="ajaxFileUpload2('uploadFile2')" /> <pre>
						<input type="hidden"  name="uploadFileJson" id="uploadFile2Json" value="data_[] ">
						</pre>
					</td>
				</tr>
				
			</table>
			<div align="center">
					<a href="javascript:void(0);" onclick="$('#pi5').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.3">
			<input type="hidden" name="pi.piname" value="pi5">
		</form> 
	</div>
	

	
</div>

<div class="projectTitle">评分标准：年初（3月）有专题分析研究党风廉政建设工作会议记录（0.2分），年中（7.10前）有解决党风廉政建设工作中的问题会议记录，并及时向上级纪委汇报（0.3分）</div>

<script type="text/javascript">

var pconfig={
		"pi4":{"uploadfile":"uploadFile","edit":"plan0"},
		"pi5":{"uploadfile":"uploadFile","edit":"solution"}
	};
	

$(function(){
	$.each(pconfig,function(key,data){
		formBind(key);
		var econfig = data['edit'];
		if(econfig){
			econfig=econfig.split(",");
			$.each(econfig,function(i,n){
				loadEidt(n);
			});
		}
	})
	
	if(pid){
		loadProjectInfo();
	}
});

</script>