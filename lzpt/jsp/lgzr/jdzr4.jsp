<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="easyui-tabs">
	
	
	<div title="规范纪检组织设置情况" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
			<form id="pi51" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				<tr>
					<td class="info_title"><label for="date">时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" required="required" /></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="device1">纪委副书记姓名:</label></td>
					<td class="info2"><input name="title"
						class="easyui-textbox" required="required" /></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="device2">是否有单独办公室:</label></td>
					<td class="info2"><input name="title"
						class="easyui-textbox" required="required" /></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="device3">是否有电脑:</label></td>
					<td class="info2"><input name="title"
						class="easyui-textbox" required="required" /></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="device4">是否有举报电话:</label></td>
					<td class="info2"><input name="title"
						class="easyui-textbox" required="required" /></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="device5">是否有录音笔:</label></td>
					<td class="info2"><input name="title"
						class="easyui-textbox" required="required" /></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="device6">是否有摄像机:</label></td>
					<td class="info2"><input name="title"
						class="easyui-textbox" required="required" /></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="device7">是否有照相机:</label></td>
					<td class="info2"><input name="title"
						class="easyui-textbox" required="required" /></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="device8">是否有机构牌子:</label></td>
					<td class="info2"><input name="title"
						class="easyui-textbox" required="required" /></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="device9">是否有档案柜:</label></td>
					<td class="info2"><input name="title"
						class="easyui-textbox" required="required" /></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="plan1">纪检工作制度:</label></td>
					<td class="info2"><textarea  id="plan1" name="plan1"></textarea></td>
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
					<a href="javascript:void(0);" onclick="$('#pi51').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.5">
			<input type="hidden" name="pi.piname" value="pi51">
		</form> 
		
	</div>
	
	
	
</div>

<div class="projectTitle">评分标准：乡镇纪委达到“十有”（ 即配备有纪委副书记，有单独的办公室、机构牌子、制度以及电脑、举报电话、录音笔、摄像机、照相机、档案柜等办案设备）标准，每少一项扣0.05分，扣完为止。</div>

<script type="text/javascript">

var pconfig={
		"pi51":{"uploadfile":"uploadFile3","edit":"plan1"}
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