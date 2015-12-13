<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="easyui-tabs">


	<div title="优化发展环境突出问题整治情况" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi40" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				<tr>
					<td class="info_title"><label for=scheme>拓宽信访诉求渠道，落实责任单位和人员:</label></td>
					<td class="info2"><textarea  id="scheme" name="scheme"></textarea></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="measure">开展一次群众反映强烈问题和影响发展环境突出问题专项治理工作:</label></td>
					<td class="info2"><textarea  id="measure" name="measure"></textarea></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="standard">乡镇便民服务中心运行规范,行政审批服务职能的部门进驻:</label></td>
					<td class="info2"><textarea  id="standard" name="standard"></textarea></td>
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
			<input type="hidden" name="pi.score" value="5">
			<input type="hidden" name="pi.piname" value="pi40">
		</form> 
	</div>
	
	
</div>

<div class="projectTitle">评分标准：此项工作由县政府办公室、县发改委和县效能办负责评分，并上报到本系统。出现问题被通报或有违纪案件的乡镇此项不得分。</div>


<script type="text/javascript">

var pconfig={
		"pi40":{"uploadfile":"uploadFile","edit":"scheme,measure,standard,records"}
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