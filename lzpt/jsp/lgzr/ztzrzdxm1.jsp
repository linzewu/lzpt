<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	var sf=[{label:'中央部委查办',value:'中央部委查办',score:-5},{label:'省委、省政府、省纪委直接查办',value:'省委、省政府、省纪委直接查办',score:-5},{label:'省委、省政府、省纪委督办,市纪委直接查办',value:'省委、省政府、省纪委督办,市纪委直接查办',score:-3},{label:'市纪委、市委、市政府督办，县纪委直接查办',value:'市纪委、市委、市政府督办，县纪委直接查办',score:-2}];
</script>	
	
<div class="easyui-tabs">
	<div title="治理损害群众利益的突出问题" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi34" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				<tr>
					<td class="info_title"><label for="date">时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" required="required" /></td>
				</tr>
				<tr>
					<td class="info_title"><label for="plan">重大事件或事故:</label></td>
					
					<td class="info2">
							<table id="rwfg" class="easyui-datagrid" title="重大事件或事故" style="width:850px;height:auto"
				            data-options="singleSelect: true,toolbar:'#sb'">
						        <thead>
						            <tr>
						                <th data-options="field:'f1',width:100, editor:{type:'datebox',options:{ required:true}}" >发生时间</th>
						      	        <th data-options="field:'f2',width:250, editor:{type:'combobox',options:{ required:true,valueField:'value',textField:'label',data:sf}}">事件查办级别</th>
						      	        <th data-options="field:'f3',width:350, editor:{type:'textbox',options:{ required:false}}">事件描述(详情上传附件,填写附件名)</th>
						      	        <th data-options="field:'f4',width:100, editor:{type:'datebox',options:{ required:false}}">处理时间</th>
						      	        <th data-options="field:'f5',width:350, editor:{type:'textbox',options:{ required:false}}">事件处理结果(详情上传附件,填写附件名)</th>
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
					<a href="javascript:void(0);" onclick="$('#pi34').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="5">
			<input type="hidden" name="pi.piname" value="pi34">
		</form> 
	</div>
	
	
</div>


<script type="text/javascript">

var pconfig={
		"pi34":{"uploadfile":"uploadFile","grid":"rwfg","score":{"type":"colunm","grid":"rwfg","colunm":"f2",data:sf}}
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