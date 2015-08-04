<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="easyui-tabs">
	<div title="民生资金管理使用监管情况" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi42" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				<tr>
					<td class="info_title"><label for="date">时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" required="required" /></td>
				</tr>
				
				
				
				<tr>
					<td class="info_title"><label for="fund1">民生资金执行情况:</label></td>
					<td class="info2"><textarea  id="fund1" name="fund1"></textarea></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="fund2">民生资金专账管理情况:</label></td>
					<td class="info2"><textarea  id="fund2" name="fund2"></textarea></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="fund3">存在问题及改进措施:</label></td>
					<td class="info2"><textarea  id="fund3" name="fund3"></textarea></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="fund4">民政专项资金管理使用情况自检自查报告:</label></td>
					<td class="info2"><textarea  id="fund4" name="fund4"></textarea></td>
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
					<a href="javascript:void(0);" onclick="$('#pi42').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="10">
			<input type="hidden" name="pi.piname" value="pi42">
		</form> 
	</div>
	
	
</div>

<div class="projectTitle">评分标准：此项工作由县财政局负责评分，并上报到本系统。</div>


<script type="text/javascript">

var pconfig={
		"pi42":{"uploadfile":"uploadFile","edit":"fund1,fund2,fund3,fund4"}
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