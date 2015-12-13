<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script type="text/javascript">
	var sf=[{label:'对专业性、技术性较强的事项，没有进行专家论证、技术咨询、决策评估，或者对与人民群众利益密切相关的事项，没有实行听证和公示制度，导致重大事故或重大群体性事件',value:'对专业性、技术性较强的事项，没有进行专家论证、技术咨询、决策评估，或者对与人民群众利益密切相关的事项，没有实行听证和公示制度，导致重大事故或重大群体性事件',score:-1},
	        {label:'选拔任用干部时，没有按要求事先征求同级纪检监察机关意见，或没有执行重要人事任免无记名投票表决制度',value:'选拔任用干部时，没有按要求事先征求同级纪检监察机关意见，或没有执行重要人事任免无记名投票表决制度',score:-1},
	        {label:'“三重一大”事项没有提交党委常委会(党组会)或政府常务会(部门行政会)讨论决定，涉及全局和长远问题没有提交全委会或政府全体会议研究讨论',value:'“三重一大”事项没有提交党委常委会(党组会)或政府常务会(部门行政会)讨论决定，涉及全局和长远问题没有提交全委会或政府全体会议研究讨论',score:-1},
	        {label:'班子成员没有向领导班子报告“三重一大”事项决策制度执行情况，未列入民主生活会和述职述廉重要内容',value:'没有按照中央文件要求，做好超标办公用房整改或者整改没到位',score:-1},
	        {label:'对“三重一大”事项决策结果，没有书面通知有关部门及人员的，或者“三重一大”事项决策及执行情况，除依法应保密的外，没有在相应范围内公开',value:'对“三重一大”事项决策结果，没有书面通知有关部门及人员的，或者“三重一大”事项决策及执行情况，除依法应保密的外，没有在相应范围内公开',score:-1}
	        ];
</script>		
	
<div class="easyui-tabs">
	<div title="三重一大制度执行情况" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi41" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				
				<tr>
					<td class="info_title"><label for="plan">三重一大制度执行情况:</label></td>
					
					<td class="info2">
							<table id="rwfg" class="easyui-datagrid" title="三重一大制度执行情况" style="width:850px;height:auto"
				            data-options="singleSelect: true,toolbar:'#sb'">
						        <thead>
						            <tr>
						      	        <th data-options="field:'f2',width:350, editor:{type:'combobox',options:{ required:true,valueField:'value',textField:'label',data:sf}}">未执行项</th>
						      	        <th data-options="field:'f4',width:200, editor:{type:'textbox',options:{ required:false}}">事件描述(详情上传附件,填写附件名)</th>
						      	        <th data-options="field:'f3',width:300, editor:{type:'textbox',options:{ required:false}}">未执行情况(详情上传附件,填写附件名)</th>
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
					<a href="javascript:void(0);" onclick="$('#pi41').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<!-- 扣分制，则pi.score=0 -->
			<input type="hidden" name="pi.score" value="0">
			<input type="hidden" name="pi.piname" value="pi41">
		</form> 
	</div>
	
	
</div>



<script type="text/javascript">

var pconfig={
		"pi41":{"uploadfile":"uploadFile","grid":"rwfg","score":{"type":"colunm","grid":"rwfg","colunm":"f2",data:sf}}
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