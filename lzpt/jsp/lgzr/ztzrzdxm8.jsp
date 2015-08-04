<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="easyui-tabs">
	<div title="制定并公布行政权力清单及权力规范运行情况" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi41" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				<tr>
					<td class="info_title"><label for="date">时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" required="required" /></td>
				</tr>
				
				
				
				<tr>
					<td class="info_title"><label for="power1">梳理现有行政职权:</label></td>
					<td class="info2"><textarea  id="power1" name="power1"></textarea></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="power2">清理调整行政职权:</label></td>
					<td class="info2"><textarea  id="power2" name="power2"></textarea></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="power3">优化权力运行流程:</label></td>
					<td class="info2"><textarea  id="power3" name="power3"></textarea></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="power4">公布权力清单:</label></td>
					<td class="info2"><textarea  id="power4" name="power4"></textarea></td>
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
					<a href="javascript:void(0);" onclick="$('#pi41').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="10">
			<input type="hidden" name="pi.piname" value="pi41">
		</form> 
	</div>
	
	
</div>

<div class="projectTitle">评分标准：此项工作由县政府办公室、县编办、县政府法制办负责评分，并上报到本系统。</div>


<script type="text/javascript">

var pconfig={
		"pi41":{"uploadfile":"uploadFile","edit":"power1,power2,power3,power4"}
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