<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="easyui-tabs">
	<div title="加强制度建设" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi45" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				<tr>
					<td class="info_title"><label for="date">时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" required="required" /></td>
				</tr>
				<tr>
					<td class="info_title"><label for="plan1">制定加强纪检干部队伍建设制度:</label></td>
					<td class="info2"><textarea  id="plan1" name="plan1"></textarea></td>
				</tr>
				<tr>
					<td class="info_title"><label for="plan2">落实加强思想建设举措:</label></td>
					<td class="info2"><textarea  id="plan2" name="plan2"></textarea></td>
				</tr>
				<tr>
					<td class="info_title"><label for="plan3">落实加强作风建设举措:</label></td>
					<td class="info2"><textarea  id="plan3" name="plan3"></textarea></td>
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
					<a href="javascript:void(0);" onclick="$('#pi45').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.2">
			<input type="hidden" name="pi.piname" value="pi45">
		</form> 
	</div>
	
	<div title="加强干部队伍" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi46" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
			
				<tr>
					<td class="info_title"><label for="name1">纪委副书记姓名:</label></td>
					<td class="info2"><input name="title"
						class="easyui-textbox" required="required" /></td>
				</tr>
				<tr>
					<td class="info_title"><label for="date">任职时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" required="required" /></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="name2">纪委委员姓名:</label></td>
					<td class="info2"><input name="title"
						class="easyui-textbox" /></td>
				</tr>
				<tr>
					<td class="info_title"><label for="date">任职时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" /></td>
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
					<a href="javascript:void(0);" onclick="$('#pi46').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.3">
			<input type="hidden" name="pi.piname" value="pi46">
		</form> 
	</div>
</div>

<div class="projectTitle">评分标准：制定了加强乡镇纪检干部队伍建设制度（0.2分），配齐纪委副书记和纪委委员（0.3分）</div>

<script type="text/javascript">

var pconfig={
		"pi45":{"uploadfile":"uploadFile","edit":"plan1,plan2,plan3"},
		"pi46":{"uploadfile":"uploadFile3"}
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