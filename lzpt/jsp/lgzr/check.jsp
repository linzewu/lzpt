<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript">

function checkQuery(){
	
	var year = $("#year").combobox("getValue");
	if(year==""){
		$.messager.alert("提示","请选择需要抽查项目的年份！");
		return;
	}
	var maxResults = $("#quantity").combobox("getValue");
	
	var unit=$("#unit").combobox("getValue");
	
	var projectType=$("#projectTypeBox").combobox("getValue");
	
	var param={};
	
	param["maxResults"]=maxResults;
	
	param["pro.year"]=year;
	
	if(unit!=""){
		param["pro.unit"]=unit;
	}
	
	if(projectType!=""){
		param["pro.projectType"]=projectType;
	}
	
	$("#checkList").datagrid("reload",param);
}

function gFormatter(g){
	
	var title;
	if(g=="1"){
		title="主体责任 >>基础工作项目";
	}else if(g=="2"){
		title="主体责任>>重点考核项目";
	}else if(g=="3"){
		title="监督责任>>基础工作项目";
	}else if(g=="4"){
		title="监督责任>>重点考核项目";
	}
	return title;
}

function clearQuery(){
	 $("#year").combobox("clear");
	 $("#unit").combobox("clear");
	 $("#projectTypeBox").combobox("clear");
}

var pid;

var maxScore=0;

var project;

function toCheck(grid){
	
	var row = $("#"+grid).datagrid("getSelected");
	if(!row){
		$.messager.alert("提示","请选择要审阅的项目");
		return;
	}
	
	pid =row["id"];
	project=row;
	$("#win").window("open");
	
	var projectType;
	
	$.each(projectTypes,function(i,n){
		if(projectTypes[i].id==row['projectType']){
			projectType = projectTypes[i];
		}
	});
	
	maxScore=projectType.maxScore;
	
	$("#pinfo").panel("refresh",projectType.page);

}

function dataLoad(){
	
	var isLoadOver=true;
	
/* 	$.each($("input[name='pro.id']"),function(i,n){
		var piid = $(n).val();
		if(piid!=""){
			window.clearInterval(intervalId);
			isLoadOver=true;
			return false;
		}
	}) */
	$("#checkTable").empty();
	
	if(isLoadOver){
		
		var sumscore= 0;
		
		$.each($("#pinfo").panel("panel").find(".easyui-tabs").tabs("tabs"),function(i,n){
			
			var tr=$("<tr></tr>");
			
			var title=n.panel("options").title;
			
			var score=n.find("input[name='pi.score']").val();
			
			sumscore=Number(sumscore+Number(score));
			
			var piid=n.find("input[name='pi.id']").val();
			
			tr.append("<td class='info_title'><label>"+title+":</label></td>");
			
			tr.append("<td class=\"info2\">"+score+"分</td>");
			
			
			$("#checkTable").append(tr);
			$.messager.progress("close"); 
		});
		
		$("#checkTable").append("<tr><td class='info_title'><label>合计：</label></td><td class=\"info2\">"+(sumscore<0?0:sumscore.toFixed(2))+"分</td></tr>");
		
		
		var checkbox = "<tr>"+
			"<td class=\"info_title\"><label for=\"check\">审核意见:</label></td>"+
			"<td class=\"info2\"><input id=\"check\" type=\"text\" class=\"easyui-textbox\" style=\"width:600px;height: 50px;\" data-options=\"multiline:true\" prompt=\"请输入审核意见\" >"+
		"</tr>";
		
		var numberbox="<tr><td class=\"info_title\"><label >审核得分:</label></td><td><input id=\"checkScore\" name=\"checkScore\" class=\"easyui-numberbox\" prompt=\"请输入审核得分\"  data-options=\"min:0,precision:2,max:"+maxScore+"\"></td></tr>";
		
		$("#checkTable").append(numberbox);
		$("#checkTable").append(checkbox);
		$.parser.parse('#checkTable');
		
		if(project.checkInfo&&project.checkInfo!=""){
			var obj=$.parseJSON(project.checkInfo);
			$("#check").textbox("setValue",obj.check);
			$("#checkScore").numberbox("setValue",obj.checkScore);
		}
	}
}

var intervalId;

function pinfoLoad(){
	$.messager.progress({title:"数据加载中"}); 
	$("#pinfo").find("div[align=center] a").hide();
	dataLoad();
	
//	intervalId=window.setInterval(dataLoad,1000);
	
}

function onekey(){
	
	$("#check").textbox("setValue","审核通过，提交的数据与资料符合评分标准！");
	$("#checkScore").numberbox("setValue",project.score);
	
	$("#checkButton").click();
}


function checkSave(){
	
	var checkScore = $("#checkScore").numberbox("getValue");
	
	var check = $("#check").textbox("getValue");
	
	if(checkScore==""){
		$.messager.alert("提示","请输入审核得分");
		return;
	}
	
	if(check==""){
		$.messager.alert("提示","请输入审核意见");
		return;
	}
	
	$.messager.confirm('请确认', '提交审阅得分后，该项目得分将被确定，您是否提交审阅结果?', function(r){
		if (r){
			var checkInfo=JSON.stringify({"check":$("#check").val(),"checkScore":$("#checkScore").val()});
			$.post("/lzpt/project!saveProjectCheck.action",{"pro.id":pid,"pro.checkInfo":checkInfo,"pro.score":$("#checkScore").val()},function(data){
				if(data.success){
					checkQuery();
					$.messager.confirm("提示","保存成功,是否关闭窗口？",function(r1){
						if(r1){
							$("#win").window('close');
						}
					});
				}
			});
		}
	});
}

function queryProject(){
	
	var year2=$("#year2").combobox("getValue");
	var unit2=$("#unit2").combobox("getValue");
	
	var queryParams ={'pro.isCheck':1};
	
	if(year2&&year2!=""){
		queryParams['pro.year']=year2;
	}
	
	if(unit2&&unit2!=""){
		queryParams['pro.unit']=unit2;
	}
	
	$("#checkedList").datagrid("reload",queryParams);
}


</script>
    
 <div id="checktt" class="easyui-tabs" >
    <div title="随机抽查" style="padding:10px;height: 400px;">
    	<table id="checkList" class="easyui-datagrid"   data-options="url:'/lzpt/project!getUncheckProject.action',border:true,singleSelect:true,fit:true,fitColumns:true,footer:'#ft',toolbar:'#tb'">
			<thead>
				<tr>
					<th data-options="field:'projectType'" formatter="formatterProject" width="100">项目名称</th>
					<th data-options="field:'year'" width="30">年份</th>
					<th data-options="field:'unit'" width="30" formatter="unitFormatter">单位</th>
					<th data-options="field:'createTime'" width="30">上报时间</th>
					<th data-options="field:'createUser'" width="30">上报人</th>
					<th data-options="field:'isCheck'" width="30"  formatter="isCheckFormatter">是否已被审阅</th>
					<th data-options="field:'score'" width="30">得分</th>
				</tr>
			</thead>
		</table>
    </div>
     <div title="已抽查项目" style="padding:10px;height: 400px;">
	     <table id="checkedList" class="easyui-datagrid"   data-options="url:'/lzpt/project!getProjects.action',border:true,singleSelect:true,fit:true,fitColumns:true,queryParams:{'pro.isCheck':1},footer:'#ft2',toolbar:'#tb2'">
			<thead>
				<tr>
					<th data-options="field:'projectType'" formatter="formatterProject" width="100">项目名称</th>
					<th data-options="field:'year'" width="30">年份</th>
					<th data-options="field:'unit'" width="30" formatter="unitFormatter">单位</th>
					<th data-options="field:'createTime'" width="30">上报时间</th>
					<th data-options="field:'createUser'" width="30">上报人</th>
					<th data-options="field:'isCheck'" width="30"  formatter="isCheckFormatter">是否已被审阅</th>
					<th data-options="field:'score'" width="30">得分</th>
				</tr>
			</thead>
		</table>
     </div>
</div>
 <div id="tb" style="padding:2px 5px;">
 	<div>
                            年份: <input id="year" class="easyui-combobox" panelHeight="auto" data-options="data:years"  style="width:100px" valueField="value" textField="label" prompt="请选择年份" />
                              抽查数量: 
        <input id="quantity" class="easyui-combobox" panelHeight="auto" style="width:100px" data-options="data:quantity"   valueField="value" textField="label" value="10" />
                              单位: 
        <input id="unit" class="easyui-combobox" panelHeight="auto" style="width:100px" data-options="data:units"   valueField="id" textField="wname" prompt="随机" />
        
   </div>
   <div>
   	    考核项目: 
     <input id="projectTypeBox" class="easyui-combobox"  style="width:400px" data-options="data:projectTypes,groupFormatter:gFormatter"   valueField="id" textField="name" groupField='group' prompt="随机"/>
   	 <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="checkQuery()">随机抽查</a>
   	  <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="clearQuery()">清除条件</a>
   </div>
 </div>
 
<div id="tb2" style="padding:2px 5px;">
                            年份: <input id="year2" class="easyui-combobox" panelHeight="auto" style="width:100px" data-options="data:years"  valueField="value" textField="label"  />
                            单位: 
        <input id="unit2" class="easyui-combobox" panelHeight="auto" style="width:100px" data-options="data:units"   valueField="id" textField="wname"   />
        <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="queryProject()">查询</a>
 </div>
<div id="ft" style="padding:2px 5px;">
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="toCheck('checkList')">审阅</a>
</div>

<div id="ft2" style="padding:2px 5px;">
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="toCheck('checkedList')">审阅</a>
</div>
<div id="win" class="easyui-window" style="width:80%;height:600px" title="审阅" data-options="iconCls:'icon-edit',modal:true,closed:true">
	<div id="pinfo" class="easyui-panel" data-options="onLoad:pinfoLoad"
        style="width:100%;height:50%;padding:10px;background:#fafafa;">
	</div>
	<div id="p2" class="easyui-panel" title="项目审阅" 
        style="width:100%;height:50%;padding:5px;background:#fafafa;"
        data-options="iconCls:'icon-edit'">
        <table class="base_table" cellpadding="0"  cellspacing="0" style="width: 98%" id="checkTable">
		</table>
		<div style="text-align: center;">
			<a  href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id="checkButton"  onclick="checkSave()">审核</a>
			<a  href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'"  onclick="onekey()">一键通过</a>
			<a  href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"  onclick="javascript:$('#win').window('close');">关闭</a>
		</div>
	</div>
</div>