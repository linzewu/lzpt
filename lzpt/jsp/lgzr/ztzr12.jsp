<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script type="text/javascript">
	var sf=[{label:'支部党员大会',value:'支部党员大会'},{label:'支部委员会',value:'支部委员会'},{label:'党小组会',value:'党小组会'}];
</script>

<div class="easyui-tabs">
	<div title="落实两个责任" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi27" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				
				<tr>
					<td class="info_title"><label for="plan">两个责任、党章党纪党规教育落实情况:</label></td>
					
					<td class="info2">
							<table id="lzjz" class="easyui-datagrid" title="三会一课" style="width:850px;height:auto"
				            data-options="singleSelect: true,toolbar:'#sb3'">
						        <thead>
						            <tr>
						                <th data-options="field:'f4',width:100, editor:{type:'datebox',options:{ required:true}}" >会议时间</th>
						      	        <th data-options="field:'f5',width:120, editor:{type:'combobox',options:{ required:true,valueField:'value',textField:'label',data:sf}}">会议类型</th>
						      	        <th data-options="field:'f6',width:180, editor:{type:'textbox',options:{ required:false}}">会议主题</th>
						      	        <th data-options="field:'f7',width:400, editor:{type:'textbox',options:{ required:false}}">两个责任、党章党纪党规教育落实情况（详细上传附件）</th>
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
					<a href="javascript:void(0);" onclick="$('#pi27').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="1">
			<input type="hidden" name="pi.piname" value="pi27">
		</form> 
	</div>
	
	<!-- <div title="廉政讲座" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi28" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				
				<tr>
					<td class="info_title"><label for="plan">廉政讲座:</label></td>
					
					<td class="info2">
							<table id="lzjz" class="easyui-datagrid" title="廉政讲座" style="width:850px;height:auto"
				            data-options="singleSelect: true,toolbar:'#sb3'">
						        <thead>
						            <tr>
						                <th data-options="field:'f4',width:100, editor:{type:'datebox',options:{ required:true}}" >开讲时间</th>
						      	        <th data-options="field:'f5',width:100, editor:{type:'textbox',options:{ required:false}}">开讲人</th>
						      	        <th data-options="field:'f6',width:550, editor:{type:'textbox',options:{ required:false}}">讲座主题</th>
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
					<a href="javascript:void(0);" onclick="$('#pi28').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.2">
			<input type="hidden" name="pi.piname" value="pi28">
		</form> 
	</div>
	
	<div title="廉政文化点" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
			<form id="pi29" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				
				<tr>
					<td class="info_title"><label for="addr">地点:</label></td>
					<td class="info2"><input name="title"
						class="easyui-textbox" required="required" /></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="jsqk">文化点建设情况:</label></td>
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
					<a href="javascript:void(0);" onclick="$('#pi29').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.2">
			<input type="hidden" name="pi.piname" value="pi29">
		</form> 
		
	</div> -->
	
</div>

<script type="text/javascript">

var pconfig={
		"pi27":{"uploadfile":"uploadFile","grid":"lzjz"}
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