<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"   import="com.kteam.lzpt.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	User user = (User) session.getAttribute("user");
	String roleName = user.getDefaultRole().getRoleName();
	request.setAttribute("basePath", basePath);
	Date data=new Date();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	String currentDate = sdf.format(data);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>监督员评价</title>

<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">  
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath }js/dataCode.js"></script>
<script type="text/javascript" src="${basePath }js/lzpt/common.js"></script>
<script type="text/javascript">
	var currentDate=new Date();
	var tid="#EvaluationSupervision";
	$(function(){	
		$(tid).datagrid();
		$("#year").combobox("setValue",currentDate.getFullYear());
		$("#month").combobox("setValue",currentDate.getMonth()+1);
	});
	var esManager=new baseEntityManager('EvaluationSupervision','EvaluationSupervision');
	function rowClick(index){
		esManager.onClickRow(index);
	}
	function appendRow(){
		var data= {'be.evaluateDate':"<%=currentDate%>","be.evaluateName":"<%=user.getName()%>","be.evaluateAccount":"<%=user.getUserName()%>"};
		esManager.append(data);
		var index = esManager.editIndex;
		var yeared = $(tid).datagrid('getEditor', {index:index,field:'be.year'});
		var monthed= $(tid).datagrid('getEditor', {index:index,field:'be.month'});
		$(yeared.target).combobox("setValue",currentDate.getFullYear());
		$(monthed.target).combobox("setValue",currentDate.getMonth()+1);
	}
	
	function reloadTable(){
		var year = $("#year").combobox("getValue");
		var month = $("#month").combobox("getValue");
		var unit = $("#unit").combobox("getValue");
		var param={};
		if(year!=null&&year!=""){
			param['be.year']=year;
		}
		if(month!=null&&month!=""){
			param['be.month']=month;
		}
		if(unit!=null&&unit!=""){
			param['be.unit']=unit;
		}
		$(tid).datagrid("load",param);
	}
	
	
	function validateUnique(value){
		var index = esManager.editIndex;
		var yeared = $(tid).datagrid('getEditor', {index:index,field:'be.year'});
		var monthed= $(tid).datagrid('getEditor', {index:index,field:'be.month'});
		var united=$(tid).datagrid('getEditor', {index:index,field:'be.unit'});
		var account = $(tid).datagrid("getRows")[index]['be.evaluateAccount'];
		
		//目标对象不为空。。防止第一次加载空指针
		if(yeared!=null&&monthed!=null&&united!=null){
			var year = $(yeared.target).combobox("getValue");
			var month = $(monthed.target).combobox("getValue");
			var unit = $(united.target).combobox("getValue");
			
			var row= $(tid).datagrid("getRows")[esManager.editIndex];
			var flag1=year!=null&&year!=""&&month!=null&&month!=""&&unit!=null&&unit!="";
			var flag2=!(year==row['be.year']&&month==row['be.month']&&unit==row['be.unit'])
			if(flag1&&flag2){
				var param={};
				param['be.year']=year;
				param['be.month']=month;
				param['be.unit']=unit;
				param['be.evaluateAccount']=account;
				var tg=this;
				console.log(param);
				$.messager.progress({title:"数据校验",msg:"正在校验数据的有效性",text:"校验中..."});
				$.post("baseManager!!getBaseUniqueResult.action?be.actionType=EvaluationSupervision&be.queryType=ESCriterionCount"
						,param,function(data){
							$.messager.progress("close");
							if(data.state==200){
								if(data.data!=0){
									var text = $(tg).combobox("getText");
									$.messager.alert("提示","您已对单位"+text+ year+"年"+month+"月进行过评价！", "warning",function(){
										$(tg).combobox("setValue",null);
									});
								}
							}else{
								$(tg).combobox("setValue",null);
								$.messager.alert("错误","数据校验失败", "error",function(){
									$(tg).combobox("setValue",null);
								});
							}
							
						},'json');
			}
		}
	}
	
	function clearSearch(){
		$("#year").combobox("setValue",null);
		$("#month").combobox("setValue",null);
		$("#unit").combobox("setValue",null);
	}
	
	function yearFormatter(value){
		return getLabelByid("years",value);
	}
	
	function monthFormatter(value){
		return getLabelByid("months",value);
	}
	
	function unitFormatter(value){
		return getLabelByid("units",value);
	}
	function dataRejectChanage(){
		esManager.reject();
	}
	
</script>
</head>
<body>

<input name="isInit"  value="false" hidden="true"  tableId="EvaluationSupervision">
<table id="EvaluationSupervision"   data-options="
													                iconCls: 'icon-edit',
													                url:'baseManager!!getBaseEntityList.action?be.actionType=EvaluationSupervision&be.queryType=ESCriterion',
													                singleSelect: true,
													                pagination:true,
													                toolbar: '#EvaluationSupervisionTool',
													                title:'监督员评价',
													                onClickRow: rowClick,
													                onBeforeLoad:dataRejectChanage,
													                fitColumns:true">
				  <thead>
				        <tr>
				        	<th data-options="field:'be.year',editor:{
																						 options:{
																                                valueField:'value',
																                                textField:'label',
																                                data:datacode.years,
																                                required:true,
																                                editable:false,
																                                panelHeight:true
																                            },
																                         type:'combobox'
																                     },
																                     width : 30,
																                     formatter:yearFormatter">年度</th>
							<th data-options="field:'be.month',editor:{
																						 options:{
																                                valueField:'value',
																                                textField:'label',
																                                data:datacode.months,
																                                required:true,
																                                editable:false,
																                                panelHeight:true
																                            },
																                         type:'combobox'
																                     },
																                     width : 30,
																                     formatter:monthFormatter">月份</th>
							<th data-options="field:'be.unit',editor:{
																						 options:{
																                                valueField:'value',
																                                textField:'label',
																                                data:datacode.units,
																                                required:true,
																                                editable:false,
																                                panelHeight:true
																                            },
																                         type:'combobox'
																                     },
																                     width : 80,
																                     formatter:unitFormatter">单位</th>
							<th data-options="field:'be.score',editor:{
																                         type:'numberbox',options:{
																                         	required:true,
																                          precision:0,
																                         max:100,
																                         min:0}
																                     },width : 30">评价分数</th>	
							<th data-options="field:'be.evaluateExplain',editor:{
																                        type:'validatebox'
																                     },width : 200,">评价说明</th>
							<th data-options="field:'be.evaluateName',width : 30">监督员</th>									        
				        </tr>
				 </thead>
			</table>
	<div id="EvaluationSupervisionTool" style="height: auto">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-add',plain:true" onclick="appendRow()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="esManager.remove()">删除</a> <a href="javascript:void(0)"
			class="easyui-linkbutton"
			data-options="iconCls:'icon-save',plain:true" onclick="esManager.accept()">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="esManager.reject()">撤销</a>
		 <div>
          年度：<input class="easyui-combobox"   data-options="valueField:'value',  textField:'label',data:datacode.years,editable:false"  id="year" panelHeight="auto" style="width:100px" />
          月份：<input class="easyui-combobox"   data-options="valueField:'value',  textField:'label',data:datacode.months,editable:false"  id="month" panelHeight="auto" style="width:100px" />
          单位：<input class="easyui-combobox"   data-options="valueField:'value',  textField:'label',data:datacode.units,editable:false"  id="unit"  style="width:100px" />
            <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="reloadTable()">查询</a>
             <a href="#" class="easyui-linkbutton" iconCls="icon-cancel " onclick="clearSearch()">清空条件</a>
        </div>
	</div>

</body>
</html>