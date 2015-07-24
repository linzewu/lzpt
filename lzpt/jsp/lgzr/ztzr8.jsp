<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="easyui-tabs">
	<div title="履行一岗双责情况" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi18" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				
				<tr>
					<td class="info_title"><label for="plan">履行情况:</label></td>
					
					<td class="info2">
							<table id="rwfg" class="easyui-datagrid" title="履行情况" style="width:850px;height:auto"
				            data-options="singleSelect: true,toolbar:'#sb'">
						        <thead>
						            <tr>
						                <th data-options="field:'f1',width:100, editor:{type:'datebox',options:{ required:true}}" >时间</th>
						      	        <th data-options="field:'f2',width:100, editor:{type:'textbox',options:{ required:true}}">责任人</th>
						      	        <th data-options="field:'f3',width:550, editor:{type:'textbox',options:{ required:true}}">一岗双责履行情况（详情上传附件,填写附件名）</th>
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
					<td class="info_title"><label for="perform">履行一岗双责情况:</label></td>
					<td class="info2"><textarea  id="perform" name="perform"></textarea></td>
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
					<a href="javascript:void(0);" onclick="$('#pi18').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.1">
			<input type="hidden" name="pi.piname" value="pi18">
		</form> 
	</div>
	<div title="反腐倡廉工作督促指导" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
			<form id="pi19" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				<tr>
					<td class="info_title"><label for="date">时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" required="required" /></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="addr">地点:</label></td>
					<td class="info2"><input name="title"
						class="easyui-textbox" required="required" /></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="persons">参加会议人员:</label></td>
					<td class="info2"><input name="title"
						class="easyui-textbox" /></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="minutes">会议记录:</label></td>
					<td class="info2"><textarea  id="minutes" name="minutes"></textarea></td>
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
					<a href="javascript:void(0);" onclick="$('#pi19').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.1">
			<input type="hidden" name="pi.piname" value="pi19">
		</form> 
		
	</div>
	<div title="驻村干部案件" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi20" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				
				<tr>
					<td class="info_title"><label for="plan">驻村干部案件:</label></td>
					
					<td class="info2">
							<table id="zcgbaj" class="easyui-datagrid" title="驻村干部案件" style="width:850px;height:auto"
				            data-options="singleSelect: true,toolbar:'#sb3'">
						        <thead>
						            <tr>
						                <th data-options="field:'f4',width:100, editor:{type:'datebox',options:{ required:true}}" >立案时间</th>
						      	        <th data-options="field:'f5',width:100, editor:{type:'textbox',options:{ required:false}}">违纪人员</th>
						      	        <th data-options="field:'f6',width:550, editor:{type:'textbox',options:{ required:false}}">违纪情况（详情上传附件,填写附件名）</th>
						            </tr>
						        </thead>
						    </table>
						    <div id="sb3" style="height:auto">
						        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append('zcgbaj')">新增</a>
						        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="accept('zcgbaj')">保存</a>
						        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit('zcgbaj')">删除</a>
						    </div>
						    <input type="hidden" name="zcgbaj">
					</td>
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
					<a href="javascript:void(0);" onclick="$('#pi20').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.3">
			<input type="hidden" name="pi.piname" value="pi20">
		</form> 
	</div>
</div>

<div class="projectTitle">评分标准：乡镇班子成员要根据分工认真履行“一岗双责”（0.1分）。对所驻村反腐倡廉工作进督促指导，有会议记录等相关材料（0.1分），没有驻村干部案件（0.3分），有1件案件扣0.3分，每多1件扣0.3分，扣完为止</div>

<script type="text/javascript">

var pconfig={
		"pi18":{"uploadfile":"uploadFile","grid":"rwfg","edit":"perform"},
		"pi19":{"uploadfile":"uploadFile2","edit":"minutes"},
		"pi20":{"uploadfile":"uploadFile3","grid":"zcgbaj"}
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