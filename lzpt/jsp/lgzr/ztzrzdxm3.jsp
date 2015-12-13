<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script type="text/javascript">
var sf=[{label:'未组织开展选人用人工作方面自查或监督检查',value:'未组织开展选人用人工作方面自查或监督检查',score:-2},
        {label:'市委组织部选人用人工作专项检查反馈意见中的主要问题整改落实不及时、不到位',value:'市委组织部选人用人工作专项检查反馈意见中的主要问题整改落实不及时、不到位',score:-0.5},
        {label:'上级组织部门批转的涉及选人用人问题要查核并报结果的举报件，未按时上报查核结果或者经查核举报问题属实',value:'上级组织部门批转的涉及选人用人问题要查核并报结果的举报件，未按时上报查核结果或者经查核举报问题属实',score:-0.5},
        {label:'发生选人用人方面违规违纪违法案件，被上级组织部门直接查处',value:'发生选人用人方面违规违纪违法案件，被上级组织部门直接查处',score:-3},
        {label:'破格提拔、领导干部近亲属及身边工作人员提拔、问责干部复出、公务员调任等应当事先报告上级组织部门审批的事项，未报告或者报告后不按上级组织部门答复意见办理',value:'破格提拔、领导干部近亲属及身边工作人员提拔、问责干部复出、公务员调任等应当事先报告上级组织部门审批的事项，未报告或者报告后不按上级组织部门答复意见办理',score:-1},
        {label:'存在超职数配备干部问题的单位，在调整干部前，未报经上级组织人事部门进行职数预审',value:'存在超职数配备干部问题的单位，在调整干部前，未报经上级组织人事部门进行职数预审',score:-2}
        ];
</script>
<div class="easyui-tabs">
	<div title="选好用好干部情况" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi36" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				
				<tr>
					<td class="info_title"><label for="plan">选好用好干部情况:</label></td>
					
					<td class="info2">
							<table id="rwfg" class="easyui-datagrid" title="选好用好干部情况" style="width:850px;height:auto"
				            data-options="singleSelect: true,toolbar:'#sb'">
						        <thead>
						            <tr>
						      	        <th data-options="field:'f2',width:400, editor:{type:'combobox',options:{ required:true,valueField:'value',textField:'label',data:sf}}">违规类型</th>
						      	        <th data-options="field:'f3',width:200, editor:{type:'textbox',options:{ required:false}}">涉及人员</th>
						      	        <th data-options="field:'f4',width:300, editor:{type:'textbox',options:{ required:false}}">违规情况描述(详情上传附件,填写附件名)</th>
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
			<!-- 扣分制，则pi.score=0 -->
			<input type="hidden" name="pi.score" value="0">
			<input type="hidden" name="pi.piname" value="pi36">
		</form> 
	</div>
	
	
</div>


<script type="text/javascript">

var pconfig={
		"pi36":{"uploadfile":"uploadFile","grid":"rwfg","score":{"type":"colunm","grid":"rwfg","colunm":"f2",data:sf}}
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