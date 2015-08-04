<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="easyui-tabs">
	<div title="反腐倡廉工作计划" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi32" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				<tr>
					<td class="info_title"><label for="date">时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" required="required" /></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="principal">年度反腐倡廉工作要点或计划：</label></td>
					<td class="info2"><textarea  id="principal" name="principal"></textarea></td>
				</tr>
				
				
				<tr>
					<td class="info_title"><label for="zxqk">执行情况:</label></td>
					<td class="info2"><textarea  id="zxqk" name="zxqk"></textarea></td>
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
					<a href="javascript:void(0);" onclick="$('#pi32').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.2">
			<input type="hidden" name="pi.piname" value="pi32">
		</form> 
	</div>
	
	<div title="惩防体系建设规划" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi33" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				<tr>
					<td class="info_title"><label for="date">时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" required="required" /></td>
				</tr>

				<tr>
					<td class="info_title"><label for="report">惩防体系建设规划:</label></td>
					<td class="info2"><textarea  id="report" name="report"></textarea></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="zxqk2">执行情况:</label></td>
					<td class="info2"><textarea  id="zxqk2" name="zxqk2"></textarea></td>
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
					<a href="javascript:void(0);" onclick="$('#pi33').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.3">
			<input type="hidden" name="pi.piname" value="pi33">
		</form> 
	</div>
	
</div>

<div class="projectTitle">评分标准：有年度反腐倡廉工作要点或计划（0.1分），有惩防体系建设规划（0.2分），没有出现案件（0.2分），有1件案件扣0.3分，每多1件扣0.3分，扣完为止。</div>

<script type="text/javascript">

var pconfig={
		"pi32":{"uploadfile":"uploadFile","edit":"principal,zxqk"},
		"pi33":{"uploadfile":"uploadFile","edit":"report,zxqk2"},
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