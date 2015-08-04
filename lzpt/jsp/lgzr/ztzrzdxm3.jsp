<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script type="text/javascript">
	var sf=[{label:'主要负责人违纪',value:'主要负责人违纪',score:-3},{label:'主要负责人违纪并移送司法',value:'主要负责人违纪并移送司法',score:-6},{label:'其他科级干部违纪',value:'其他科级干部违纪',score:-2},{label:'其他科级干部违纪并移送司法',value:'其他科级干部违纪并移送司法',score:-4}];
</script>
<div class="easyui-tabs">
	<div title="管好班子带好队伍" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi36" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				<tr>
					<td class="info_title"><label for="date">时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" required="required" /></td>
				</tr>
				<tr>
					<td class="info_title"><label for="plan">违纪查处:</label></td>
					
					<td class="info2">
							<table id="rwfg" class="easyui-datagrid" title="违纪查处" style="width:850px;height:auto"
				            data-options="singleSelect: true,toolbar:'#sb'">
						        <thead>
						            <tr>
						                <th data-options="field:'f1',width:100, editor:{type:'datebox',options:{ required:true}}" >查处时间</th>
						      	        <th data-options="field:'f2',width:100, editor:{type:'textbox',options:{ required:true}}">查处人员</th>
						      	        <th data-options="field:'f3',width:100, editor:{type:'textbox',options:{ required:false}}">查处人员职务</th>
						      	        <th data-options="field:'f4',width:200, editor:{type:'combobox',options:{ required:true,valueField:'value',textField:'label',data:sf}}">是否负责人(移送司法)</th>
						      	        <th data-options="field:'f6',width:300, editor:{type:'textbox',options:{ required:false,multiline:true,height:100}}">查处结果</th>
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
					<a href="javascript:void(0);" onclick="$('#pi36').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0">
			<input type="hidden" name="pi.piname" value="pi36">
		</form> 
	</div>
	
	
</div>

<div class="projectTitle">评分标准：党政主要负责人当年因违纪违规受查处的，一人次扣3分，移送司法的，一人次扣6分。其他科级干部当年受查处的，一人次扣2分，移送司法的，一人次扣4分。主动提供案件线索，并积极配合上级查处的，或者主动查处的不扣分。扣完为止。</div>

<script type="text/javascript">

var pconfig={
		"pi36":{"uploadfile":"uploadFile","grid":"rwfg","score":{"type":"colunm","grid":"rwfg","colunm":"f4",data:sf}}
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