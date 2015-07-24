<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="easyui-tabs">
	
	
	<div title="查办案件工作合力" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
			<form id="pi54" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				<tr>
					<td class="info_title"><label for="date">时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" required="required" /></td>
				</tr>
				<tr>
					<td class="info_title"><label for="plan">查办案件:</label></td>
					
					<td class="info2">
							<table id="rwfg" class="easyui-datagrid" title="查办案件" style="width:850px;height:auto"
				            data-options="singleSelect: true,toolbar:'#sb'">
						        <thead>
						            <tr>
						                <th data-options="field:'f1',width:100, editor:{type:'datebox',options:{ required:true}}" >查办时间</th>
						      	        <th data-options="field:'f2',width:100, editor:{type:'textbox',options:{ required:false}}">查办人员</th>
						      	        <th data-options="field:'f3',width:100, editor:{type:'textbox',options:{ required:false}}">查办人员职务</th>
						      	        <th data-options="field:'f4',width:450, editor:{type:'textbox',options:{ required:false}}">查办人员违纪事件(详情上传附件,填写附件名)</th>
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
					<td class="info_title">(违纪事件详情)附件：</td>
					<td class="info2">
						<div class="fileInfo" id="fileInfo"></div> <input type="file"  
						name="uploadFile" alt="文件上传" id="uploadFile3" onchange="ajaxFileUpload2('uploadFile3')" /> <pre>
						<input type="hidden"  name="uploadFileJson" id="uploadFile3Json" value="data_[] ">
						</pre>
					</td>
				</tr>
				
			</table>
			<div align="center">
					<a href="javascript:void(0);" onclick="$('#pi54').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.5">
			<input type="hidden" name="pi.piname" value="pi54">
		</form> 
		
	</div>
	
</div>

<div class="projectTitle">评分标准：全年完成县纪委指导性办案计划，禾川镇、里田镇、怀忠镇、石桥镇各3件，其他乡镇各2件（0.5分），每少完成1件扣0.3分，扣完为止。</div>

<script type="text/javascript">

var pconfig={
		"pi54":{"uploadfile":"uploadFile3","grid":"rwfg"}
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