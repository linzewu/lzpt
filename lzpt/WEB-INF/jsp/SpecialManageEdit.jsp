<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.kteam.lzpt.entity.User"%>
<%@page import="com.kteam.lzpt.common.UnitUtil"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
	String units = application.getAttribute("units").toString();
	User user = (User) session.getAttribute("user");
	Date data = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String currentDate = sdf.format(data);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>专项治理</title>
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/base.css">
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath }js/json2.js"></script>
<script type="text/javascript" src="${basePath }js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${basePath }js/upload/ajaxfileupload.js"></script>
<script type="text/javascript" src="${basePath }js/dataCode.js"></script>
<script type="text/javascript" src="${basePath }js/lzpt/common.js"></script>
<script type="text/javascript">
	$(function() {
		loadInfo("baseManager!!getBaseEntity.action", 'SpecialManage',
				"${param['be.id']}", "myform");
		$('#myform').form({
			onSubmit : function(param) {
				var isValid = $(this).form('validate');
				return isValid;
			},
			success : function(data) {
				var datajson = $.parseJSON(data);
				if (datajson.state == 200) {
					$.messager.alert('提示', "保存成功", 'info');
				}
			}
		});
	});
	
	
	var kicManager=new baseEntityManager('Kickbacks','Kickbacks');
	function rowClick(index){
		kicManager.onClickRow(index);
	}
	function appendRow(){
		var data= {'be.specialManageId':"${param['be.id']}"};
		kicManager.append(data);
	}
	
	function dataRejectChanage(){
		kicManager.reject();
	}
	
	var illManager=new baseEntityManager('IllegalProject','IllegalProject');
	
	function rowClick2(index){
		illManager.onClickRow(index);
	}
	function appendRow2(){
		var data= {'be.specialManageId':"${param['be.id']}"};
		illManager.append(data);
	}
	
	function dataRejectChanage2(){
		illManager.reject();
	}
	
	var gambleChecked=new baseEntityManager('GambleChecked','GambleChecked');
	
	function rowClick3(index){
		gambleChecked.onClickRow(index);
	}
	function appendRow3(){
		var data= {'be.specialManageId':"${param['be.id']}"};
		gambleChecked.append(data);
	}
	
	function dataRejectChanage3(){
		gambleChecked.reject();
	}
	
var conflictChecked=new baseEntityManager('ConflictChecked','ConflictChecked');
	
	function rowClick4(index){
		conflictChecked.onClickRow(index);
	}
	function appendRow4(){
		var data= {'be.specialManageId':"${param['be.id']}"};
		conflictChecked.append(data);
	}
	
	function dataRejectChanage4(){
		conflictChecked.reject();
	}
	
	function formatterExist(value){
		console.log(value)
		return getLabelByid("isExist",value);
	}
	
	
</script>
</head>
<body>
	<div id="tt" class="easyui-tabs" data-options="onSelect:tabOnSelect">
		<div title="专项治理 基本信息">
			<form action="baseManager!!saveBaseEntity.action" id="myform" name="myform" method="post">
				<div id="p" class="easyui-panel" style="padding: 10px; min-width: 700px; min-height: 300px;">
					<div style="margin-left: auto; margin-right: auto; vertical-align: middle; width: 680px; min-height: 400px;">
						<table style="width: 680px" border="0" class="base_table" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td class="info_title">单位：</td>
									<td class="info">
										<%
											if (user.getDefaultRole().getRoleName().equals("纪委")) {
										%> <input name="be.unitId" class="easyui-combobox" required="true"
										data-options="url:'workArchive!queryWorkArchives.action',valueField:'id',textField:'wname'" /> <%
										 	} else {
										 %> 
 									<input name="be.unitId"  class="easyui-combobox" required="true"
										data-options="url:'workArchive!queryWorkArchives.action',valueField:'id',disabled:true,textField:'wname'"
										value="<%=user.getUnitId()%>" /> <%
									 	}
									 %>
									</td>
									<td class="info_title">姓名：</td>
									<td class="info"><input name="be.name" class="easyui-validatebox" required="true" /></td>
								</tr>
								<tr>
									<td class="info_title">身份证：</td>
									<td class="info"><input name="be.idCard" class="easyui-validatebox" validType='length[15,18]' required="true" /></td>
									<td class="info_title">性别：</td>
									<td class="info"><input name="be.sex" class="easyui-combobox" required="true"
										data-options="valueField:'value',textField:'label',data:datacode.sex" /></td>
								</tr>

								<tr>
									<td class="info_title">年龄：</td>
									<td class="info"><input name="be.age" class="easyui-numberbox" data-options="min:18,max:120,precision:0" /></td>
									<td class="info_title">级别：</td>
									<td class="info"><input name="be.level" class="easyui-combobox" required="true"
										data-options="valueField:'value',textField:'label',data:datacode.jobLevel" /></td>
								</tr>
								<tr>
									<td class="info_title">职务：</td>
									<td class="info" colspan="3"><input name="be.job" class="easyui-validatebox" /> <input type="hidden" name="be.actionType"
										value="SpecialManage"> <input type="hidden" name="be.id"></td>
								</tr>
							</tbody>
						</table>
						<div align="center">
							<a href="javascript:$('#myform').submit();" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a> <a
								href="baseManager!SpecialManageList!toPage.action" class="easyui-linkbutton" data-options="iconCls:'icon-back'">返回</a>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div title="专项治理 红包自查自纠登记表">
			<input name="isInit" value="false" hidden="true" tableId="Kickbacks">
			<table id="Kickbacks"
				data-options="
													                iconCls: 'icon-edit',
													                url:'baseManager!!getBaseEntityList.action?be.actionType=Kickbacks&be.queryType=KicCriterion&be.specialManageId=${param['be.id']}',
													                singleSelect: true,
													                pagination:true,
													                toolbar: '#KickbacksTool',
													                onClickRow: rowClick,
													                onBeforeLoad:dataRejectChanage,
													                fitColumns:true">
				<thead>
					<tr>
						<th
							data-options="field:'be.checkedDate',editor:{
																						 options:{
																                                required:true
																                            },
																                         type:'datebox'
																                     },
																                     width : 60 ">自查时间</th>
						<th
							data-options="field:'be.isExist',editor:{
																                        type:'combobox',options:{
																                         	required:true,
																                         	valueField:'value',
																                         	textField:'label',
																                         	editable:false,
																                         	data:datacode.isExist}
																                     },width : 60,
																                     formatter:formatterExist">有无</th>	
						<th
							data-options="field:'be.handInDate',editor:{
																                         type:'datebox'
																                     },
																                     width : 60 ">上交时间</th>
						<th
							data-options="field:'be.handInMoney',editor:{
																						 type:'numberbox',options:{
																                          precision:2,
																                         max:999999999999,
																                         min:0}
																                     },
																                     width : 60">上交金额</th>
						<th
							data-options="field:'be.acceptDate',editor:{
																                         type:'datebox'
																                     },
																                     width : 60">接受时间</th>
						<th
							data-options="field:'be.acceptMoney',editor:{
																                         type:'numberbox',options:{
																                          precision:2,
																                         max:999999999999,
																                         min:0}
																                     },width : 60">接受金额</th>										                     
						<th
							data-options="field:'be.acceptAddr',editor:{
																                        type:'validatebox'
																                     },width : 200,">接受地点</th>	
					</tr>
				</thead>
			</table>
			<div id="KickbacksTool" style="height: auto">
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="appendRow()">添加</a> <a
					href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="kicManager.remove()">删除</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="kicManager.accept()">保存</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="kicManager.reject()">撤销</a>
			</div>
		</div>
		<div title="专项治理 违规插手工程建设自查自纠登记表">
				<input name="isInit" value="false" hidden="true" tableId="IllegalProject">
			<table id="IllegalProject"
				style="width: 1680px;"
				data-options="
					                iconCls: 'icon-edit',
					                url:'baseManager!!getBaseEntityList.action?be.actionType=IllegalProject&be.queryType=KicCriterion&be.specialManageId=${param['be.id']}',
					                singleSelect: true,
					                pagination:true,
					                toolbar: '#IllegalProjectTool',
					                onClickRow: rowClick2,
					                onBeforeLoad:dataRejectChanage2,
					                autoRowHeight:false,
					                nowrap:false,
					                fitColumns:true">
				<thead>
					<tr>
						<th
							data-options="field:'be.checkedDate',editor:{
																						 options:{
																                                required:true
																                            },
																                         type:'datebox'
																                     },
																                     width : 60 ">自查时间</th>
						<th
							data-options="field:'be.isExist',editor:{
																                        type:'combobox',options:{
																                         	required:true,
																                         	valueField:'value',
																                         	textField:'label',
																                         	editable:false,
																                         	data:datacode.isExist}
																                     },width : 60,
																                     formatter:formatterExist">有无</th>	
						<th
							data-options="field:'be.handInDate',editor:{
																                         type:'datebox'
																                     },
																                     width : 60 ">上交时间</th>
						<th
							data-options="field:'be.handInMoney',editor:{
																						 type:'numberbox',options:{
																                          precision:2,
																                         max:999999999999,
																                         min:0}
																                     },
																                     width : 60">上交金额</th>
						<th
							data-options="field:'be.projectName',editor:{
																                          type:'validatebox'
																                     },
																                     width : 100">项目名称</th>
						<th
							data-options="field:'be.checkInfo',editor:{
																                        type:'textarea'
																                     },width : 200">本人插手工程自查情况</th>										                     
						<th
							data-options="field:'be.correctionInfo',editor:{
																                        type:'textarea'
																                     },width : 200,">本人插手工程自纠情况</th>
						<th
							data-options="field:'be.relatedCheckInfo',editor:{
																                       type:'textarea'
																                     },width : 200,fixed:false">特定关系人插手工程自查情况</th>
						<th
							data-options="field:'be.relatedCorrectionInfo',editor:{
																                      type:'textarea'
																                     },width : 200,fixed:false">特定关系人插手工程自纠情况</th>										                     										                     										                     
					</tr>
				</thead>
			</table>
			<div id="IllegalProjectTool" style="height: auto">
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="appendRow2()">添加</a> <a
					href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="illManager.remove()">删除</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="illManager.accept()">保存</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="illManager.reject()">撤销</a>
			</div>
		
		
		</div>
		
		
		<div title="专项治理 参与赌博自查自纠登记表">
				<input name="isInit" value="false" hidden="true" tableId="GambleChecked">
			<table id="GambleChecked"
				data-options="
					                iconCls: 'icon-edit',
					                url:'baseManager!!getBaseEntityList.action?be.actionType=GambleChecked&be.queryType=KicCriterion&be.specialManageId=${param['be.id']}',
					                singleSelect: true,
					                pagination:true,
					                toolbar: '#GambleCheckedTool',
					                onClickRow: rowClick3,
					                onBeforeLoad:dataRejectChanage3,
					                autoRowHeight:false,
					                nowrap:false,
					                fitColumns:true">
				<thead>
					<tr>
						<th
							data-options="field:'be.checkedDate',editor:{
																						 options:{
																                                required:true
																                            },
																                         type:'datebox'
																                     },
																                     width : 60 ">自查时间</th>
						<th
							data-options="field:'be.isExist',editor:{
																                        type:'combobox',options:{
																                         	required:true,
																                         	valueField:'value',
																                         	textField:'label',
																                         	editable:false,
																                         	data:datacode.isExist}
																                     },width : 60,
																                     formatter:formatterExist">有无</th>	
						<th
							data-options="field:'be.gambleDate',editor:{
																                         type:'datebox'
																                     },
																                     width : 60 ">赌博时间</th>
						<th
							data-options="field:'be.address',editor:{
																                          type:'validatebox'
																                     },
																                     width : 120">赌博地点</th>
						<th
							data-options="field:'be.personnel',editor:{
																                          type:'validatebox'
																                     },
																                     width : 120">参与人员</th>
						<th
							data-options="field:'be.money',editor:{
																						 type:'numberbox',options:{
																                          precision:2,
																                         max:999999999999,
																                         min:0}
																                     },
																                     width : 60">赌博金额</th>										         
					</tr>
				</thead>
			</table>
			<div id="GambleCheckedTool" style="height: auto">
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="appendRow3()">添加</a> <a
					href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="gambleChecked.remove()">删除</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="gambleChecked.accept()">保存</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="gambleChecked.reject()">撤销</a>
			</div>
		
		
		</div>
		
			<div title="专项治理 防止利益冲突自查自纠登记表">
				<input name="isInit" value="false" hidden="true" tableId="ConflictChecked">
			<table id="ConflictChecked"
				data-options="
					                iconCls: 'icon-edit',
					                url:'baseManager!!getBaseEntityList.action?be.actionType=ConflictChecked&be.queryType=KicCriterion&be.specialManageId=${param['be.id']}',
					                singleSelect: true,
					                pagination:true,
					                toolbar: '#ConflictCheckedTool',
					                onClickRow: rowClick4,
					                onBeforeLoad:dataRejectChanage4,
					                autoRowHeight:false,
					                nowrap:false,
					                fitColumns:true">
				<thead>
					<tr>
						<th
							data-options="field:'be.checkedDate',editor:{
																						 options:{
																                                required:true
																                            },
																                         type:'datebox'
																                     },
																                     width : 60 ">自查时间</th>
						<th
							data-options="field:'be.isExist',editor:{
																                        type:'combobox',options:{
																                         	required:true,
																                         	valueField:'value',
																                         	textField:'label',
																                         	editable:false,
																                         	data:datacode.isExist}
																                     },width : 60,
																                     formatter:formatterExist">有无</th>	
						<th
							data-options="field:'be.conflictDate',editor:{
																                         type:'datebox'
																                     },
																                     width : 60 ">时间</th>
						<th
							data-options="field:'be.address',editor:{
																                          type:'validatebox'
																                     },
																                     width : 120">地点</th>
						<th
							data-options="field:'be.object',editor:{
																                          type:'validatebox'
																                     },
																                     width : 120">對象</th>
					</tr>
				</thead>
			</table>
			<div id="ConflictCheckedTool" style="height: auto">
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="appendRow4()">添加</a> <a
					href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="conflictChecked.remove()">删除</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="conflictChecked.accept()">保存</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="conflictChecked.reject()">撤销</a>
			</div>
		
		
		</div>
		
	</div>

</body>
</html>