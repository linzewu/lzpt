<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script type="text/javascript">
var sf=[{label:'乡镇政府及其工作人员，村级组织和干部损害群众利益问题被中央或省媒体通报曝光，没有及时调查处理，或者经上级调查属实',value:'乡镇政府及其工作人员，村级组织和干部损害群众利益问题被中央或省媒体通报曝光，没有及时调查处理，或者经上级调查属实',score:-2},
        {label:'省纪委在明察暗访中发现群众身边的“四风”和腐败问题',value:'省纪委在明察暗访中发现群众身边的“四风”和腐败问题',score:-1},
        {label:'市纪委在明察暗访中发现群众身边的“四风”和腐败问题',value:'市纪委在明察暗访中发现群众身边的“四风”和腐败问题',score:-0.5},
        {label:'县纪委在明察暗访中发现群众身边的“四风”和腐败问题',value:'县纪委在明察暗访中发现群众身边的“四风”和腐败问题',score:-0.2},
        {label:'问题被列为省纪委督办并查实',value:'问题被列为省纪委督办并查实',score:-2},
        {label:'问题被列为市纪委督办并查实',value:'问题被列为市纪委督办并查实',score:-1},
        {label:'问题被列为县纪委督办并查实',value:'问题被列为县纪委督办并查实',score:-0.5}
        ];
</script>	
	
<div class="easyui-tabs">

	<div title="没有严肃查处落实" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi83" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				
				<tr>
					<td class="info_title"><label for="plan">没有严肃查处落实:</label></td>
					
					<td class="info2">
							<table id="rwfg" class="easyui-datagrid" title="没有严肃查处落实" style="width:850px;height:auto"
				            data-options="singleSelect: true,toolbar:'#sb'">
						        <thead>
						            <tr>
						      	        <th data-options="field:'f2',width:300, editor:{type:'combobox',options:{ required:true,valueField:'value',textField:'label',data:sf}}">省市纪委或县纪委查实</th>
						      	        <th data-options="field:'f3',width:200, editor:{type:'textbox',options:{ required:false}}">涉及人员</th>
						      	        <th data-options="field:'f4',width:300, editor:{type:'textbox',options:{ required:false}}">腐败违纪情况描述(详情上传附件,填写附件名)</th>
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
					<a href="javascript:void(0);" onclick="$('#pi83').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<!-- 扣分制，则pi.score=0 -->
			<input type="hidden" name="pi.score" value="0">
			<input type="hidden" name="pi.piname" value="pi83">
		</form> 
	</div>

	<div title="及时处置督促落实" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi82" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				
				<tr>
					<td class="info_title"><label for="plan">及时处置督促落实:</label></td>
					
					<td class="info2">
							<table id="rwfg2" class="easyui-datagrid" title="及时处置督促落实" style="width:850px;height:auto"
				            data-options="singleSelect: true,toolbar:'#sb1'">
						        <thead>
						            <tr>
						                <th data-options="field:'f5',width:100, editor:{type:'datebox',options:{ required:true}}" >时间</th>
						      	        <th data-options="field:'f6',width:300, editor:{type:'textbox',options:{ required:true}}">四风腐败问题线索描述(详情上传附件)</th>
						      	        <th data-options="field:'f7',width:150, editor:{type:'textbox',options:{ required:false}}">责任人</th>
						      	        <th data-options="field:'f8',width:300, editor:{type:'textbox',options:{ required:false}}">处置结果(详情上传附件)</th>
						            </tr>
						        </thead>
						    </table>
						    <div id="sb1" style="height:auto">
						        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append('rwfg2')">新增</a>
						        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="accept('rwfg2')">保存</a>
						        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit('rwfg2')">删除</a>
						    </div>
						    <input type="hidden" name="rwfg2">
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
					<a href="javascript:void(0);" onclick="$('#pi82').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="4">
			<input type="hidden" name="pi.piname" value="pi82">
		</form> 
	</div>
	
	
</div>


<script type="text/javascript">

var pconfig={
		"pi83":{"uploadfile":"uploadFile","grid":"rwfg","score":{"type":"colunm","grid":"rwfg","colunm":"f2",data:sf}},
		"pi82":{"uploadfile":"uploadFile3","grid":"rwfg2"}
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