<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script type="text/javascript">
var sf=[{label:'建立“三单一网”工作机构，进行专题研究，此项工作不到位',value:'建立“三单一网”工作机构，进行专题研究，此项工作不到位',score:-1},
        {label:'制定工作计划，明确责任分工、目标要求和具体措施。此项工作不到位',value:'制定工作计划，明确责任分工、目标要求和具体措施。此项工作不到位',score:-1},
        {label:'权力清单编制按期完成但未公布',value:'权力清单编制按期完成但未公布',score:-0.5},
        {label:'权力清单编制公布未按期完成逾期5天内',value:'权力清单编制公布未按期完成逾期5天内',score:-1},
        {label:'权力清单编制公布未按期完成逾期5至10天',value:'权力清单编制公布未按期完成逾期5至10天',score:-1.5},
        {label:'权力清单编制公布未按期完成逾期超过10天以上或造成严重后果的',value:'权力清单编制公布未按期完成逾期超过10天以上或造成严重后果的',score:-2},
        {label:'责任清单编制按期完成但未公布',value:'责任清单编制按期完成但未公布',score:-0.5},
        {label:'责任清单编制公布未按期完成逾期5天内',value:'责任清单编制公布未按期完成逾期5天内',score:-1},
        {label:'责任清单编制公布未按期完成逾期5至10天',value:'责任清单编制公布未按期完成逾期5至10天',score:-1.5},
        {label:'责任清单编制公布未按期完成逾期超过10天以上或造成严重后果的',value:'责任清单编制公布未按期完成逾期超过10天以上或造成严重后果的',score:-2},
        {label:'各乡镇未按期完成政务服务网建设逾期10天内',value:'各乡镇未按期完成政务服务网建设逾期10天内',score:-1},
        {label:'各乡镇未按期完成政务服务网建设逾期超过10天以上或造成严重后果的',value:'各乡镇未按期完成政务服务网建设逾期超过10天以上或造成严重后果的',score:-2},
        {label:'各乡镇政府所辖部门未使用网上审批系统开展审批业务',value:'各乡镇政府所辖部门未使用网上审批系统开展审批业务',score:-2},
        {label:'各乡镇政府所辖部门未使用网上审批系统及时反馈政务服务网申报业务的受理情况',value:'各乡镇政府所辖部门未使用网上审批系统及时反馈政务服务网申报业务的受理情况',score:-0.5},
        {label:'各乡镇政府还在运行权力清单之外的权力',value:'各乡镇政府还在运行权力清单之外的权力',score:-1},
        {label:'未及时对本级政务服务网上的行政审批、便民服务、阳光政务等事项信息进行更新，网上公布的信息和实际办理存在差异',value:'未及时对本级政务服务网上的行政审批、便民服务、阳光政务等事项信息进行更新，网上公布的信息和实际办理存在差异',score:-0.5},
        {label:'乡镇政府还在运行权力清单之外的权力',value:'乡镇政府还在运行权力清单之外的权力',score:-0.5},
        {label:'乡镇便民服务中心建设未完成',value:'乡镇便民服务中心建设未完成',score:-0.5},
        {label:'吉府办字〔2015〕60号文中所列“多规合一”等专项行政审批制度改革未完成',value:'各乡镇政府还在运行权力清单之外的权力',score:-2}
        ];
</script>
<div class="easyui-tabs">
	<div title="规范权力运行" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi37" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				
				<tr>
					<td class="info_title"><label for="plan">规范权力运行:</label></td>
					
					<td class="info2">
							<table id="rwfg" class="easyui-datagrid" title="规范权力运行" style="width:850px;height:auto"
				            data-options="singleSelect: true,toolbar:'#sb'">
						        <thead>
						            <tr>
						                <th data-options="field:'f1',width:100, editor:{type:'datebox',options:{ required:true}}" >考核时间</th>
						      	        <th data-options="field:'f2',width:350, editor:{type:'combobox',options:{ required:true,valueField:'value',textField:'label',data:sf}}">未落实项</th>
						      	        <th data-options="field:'f3',width:350, editor:{type:'textbox',options:{ required:false}}">未落实情况描述(详情上传附件,填写附件名)</th>
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
					<a href="javascript:void(0);" onclick="$('#pi37').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0">
			<input type="hidden" name="pi.piname" value="pi37">
		</form> 
	</div>
	
	<div title="建设情况" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi89" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				<tr>
					<td class="info_title"><label for="network">“三单一网”建设工作实施情况:</label></td>
					<td class="info2"><textarea  id="network" name="network"></textarea></td>
				</tr>
				<tr>
					<td class="info_title"><label for="powers">权力清单编制及公布情况:</label></td>
					<td class="info2"><textarea  id="powers" name="powers"></textarea></td>
				</tr>
				<tr>
					<td class="info_title"><label for="responsible">责任清单编制及公布情况:</label></td>
					<td class="info2"><textarea  id="responsible" name="responsible"></textarea></td>
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
					<a href="javascript:void(0);" onclick="$('#pi89').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<input type="hidden" name="pi.score" value="0">
			<input type="hidden" name="pi.piname" value="pi89">
		</form> 
	</div>
	
</div>



<script type="text/javascript">

var pconfig={
		"pi37":{"uploadfile":"uploadFile","grid":"rwfg","score":{"type":"colunm","grid":"rwfg","colunm":"f2",data:sf}},
		"pi89":{"uploadfile":"uploadFile3","edit":"network,powers,responsible"}
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