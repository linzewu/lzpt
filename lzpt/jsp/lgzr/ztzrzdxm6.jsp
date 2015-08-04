<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="easyui-tabs">
	<div title="落实八项规定和约法三章" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi39" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				<tr>
					<td class="info_title"><label for="date">时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" required="required" /></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="plan">座谈会</label></td>
					
					<td class="info2">
							<table id="rwfg" class="easyui-datagrid" title="座谈会" style="width:850px;height:auto"
				            data-options="singleSelect: true,toolbar:'#sb'">
						        <thead>
						            <tr>
						                <th data-options="field:'f1',width:100, editor:{type:'datebox',options:{ required:true}}" >时间</th>
						      	        <th data-options="field:'f2',width:150, editor:{type:'textbox',options:{ required:true}}">会议主持人</th>
						      	        <th data-options="field:'f3',width:200, editor:{type:'textbox',options:{ required:false}}">座谈会主题</th>
						      	        <th data-options="field:'f4',width:350, editor:{type:'textbox',options:{ required:false}}">会议内容(详情上传附件,填写附件名)</th>
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
					<td class="info_title"><label for="eightrules">落实八项规定精神举措:</label></td>
					<td class="info2"><textarea  id="eightrules" name="eightrules"></textarea></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="threepoint">落实约法三章精神举措:</label></td>
					<td class="info2"><textarea  id="threepoint" name="threepoint"></textarea></td>
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
					<a href="javascript:void(0);" onclick="$('#pi39').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="10">
			<input type="hidden" name="pi.piname" value="pi39">
		</form> 
	</div>
	
	
</div>

<div class="projectTitle">评分标准：此项工作由县委办公室、县政府办公室、县纪委监察局负责评分，并上报到本系统。出现违纪案件的乡镇此项不得分。</div>


<script type="text/javascript">

var pconfig={
		"pi39":{"uploadfile":"uploadFile","grid":"rwfg","edit":"eightrules,threepoint"}
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