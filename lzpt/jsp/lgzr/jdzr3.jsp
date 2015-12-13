<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="easyui-tabs">
	
	
	<div title="履行监督责任情况" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
			<form id="pi50" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				
				<tr>
					<td class="info_title"><label for="date">时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" required="required" /></td>
				</tr>
				<tr>
					<td class="info_title"><label for="deci">推进作风建设:</label></td>
					<td class="info2"><textarea  id="deci" name="deci"></textarea></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="rule">强化服务意识，创优发展环境:</label></td>
					<td class="info2"><textarea  id="rule" name="rule"></textarea></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="prevention">执纪监督情况:</label></td>
					<td class="info2"><textarea  id="prevention" name="prevention"></textarea></td>
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
					<a href="javascript:void(0);" onclick="$('#pi50').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.5">
			<input type="hidden" name="pi.piname" value="pi50">
		</form> 
		
	</div>
	
	
	
</div>



<script type="text/javascript">

var pconfig={
		"pi50":{"uploadfile":"uploadFile3","edit":"deci,rule,prevention"}
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