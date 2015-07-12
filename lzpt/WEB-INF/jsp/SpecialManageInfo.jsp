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
	});
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
										<span name="be.unitId" class="readField"></span> 
									</td>
									<td class="info_title">姓名：</td>
									<td class="info"><span name="be.name" class="readField"></span> </td>
								</tr>
								<tr>
									<td class="info_title">身份证：</td>
									<td class="info"><span name="be.idCard" class="readField"></span> </td>
									<td class="info_title">性别：</td>
									<td class="info"><span name="be.sex" dataKey="sex" class="dataFormater readField"></span></td>
								</tr>

								<tr>
									<td class="info_title">年龄：</td>
									<td class="info"><span name="be.age" class="readField"></span></td>
									<td class="info_title">级别：</td>
									<td class="info"><span name="be.level"  dataKey="jobLevel" class="dataFormater readField"></span>
									</td>
								</tr>
								<tr>
									<td class="info_title">职务：</td>
									<td class="info" colspan="3"><span name="be.job" class="readField"></span>
									<input type="hidden" name="be.id"></td>
								</tr>
							</tbody>
						</table>
						<div align="center">
							<a href="baseManager!SpecialManageList!toPage.action" class="easyui-linkbutton" data-options="iconCls:'icon-back'">返回</a>
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
													                fitColumns:true">
				<thead>
					<tr>
						<th
							data-options="field:'be.handInDate',editor:{
																						 options:{
																                                required:true
																                            },
																                         type:'datebox'
																                     },
																                     width : 60 ">上交时间</th>
						<th
							data-options="field:'be.handInMoney',editor:{
																						 type:'numberbox',options:{
																                         	required:true,
																                          precision:2,
																                         max:999999999999,
																                         min:0}
																                     },
																                     width : 60">上交金额</th>
						<th
							data-options="field:'be.acceptDate',editor:{
																						 options:{
																                                required:true
																                            },
																                         type:'datebox'
																                     },
																                     width : 60">接受时间</th>
						<th
							data-options="field:'be.acceptMoney',editor:{
																                         type:'numberbox',options:{
																                         	required:true,
																                          precision:2,
																                         max:999999999999,
																                         min:0}
																                     },width : 60">接受金额</th>										                     
						<th
							data-options="field:'be.acceptAddr',editor:{
																                        type:'validatebox',options:{
																                         	required:true}
																                     },width : 200,">接受地点</th>										                     
					</tr>
				</thead>
			</table>
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
					                autoRowHeight:false,
					                nowrap:false,
					                fitColumns:true">
				<thead>
					<tr>
						<th
							data-options="field:'be.handInDate',editor:{
																						 options:{
																                                required:true
																                            },
																                         type:'datebox'
																                     },
																                     width : 60 ">上交时间</th>
						<th
							data-options="field:'be.handInMoney',editor:{
																						 type:'numberbox',options:{
																                         	required:true,
																                          precision:2,
																                         max:999999999999,
																                         min:0}
																                     },
																                     width : 60">上交金额</th>
						<th
							data-options="field:'be.projectName',editor:{
																						 options:{
																                                required:true
																                            },
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
		
		
		</div>
		
		
		

	</div>

</body>
</html>