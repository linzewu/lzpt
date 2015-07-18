<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>

</script>
<div class="easyui-tabs">
	<div title="专题分析" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
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
	
	
	

	
</div>

<script type="text/javascript">

var pconfig={
		"pi4":{"uploadfile":"uploadFile","edit":"plan0"},

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