<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script type="text/javascript">
	var sf=[{label:'没有执行因公出国(境)计划管理规定，超预期、超批准天数及利用因私渠道出国(境)执行公务',value:'没有执行因公出国(境)计划管理规定，超预期、超批准天数及利用因私渠道出国(境)执行公务',score:-1},
	        {label:'公务用车管理不规范，发现有公车私用、新购车辆超标超编、未批先购等问题',value:'公务用车管理不规范，发现有公车私用、新购车辆超标超编、未批先购等问题',score:-1},
	        {label:'新建楼堂馆所，在2013年7月14日前未获施工许可证项目没有停建，或者2013年7月14日后违规批准(主要指发改部门的可研或初设批复、土地部门的用地批复、环保部门的环境影响评价批复、住建部门的选址意见书和施工许可证等手续)建设项目',value:'新建楼堂馆所，在2013年7月14日前未获施工许可证项目没有停建，或者2013年7月14日后违规批准(主要指发改部门的可研或初设批复、土地部门的用地批复、环保部门的环境影响评价批复、住建部门的选址意见书和施工许可证等手续)建设项目',score:-1},
	        {label:'没有按照中央文件要求，做好超标办公用房整改或者整改没到位',value:'没有按照中央文件要求，做好超标办公用房整改或者整改没到位',score:-1},
	        {label:'因公出国(境)费、公务接待费、公务用车购置及运行维护费、会议费、培训费超标或违反相关财务管理规定',value:'因公出国(境)费、公务接待费、公务用车购置及运行维护费、会议费、培训费超标或违反相关财务管理规定',score:-1},
	        {label:'没有落实县控编减编方案，未兑现财政供养人员只减不增，本年度超编进人或未按计划完成消化超编人员任务，或者超职数配备领导干部',value:'没有落实县控编减编方案，未兑现财政供养人员只减不增，本年度超编进人或未按计划完成消化超编人员任务，或者超职数配备领导干部',score:-1},
	        {label:'违反相关规定精神，在专项督查或随机抽查过程中被点名通报',value:'违反相关规定精神，在专项督查或随机抽查过程中被点名通报',score:-2}
	        ];
</script>	
	
<div class="easyui-tabs">
	<div title="落实情况" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi39" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				
				<tr>
					<td class="info_title"><label for="plan">落实情况:</label></td>
					
					<td class="info2">
							<table id="rwfg" class="easyui-datagrid" title="落实情况" style="width:850px;height:auto"
				            data-options="singleSelect: true,toolbar:'#sb'">
						        <thead>
						            <tr>
						      	        <th data-options="field:'f2',width:400, editor:{type:'combobox',options:{ required:true,valueField:'value',textField:'label',data:sf}}">未执行或违反项</th>
						      	        <th data-options="field:'f3',width:300, editor:{type:'textbox',options:{ required:false}}">未执行原因(详情上传附件,填写附件名)</th>
						      	        <th data-options="field:'f4',width:200, editor:{type:'textbox',options:{ required:false}}">备注(详情上传附件,填写附件名)</th>
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
					<a href="javascript:void(0);" onclick="$('#pi39').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<!-- 扣分制，则pi.score=0 -->
			<input type="hidden" name="pi.score" value="0">
			<input type="hidden" name="pi.piname" value="pi39">
		</form> 
	</div>
	
</div>



<script type="text/javascript">

var pconfig={
		"pi39":{"uploadfile":"uploadFile","grid":"rwfg","score":{"type":"colunm","grid":"rwfg","colunm":"f2",data:sf}}
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