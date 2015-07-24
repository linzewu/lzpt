<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">

var sf=[{label:'未掌握或不报告案件线索',value:'未掌握或不报告案件线索',score:5},{label:'办案安全事故',value:'办案安全事故',score:7},{label:'办案安全事故人员死亡',value:'办案安全事故人员死亡',score:13}];
</script>
<div class="easyui-tabs">
	<div title="查办案件工作、线索处置和落实案件查办" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
			<form id="pi55" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				<tr>
					<td class="info_title"><label for="date">时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" required="required" /></td>
				</tr>
				<tr>
					<td class="info_title"><label for="plan">案件查办:</label></td>
					
					<td class="info2">
							<table id="rwfg" class="easyui-datagrid" title="查办案件" style="width:850px;height:auto"
				            data-options="singleSelect: true,toolbar:'#sb'">
						        <thead>
						            <tr>
						                <th data-options="field:'f1',width:200, editor:{type:'combobox',options:{ required:true,valueField:'value',textField:'label',data:sf}}" >案件情况</th>
						      	        <th data-options="field:'f2',width:100, editor:{type:'textbox',options:{ required:false}}">涉及人员</th>
						      	        <th data-options="field:'f3',width:200, editor:{type:'textbox',options:{ required:false}}">地点</th>
						      	        <th data-options="field:'f4',width:300, editor:{type:'textbox',options:{ required:false}}">事件描述（详情上传附件,填写附件名）</th>
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
					<td class="info_title">（案件详情）附件：</td>
					<td class="info2">
						<div class="fileInfo" id="fileInfo"></div> <input type="file"  
						name="uploadFile" alt="文件上传" id="uploadFile" onchange="ajaxFileUpload2('uploadFile')" /> <pre>
						<input type="hidden"  name="uploadFileJson" id="uploadFileJson" value="data_[] ">
						</pre>
					</td>
				</tr>
				
			</table>
			<div align="center">
					<a href="javascript:void(0);" onclick="$('#pi55').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="13">
			<input type="hidden" name="pi.piname" value="pi55">
		</form> 
		
	</div>
	
	
</div>

<div class="projectTitle">评分标准：按照要求向县纪委报告涉及县管干部的案件线索，未掌握或不报告案件线索，被上级纪委查出违纪违法案件的，每起扣5分。纪检组织发生办案安全事故，导致人员死亡的，每起扣13分，未导致人员死亡的，每起扣7分，扣完为止。</div>

<script type="text/javascript">

var pconfig={
		"pi55":{"uploadfile":"uploadFile","grid":"rwfg"}
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