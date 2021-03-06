<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="easyui-tabs">
	<div title="落实党风廉政建设责任制" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi6" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				<tr>
					<td class="info_title"><label for="date">时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" required="required" /></td>
				</tr>
				<!-- <tr>
					<td class="info_title"><label for="org">单位落实主体责任情况:</label></td>
					<td class="info2"><textarea  id="org" name="org"></textarea></td>
				</tr> -->
				
				<tr>
					<td class="info_title"><label for="principal">党政主要负责人履行第一责任人情况:</label></td>
					<td class="info2"><textarea  id="principal" name="principal"></textarea></td>
				</tr>
				
				
				<tr>
					<td class="info_title"><label for="discipline">纪委落实监督情况:</label></td>
					<td class="info2"><textarea  id="discipline" name="discipline"></textarea></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="bg">单位落实主体责任情况:</label></td>
					<td class="info2"><textarea  id="bg" name="bg"></textarea></td>
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
					<a href="javascript:void(0);" onclick="$('#pi6').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.2">
			<input type="hidden" name="pi.piname" value="pi6">
		</form> 
	</div>
	
	<div title="个人述责述廉报告" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi7" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				<tr>
					<td class="info_title"><label for="date">时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" required="required" /></td>
				</tr>

				<tr>
					<td class="info_title"><label for="report">个人述责述廉报告:</label></td>
					<td class="info2"><textarea  id="report" name="report"></textarea></td>
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
					<a href="javascript:void(0);" onclick="$('#pi7').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.3">
			<input type="hidden" name="pi.piname" value="pi7">
		</form> 
	</div>
	
</div>

<div class="projectTitle">评分标准：年中（7.10前）单位有落实党风廉政建设责任制情况报告，包含单位落实主体责任情况、党政主要负责人履行第一责任人情况、纪委落实监督责任情况（0.2分）；年终，个人述责述廉报告（0.3分）。</div>

<script type="text/javascript">

var pconfig={
		"pi6":{"uploadfile":"uploadFile","edit":"principal,discipline,bg"},
		"pi7":{"uploadfile":"uploadFile","edit":"report"},
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