<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="easyui-tabs">
	<div title="优化发展环境突出问题整治情况" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi40" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				<tr>
					<td class="info_title"><label for="date">时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" required="required" /></td>
				</tr>
				
				
				
				<tr>
					<td class="info_title"><label for=scheme>优化发展环境突出问题集中工作方案:</label></td>
					<td class="info2"><textarea  id="scheme" name="scheme"></textarea></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="measure">落实具体内容或实施措施:</label></td>
					<td class="info2"><textarea  id="measure" name="measure"></textarea></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="records">群众或企业回访记录:</label></td>
					<td class="info2"><textarea  id="records" name="records"></textarea></td>
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
					<a href="javascript:void(0);" onclick="$('#pi40').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="10">
			<input type="hidden" name="pi.piname" value="pi40">
		</form> 
	</div>
	
	
</div>


<script type="text/javascript">

var pconfig={
		"pi40":{"uploadfile":"uploadFile","edit":"scheme,measure,records"}
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