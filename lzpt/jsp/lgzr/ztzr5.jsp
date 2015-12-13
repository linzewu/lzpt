<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>

</script>
<div class="easyui-tabs">
	<div title="主体责任具体清单" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi11" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				<tr>
					<td class="info_title"><label for="date">上报时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" required="required" /></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="organization">党委（党组织）主体责任清单:</label></td>
					<td class="info2"><textarea  id="organization" name="organization"></textarea></td>
				</tr>
				<tr>
					<td class="info_title"><label for="leaders">班子主要领导主体责任清单:</label></td>
					<td class="info2"><textarea  id="leaders" name="leaders"></textarea></td>
				</tr>
				<tr>
					<td class="info_title"><label for="incharge">分管领导主体责任清单:</label></td>
					<td class="info2"><textarea  id="incharge" name="incharge"></textarea></td>
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
					<a href="javascript:void(0);" onclick="$('#pi11').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.2">
			<input type="hidden" name="pi.piname" value="pi11">
		</form> 
	</div>
	
	<div title="监督责任具体清单" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi12" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				<tr>
					<td class="info_title"><label for="date">上报时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" required="required" /></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="inspection">纪委（纪检组）监督责任清单:</label></td>
					<td class="info2"><textarea  id="inspection" name="inspection"></textarea></td>
				</tr>
				<tr>
					<td class="info_title"><label for="commission">纪委书记（纪检组长）监督责任清单:</label></td>
					<td class="info2"><textarea  id="commission" name="commission"></textarea></td>
				</tr>
				<tr>
					<td class="info_title"><label for="branched">分管领导监督责任清单:</label></td>
					<td class="info2"><textarea  id="branched" name="branched"></textarea></td>
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
					<a href="javascript:void(0);" onclick="$('#pi12').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.3">
			<input type="hidden" name="pi.piname" value="pi12">
		</form> 
	</div>
	

	
</div>

<!-- <div class="projectTitle">评分标准：党政主要负责人作出廉政承若（0.2分），单位没有违反廉洁从政规定案件（0.3分），有1件案件扣0.3分，每多1件扣0.3分，扣完为止</div> -->

<script type="text/javascript">

/* var pconfig={
		"pi11":{"uploadfile":"uploadFile","edit":"organization,leaders,incharge"},
		"pi12":{"uploadfile":"uploadFile3","edit":"rwfg","score":{"type":"count","grid":"rwfg","score":-0.3}}
	}; */
	
var pconfig={
		"pi11":{"uploadfile":"uploadFile","edit":"organization,leaders,incharge"},
		"pi12":{"uploadfile":"uploadFile3","edit":"inspection,commission,branched"}
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