<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="easyui-tabs">
	<div title="纪委书记其它分管工作" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi15" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				
				<tr>
					<td class="info_title"><label for="firstwork">其它分管工作(1):</label></td>
					<td class="info2"><textarea  id="firstwork" name="firstwork"></textarea></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="secondwork">其它分管工作(2):</label></td>
					<td class="info2"><textarea  id="secondwork" name="secondwork"></textarea></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="thirdwork">其它分管工作(3):</label></td>
					<td class="info2"><textarea  id="thirdwork" name="thirdwork"></textarea></td>
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
					<a href="javascript:void(0);" onclick="$('#pi15').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.2">
			<input type="hidden" name="pi.piname" value="pi15">
		</form> 
	</div>
	
	<div title="十有规范化建设" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
			<form id="pi16" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				
				<tr>
					<td class="info_title"><label for="name">纪委副书记姓名:</label></td>
					<td class="info2"><input name="title"
						class="easyui-textbox" required="required" /></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="date">任职日期:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox"/></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for=fund>办案经费(元):</label></td>
					<td class="info2"><input name="title"
						class="easyui-textbox" /></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="device">办公办案设备:</label></td>
					<td class="info2"><textarea  id="device" name="device"></textarea></td>
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
					<a href="javascript:void(0);" onclick="$('#pi16').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.2">
			<input type="hidden" name="pi.piname" value="pi16">
		</form> 
		
	</div>
	
	
	<div title="听取汇报" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi17" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				<tr>
					<td class="info_title"><label for="date">汇报时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" required="required" /></td>
				</tr>
				<tr>
					<td class="info_title"><label for="reportobj">汇报对象:</label></td>
					<td class="info2"><input name="title"
						class="easyui-textbox" /></td>
				</tr>
				<tr>
					<td class="info_title"><label for="record">汇报记录:</label></td>
					<td class="info2"><textarea  id="record" name="record"></textarea></td>
				</tr>
				<tr>
					<td class="info_title">附件：</td>
					<td class="info2">
						<div class="fileInfo" id="fileInfo"></div> <input type="file"  
						name="uploadFile" alt="文件上传" id="uploadFile3" onchange="ajaxFileUpload2('uploadFile3')" /> <pre>
						<input type="hidden"  name="uploadFileJson" id="uploadFile3Json" value="data_[] ">
						</pre>
					</td>
				</tr>
			</table>
			<div align="center">
					<a href="javascript:void(0);" onclick="$('#pi17').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.1">
			<input type="hidden" name="pi.piname" value="pi17">
		</form> 
	</div>
</div>

<div class="projectTitle">评分标准：明确乡镇纪委书记主要分管乡镇纪检工作，其他工作不得超过2项（0.2分），有党委书记、乡（镇）长听取纪委书记汇报工作的记录（0.1分），推进乡镇纪委“十有”规范化建设，配备纪委副书记或专职纪检干部，配全办公办案设备和办案经费（0.2分）</div>

<script type="text/javascript">

var pconfig={
		"pi15":{"uploadfile":"uploadFile","edit":"firstwork,secondwork,thirdwork"},
		"pi16":{"uploadfile":"uploadFile2","edit":"device"},
		"pi17":{"uploadfile":"uploadFile3","edit":"record"}
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