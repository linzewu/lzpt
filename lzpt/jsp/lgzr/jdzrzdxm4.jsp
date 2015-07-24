<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="easyui-tabs">
	<div title="红包问题常态治理情况" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi59" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				<tr>
					<td class="info_title"><label for="date">时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" required="required" /></td>
				</tr>
				<tr>
					<td class="info_title"><label for="plan">违纪违规查处:</label></td>
					
					<td class="info2">
							<table id="rwfg" class="easyui-datagrid" title="违纪查处" style="width:850px;height:auto"
				            data-options="singleSelect: true,toolbar:'#sb'">
						        <thead>
						            <tr>
						                <th data-options="field:'f1',width:150, editor:{type:'textbox',options:{ required:true}}" >违规违纪人员</th>
						      	        <th data-options="field:'f2',width:100, editor:{type:'textbox',options:{ required:true}}">违纪人员职务</th>
						      	        <th data-options="field:'f3',width:100, editor:{type:'datebox',options:{ required:false}}">接受红包时间</th>
						      	        <th data-options="field:'f4',width:100, editor:{type:'textbox',options:{ required:false}}">接受红包金额</th>
						      	        <th data-options="field:'f5',width:300, editor:{type:'textbox',options:{ required:false}}">接受红包地点</th>
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
					<a href="javascript:void(0);" onclick="$('#pi59').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0">
			<input type="hidden" name="pi.piname" value="pi59">
		</form> 
	</div>
	
	
</div>

<div class="projectTitle">评分标准：发现并查处违纪违规问题的，此项不得分。</div>

<script type="text/javascript">

var pconfig={
		"pi59":{"uploadfile":"uploadFile","grid":"rwfg"}
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