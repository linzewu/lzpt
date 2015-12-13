<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="easyui-tabs">

	<div title="落实责任追究" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
			<form id="pi85" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				<tr>
					<td class="info_title"><label for="date">时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" required="required" /></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="method">制定一案双查和责任追究的办法:</label></td>
					<td class="info2"><textarea  id="method" name="method"></textarea></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="jsqk">一案双查和责任追究的操作流程:</label></td>
					<td class="info2"><textarea  id="jsqk" name="jsqk"></textarea></td>
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
					<a href="javascript:void(0);" onclick="$('#pi85').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="6">
			<input type="hidden" name="pi.piname" value="pi85">
		</form> 
		
	</div>

	<div title="实行一案双查" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi84" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				
				<tr>
					<td class="info_title"><label for="plan">实行一案双查:</label></td>
					
					<td class="info2">
							<table id="rwfg" class="easyui-datagrid" title="实行一案双查" style="width:850px;height:auto"
				            data-options="singleSelect: true,toolbar:'#sb'">
						        <thead>
						            <tr>
						                <th data-options="field:'f1',width:120, editor:{type:'textbox',options:{ required:true}}" >违纪人员</th>
						      	        <th data-options="field:'f2',width:100, editor:{type:'textbox',options:{ required:true}}">违纪人员职务</th>
						      	        <th data-options="field:'f3',width:300, editor:{type:'textbox',options:{ required:false}}">违纪情况描述(详情上传附件)</th>
						      	        <th data-options="field:'f4',width:150, editor:{type:'textbox',options:{ required:false}}">相关领导</th>
						      	        <th data-options="field:'f5',width:300, editor:{type:'textbox',options:{ required:false}}">领导责任情况(详情上传附件)</th>
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
					<a href="javascript:void(0);" onclick="$('#pi84').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0">
			<input type="hidden" name="pi.piname" value="pi84">
		</form> 
	</div>
	
	
</div>


<script type="text/javascript">

var pconfig={
		"pi85":{"uploadfile":"uploadFile2","edit":"method,jsqk"},
		"pi84":{"uploadfile":"uploadFile","grid":"rwfg"}
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