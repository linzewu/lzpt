<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="easyui-tabs">
	<div title="反腐败工作任务分工" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi47" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				<tr>
					<td class="info_title"><label for="date">时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" required="required" /></td>
				</tr>
				<tr>
					<td class="info_title"><label for="division">全年反腐败工作任务分工:</label></td>
					<td class="info2"><textarea  id="division" name="division"></textarea></td>
				</tr>
				
				<tr>
					<td class="info_title">(工作任务分工表)附件：</td>
					<td class="info2">
						<div class="fileInfo" id="fileInfo"></div> <input type="file"  
						name="uploadFile" alt="文件上传" id="uploadFile" onchange="ajaxFileUpload2('uploadFile')" /> <pre>
						<input type="hidden"  name="uploadFileJson" id="uploadFileJson" value="data_[] ">
						</pre>
					</td>
				</tr>
				
			</table>
			<div align="center">
					<a href="javascript:void(0);" onclick="$('#pi47').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.1">
			<input type="hidden" name="pi.piname" value="pi47">
		</form> 
	</div>
	
	<div title="落实党风廉政建设督查" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi48" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
			
				
				<tr>
					<td class="info_title"><label for="date">时间:</label></td>
					<td class="info2"><input name="date"
						class="easyui-datebox" required="required" /></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="work1">党风廉政和反腐败工作任务分工的通知:</label></td>
					<td class="info2"><textarea  id="work1" name="work1"></textarea></td>
				</tr>
				
				<tr>
					<td class="info_title"><label for="work2">督查的主要内容:</label></td>
					<td class="info2"><textarea  id="work2" name="work2"></textarea></td>
				</tr>
				<tr>
					<td class="info_title"><label for="work3">时间安排和督查的主要方法:</label></td>
					<td class="info2"><textarea  id="work3" name="work3"></textarea></td>
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
					<a href="javascript:void(0);" onclick="$('#pi48').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.2">
			<input type="hidden" name="pi.piname" value="pi48">
		</form> 
	</div>
	<div title="是否有干部违纪" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
			<form id="pi49" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				<tr>
					<td class="info_title"><label for="plan">违纪案件:</label></td>
					
					<td class="info2">
							<table id="rwfg" class="easyui-datagrid" title="违纪案件" style="width:850px;height:auto"
				            data-options="singleSelect: true,toolbar:'#sb'">
						        <thead>
						            <tr>
						                <th data-options="field:'f1',width:100, editor:{type:'datebox',options:{ required:true}}" >时间</th>
						      	        <th data-options="field:'f2',width:100, editor:{type:'textbox',options:{ required:true}}">违纪人员</th>
						      	        <th data-options="field:'f3',width:100, editor:{type:'textbox',options:{ required:false}}">违纪人员职务</th>
						      	        <th data-options="field:'f4',width:450, editor:{type:'textbox',options:{ required:false}}">违纪问题描述(详情上传附件,填写附件名)</th>
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
						name="uploadFile" alt="文件上传" id="uploadFile3" onchange="ajaxFileUpload2('uploadFile3')" /> <pre>
						<input type="hidden"  name="uploadFileJson" id="uploadFile3Json" value="data_[] ">
						</pre>
					</td>
				</tr>
				
			</table>
			<div align="center">
					<a href="javascript:void(0);" onclick="$('#pi49').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0.2">
			<input type="hidden" name="pi.piname" value="pi49">
		</form> 
		
	</div>
	
</div>

<div class="projectTitle">评分标准：对全年反腐败工作进行了分工（0.1分），有通知、有督查、有落实（0.2分），没有发现干部违纪案件（0.2分），有1件案件扣0.3分，每多1件扣0.3分，扣完为止</div>

<script type="text/javascript">

var pconfig={
		"pi47":{"uploadfile":"uploadFile","edit":"division"},
		"pi48":{"uploadfile":"uploadFile2","edit":"work1,work2,work3"},
		"pi49":{"uploadfile":"uploadFile3","grid":"rwfg","score":{"type":"count","grid":"rwfg","score":-0.3}}
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