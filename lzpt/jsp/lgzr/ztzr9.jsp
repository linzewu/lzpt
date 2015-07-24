<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="easyui-tabs">
	<div title="上级通知" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi21" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				
				<tr>
					<td class="info_title"><label for="plan">方案通知:</label></td>
					
					<td class="info2">
							<table id="rwfg" class="easyui-datagrid" title="方案通知" style="width:850px;height:auto"
				            data-options="singleSelect: true,toolbar:'#sb'">
						        <thead>
						            <tr>
						                <th data-options="field:'f1',width:100, editor:{type:'datebox',options:{ required:true}}" >上级通知时间</th>
						      	        <th data-options="field:'f2',width:200, editor:{type:'textbox',options:{ required:false}}">上级单位</th>
						      	        <th data-options="field:'f3',width:450, editor:{type:'textbox',options:{ required:false}}">通知内容概述（详情上传附件,填写附件名）</th>
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
					<a href="javascript:void(0);" onclick="$('#pi21').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.2">
			<input type="hidden" name="pi.piname" value="pi21">
		</form> 
	</div>
	<div title="开展教育活动" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi22" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				
				<tr>
					<td class="info_title"><label for="plan">教育活动:</label></td>
					
					<td class="info2">
							<table id="education" class="easyui-datagrid" title="教育活动" style="width:850px;height:auto"
				            data-options="singleSelect: true,toolbar:'#sb3'">
						        <thead>
						            <tr>
						                <th data-options="field:'f4',width:100, editor:{type:'datebox',options:{ required:true}}" >活动开展时间</th>
						      	        <th data-options="field:'f5',width:200, editor:{type:'textbox',options:{ required:false}}">教育活动主题</th>
						      	        <th data-options="field:'f6',width:450, editor:{type:'textbox',options:{ required:false}}">活动总结概述（详情上传附件,填写附件名）</th>
						            </tr>
						        </thead>
						    </table>
						    <div id="sb3" style="height:auto">
						        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append('education')">新增</a>
						        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="accept('education')">保存</a>
						        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit('education')">删除</a>
						    </div>
						    <input type="hidden" name="education">
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
					<a href="javascript:void(0);" onclick="$('#pi22').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.3">
			<input type="hidden" name="pi.piname" value="pi22">
		</form> 
	</div>
	
</div>

<div class="projectTitle">评分标准：有方案通知（0.25分），有总结等材料（0.25分）</div>

<script type="text/javascript">

var pconfig={
		"pi21":{"uploadfile":"uploadFile","grid":"rwfg"},
		"pi22":{"uploadfile":"uploadFile3","grid":"education"}
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