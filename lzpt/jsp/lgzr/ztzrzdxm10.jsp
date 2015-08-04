<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="easyui-tabs">
	<div title="整改方案" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi43" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				<tr>
					<td class="info_title"><label for="date">时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" required="required" /></td>
				</tr>
				<tr>
					<td class="info_title"><label for="plan">整改方案:</label></td>
					
					<td class="info2">
							<table id="issue" class="easyui-datagrid" title="整改方案" style="width:850px;height:auto"
				            data-options="singleSelect: true,toolbar:'#sb'">
						        <thead>
						            <tr>
						                <th data-options="field:'f1',width:100, editor:{type:'datebox',options:{ required:true}}" >巡视发现时间</th>
						      	        <th data-options="field:'f2',width:100, editor:{type:'datebox',options:{ required:false}}">整改截止时间</th>
						      	        <th data-options="field:'f3',width:250, editor:{type:'textbox',options:{ required:false,multiline:true,height:100}}">问题描述</th>
						      	        <th data-options="field:'f4',width:300, editor:{type:'textbox',options:{ required:false,multiline:true,height:100}}">整改方案概述</th>
						            </tr>
						        </thead>
						    </table>
						    <div id="sb" style="height:auto">
						        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append('issue')">新增</a>
						        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="accept('issue')">保存</a>
						        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit('issue')">删除</a>
						    </div>
						    <input type="hidden" name="issue">
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
					<a href="javascript:void(0);" onclick="$('#pi43').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="2">
			<input type="hidden" name="pi.piname" value="pi43">
		</form> 
	</div>
	
	<div title="整改情况汇报" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi44" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				
				<tr>
					<td class="info_title"><label for="plan">整改情况:</label></td>
					
					<td class="info2">
							<table id="reform" class="easyui-datagrid" title="整改情况" style="width:850px;height:auto"
				            data-options="singleSelect: true,toolbar:'#sb3'">
						        <thead>
						            <tr>
						                <th data-options="field:'f5',width:100, editor:{type:'datebox',options:{ required:true}}" >整改时间</th>
						      	        <th data-options="field:'f6',width:200, editor:{type:'textbox',options:{ required:true,multiline:true,height:100}}">整改问题</th>
						      	        <th data-options="field:'f7',width:500, editor:{type:'textbox',options:{ required:false,multiline:true,height:100}}">整改情况汇报</th>
						            </tr>
						        </thead>
						    </table>
						    <div id="sb3" style="height:auto">
						        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append('reform')">新增</a>
						        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="accept('reform')">保存</a>
						        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit('reform')">删除</a>
						    </div>
						    <input type="hidden" name="reform">
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
					<a href="javascript:void(0);" onclick="$('#pi44').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="3">
			<input type="hidden" name="pi.piname" value="pi44">
		</form> 
	</div>
	
</div>

<div class="projectTitle">评分标准：此项工作由县委办、县政府办、县纪委监察局、县委组织部、县信访局负责评分，并上报到本系统。出现落实不力问题的乡镇此项不得分。</div>



<script type="text/javascript">

var pconfig={
		"pi43":{"uploadfile":"uploadFile","grid":"issue"},
		"pi44":{"uploadfile":"uploadFile3","grid":"reform"}
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