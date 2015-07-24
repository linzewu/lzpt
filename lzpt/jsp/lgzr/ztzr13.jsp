<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="easyui-tabs">
	<div title="群众接访记录" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi30" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				
				<tr>
					<td class="info_title"><label for="plan">群众接访记录:</label></td>
					
					<td class="info2">
							<table id="rwfg" class="easyui-datagrid" title="群众接访记录" style="width:850px;height:auto"
				            data-options="singleSelect: true,toolbar:'#sb'">
						        <thead>
						            <tr>
						                <th data-options="field:'f1',width:100, editor:{type:'datebox',options:{ required:true}}" >受理时间</th>
						      	        <th data-options="field:'f2',width:100, editor:{type:'textbox',options:{ required:true}}">来访群众</th>
						      	        <th data-options="field:'f2',width:100, editor:{type:'textbox',options:{ required:true}}">受理人</th>
						      	        <th data-options="field:'f4',width:450, editor:{type:'textbox',options:{ required:false}}">来访事件（详情上传附件,填写附件名）</th>
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
					<td class="info_title">接访制度或接访记录附件：</td>
					<td class="info2">
						<div class="fileInfo" id="fileInfo"></div> <input type="file"  
						name="uploadFile" alt="文件上传" id="uploadFile" onchange="ajaxFileUpload2('uploadFile')" /> <pre>
						<input type="hidden"  name="uploadFileJson" id="uploadFileJson" value="data_[] ">
						</pre>
					</td>
				</tr>
				
			</table>
			<div align="center">
					<a href="javascript:void(0);" onclick="$('#pi30').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.2">
			<input type="hidden" name="pi.piname" value="pi30">
		</form> 
	</div>
	
	<div title="受理记录" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi31" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				
				<tr>
					<td class="info_title"><label for="plan">受理记录:</label></td>
					
					<td class="info2">
							<table id="lzjz" class="easyui-datagrid" title="廉政讲座" style="width:850px;height:auto"
				            data-options="singleSelect: true,toolbar:'#sb3'">
						        <thead>
						            <tr>
						                <th data-options="field:'f4',width:100, editor:{type:'datebox',options:{ required:true}}" >处理时间</th>
						      	        <th data-options="field:'f5',width:600, editor:{type:'textbox',options:{ required:false}}">处理结果（详情上传附件,填写附件名）</th>
						      	        <th data-options="field:'f6',width:100, editor:{type:'datebox',options:{ required:false}}">向上级报告时间</th>
						            </tr>
						        </thead>
						    </table>
						    <div id="sb3" style="height:auto">
						        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append('lzjz')">新增</a>
						        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="accept('lzjz')">保存</a>
						        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit('lzjz')">删除</a>
						    </div>
						    <input type="hidden" name="lzjz">
					</td>
				</tr>
				
				<tr>
					<td class="info_title">处理结果附件：</td>
					<td class="info2">
						<div class="fileInfo" id="fileInfo"></div> <input type="file"  
						name="uploadFile" alt="文件上传" id="uploadFile3" onchange="ajaxFileUpload2('uploadFile3')" /> <pre>
						<input type="hidden"  name="uploadFileJson" id="uploadFile3Json" value="data_[] ">
						</pre>
					</td>
				</tr>
			</table>
			<div align="center">
					<a href="javascript:void(0);" onclick="$('#pi31').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.3">
			<input type="hidden" name="pi.piname" value="pi31">
		</form> 
	</div>
	
	
</div>

<div class="projectTitle">评分标准：有接访制度、接访记录（0.1分），受理来访问题及时处理（0.2分），处理来访问题情况及时向上级纪委报告（0.2分）</div>

<script type="text/javascript">

var pconfig={
		"pi30":{"uploadfile":"uploadFile","grid":"rwfg"},
		"pi31":{"uploadfile":"uploadFile3","grid":"lzjz"}
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