<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="easyui-tabs">
	
	
	<div title="纪委书记分管纪检以外的工作" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
			<form id="pi52" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				<tr>
					<td class="info_title"><label for="date">时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" required="required" /></td>
				</tr>
				<tr>
					<td class="info_title"><label for="work1">分管纪检之外的工作(一):</label></td>
					<td class="info2"><textarea  id="work1" name="work1"></textarea></td>
				</tr>
				<tr>
					<td class="info_title"><label for="work2">分管纪检之外的工作(二):</label></td>
					<td class="info2"><textarea  id="work2" name="work2"></textarea></td>
				</tr>
				<tr>
					<td class="info_title"><label for="work3">分管纪检之外的工作(三):</label></td>
					<td class="info2"><textarea  id="work3" name="work3"></textarea></td>
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
					<a href="javascript:void(0);" onclick="$('#pi52').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.2">
			<input type="hidden" name="pi.piname" value="pi52">
		</form> 
		
	</div>
	
	
	<div title="跟班学习" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
			<form id="pi53" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				
				<tr>
					<td class="info_title"><label for="plan">跟班学习:</label></td>
					
					<td class="info2">
							<table id="rwfg" class="easyui-datagrid" title="跟班学习" style="width:850px;height:auto"
				            data-options="singleSelect: true,toolbar:'#sb'">
						        <thead>
						            <tr>
						                <th data-options="field:'f1',width:100, editor:{type:'textbox',options:{ required:true}}" >姓名</th>
						      	        <th data-options="field:'f2',width:100, editor:{type:'textbox',options:{ required:false}}">职务</th>
						      	        <th data-options="field:'f3',width:100, editor:{type:'datebox',options:{ required:false}}">跟班学习时间</th>
						      	        <th data-options="field:'f4',width:450, editor:{type:'textbox',options:{ required:false,multiline:true,height:100}}">跟班学习内容（详情上传附件,填写附件名）</th>
						            </tr>
						        </thead>
						    </table>
						    <div id="sb" style="height:auto">
						        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append('rwfg')">新增</a>
						        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="accept('rwfg')">保存</a>
						        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit('rwfg')">删除</a>
						    </div>
						    <input type="hidden" name="rwfg">
					</td>
				</tr>
				<tr>
					<td class="info_title">（跟班学习内容）附件：</td>
					<td class="info2">
						<div class="fileInfo" id="fileInfo"></div> <input type="file"  
						name="uploadFile" alt="文件上传" id="uploadFile3" onchange="ajaxFileUpload2('uploadFile3')" /> <pre>
						<input type="hidden"  name="uploadFileJson" id="uploadFile3Json" value="data_[] ">
						</pre>
					</td>
				</tr>
				
			</table>
			<div align="center">
					<a href="javascript:void(0);" onclick="$('#pi53').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.3">
			<input type="hidden" name="pi.piname" value="pi53">
		</form> 
		
	</div>
	
</div>

<div class="projectTitle">评分标准：纪委书记分管纪检以外的工作不超过两项（0.2分），纪委书记或副书记到县纪委跟班学习（0.3分）。</div>

<script type="text/javascript">

var pconfig={
		"pi52":{"uploadfile":"uploadFile","edit":"work1,work2,work3"},
		"pi53":{"uploadfile":"uploadFile3","grid":"rwfg"}
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