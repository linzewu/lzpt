<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	var sf=[{label:'未根据实际情况逐项分解落实责任，制定具体措施和操作办法，并开展落实情况监督检查',value:'未根据实际情况逐项分解落实责任，制定具体措施和操作办法，并开展落实情况监督检查',score:-3},
	        {label:'个人违反组织程序、议事决策规则直接决定应由党委(党组)或集体讨论决定事项',value:'个人违反组织程序、议事决策规则直接决定应由党委(党组)或集体讨论决定事项',score:-1},
	        {label:'没有执行领导干部外出报备和个人有关事项报告规定',value:'没有执行领导干部外出报备和个人有关事项报告规定',score:-1},
	        {label:'擅自修改或强令虚报、伪造、篡改经济社会发展统计数据',value:'擅自修改或强令虚报、伪造、篡改经济社会发展统计数据',score:-1},
	        {label:'瞒报、漏报、迟报重大突发公共事件信息',value:'瞒报、漏报、迟报重大突发公共事件信息',score:-1},
	        {label:'没有按照《党政领导干部选拔任用工作条例》规定的原则、程序和要求办事，擅自改变或拖延执行党委(党组)决定的干部任免事项，违规干预干部任免工作',value:'没有按照《党政领导干部选拔任用工作条例》规定的原则、程序和要求办事，擅自改变或拖延执行党委(党组)决定的干部任免事项，违规干预干部任免工作',score:-1},
	        {label:'对提交党委(党组)书记议事会研究的拟任人选，没有按照“一事一结论”要求如实反映拟任人选廉政情况及纪检监察机关意见的，或者对有问题反映尚未核查清楚就提交党委(党组)讨论决定的',value:'对提交党委(党组)书记议事会研究的拟任人选，没有按照“一事一结论”要求如实反映拟任人选廉政情况及纪检监察机关意见的，或者对有问题反映尚未核查清楚就提交党委(党组)讨论决定',score:-1},
	        {label:'向上级报送拟提拔或重用人选时，未对人选廉洁自律情况作出结论性评价，相关单位责任人没有就人选廉政情况和对有关信访调查核实结果签字背书的',value:'向上级报送拟提拔或重用人选时，未对人选廉洁自律情况作出结论性评价，相关单位责任人没有就人选廉政情况和对有关信访调查核实结果签字背书',score:-1},
	        {label:'擅自修改或强令虚报、伪造、篡改经济社会发展统计数据',value:'擅自修改或强令虚报、伪造、篡改经济社会发展统计数据',score:-1},
	        {label:'违法干预司法活动、插手具体案件处理，以言代法、以权压法、徇私枉法',value:'违法干预司法活动、插手具体案件处理，以言代法、以权压法、徇私枉法',score:-1}
	        ];
</script>	
	
<div class="easyui-tabs">
	<div title="落实情况" style="padding: 10px 10px 10px 10px; height: 100%;width: 100%;" >
		<form id="pi34" method="post">
			<table class="base_table" cellpadding="0"  cellspacing="0">
				
				<tr>
					<td class="info_title"><label for="plan">落实情况:</label></td>
					
					<td class="info2">
							<table id="rwfg" class="easyui-datagrid" title="落实情况" style="width:850px;height:auto"
				            data-options="singleSelect: true,toolbar:'#sb'">
						        <thead>
						            <tr>
						      	        <th data-options="field:'f2',width:400, editor:{type:'combobox',options:{ required:true,valueField:'value',textField:'label',data:sf}}">未落实项</th>
						      	        <th data-options="field:'f3',width:300, editor:{type:'textbox',options:{ required:false}}">未落实原因(详情上传附件,填写附件名)</th>
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
					<a href="javascript:void(0);" onclick="$('#pi34').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</div>
			<input type="hidden" name="pro.id">
			<input type="hidden" name="pro.projectType">
			<input type="hidden" name="pi.data">
			<input type="hidden" name="pi.id">
			<!-- 扣分制，则pi.score=0 -->
			<input type="hidden" name="pi.score" value="0">
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