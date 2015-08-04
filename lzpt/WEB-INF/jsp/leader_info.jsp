<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kteam.lzpt.entity.User"%>
	<%@page import="com.kteam.lzpt.common.UnitUtil"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);

	String units = application.getAttribute("units").toString();
	User user=(User)session.getAttribute("user");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改干部基础信息</title>
<link rel="stylesheet" type="text/css"
	href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${basePath }js/themes/icon.css">
<style type="text/css">
.info_title {
	text-align: right;
	width: 14%;
	color: #890C1A
}

.great_title {
	width: 18%;
	text-align: center;
	height: 50px;
	border-left: 1px solid #96B0C6;
	border-bottom: 1px solid #96B0C6;
}

.great_contex {
	border-left: 1px solid #96B0C6;
	border-bottom: 1px solid #96B0C6;
	padding-left: 10px;
}

.great_image {
	width: 120px;
	border-left: 1px solid #96B0C6;
	border-bottom: 1px solid #96B0C6;
	text-align: center;
}
</style>


<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath }js/json2.js"></script>
<script type="text/javascript" src="${basePath }js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${basePath }js/upload/ajaxfileupload.js"></script>
<script type="text/javascript" src="${basePath }js/dataCode.js"></script>
<script type="text/javascript" src="${basePath }js/lzpt/leaderinfo_manager.js"></script>

</head>
<body>
	<form action="cadreArchive!updateCadreArchive.action" id="myform" name="myform"
		method="post" enctype="multipart/form-data">
		<input name="cimStr" id="cimStr" style="display: none;" /> 
		<input name="cwsStr" id="cwsStr" style="display: none;" /> 
		<input name="weStr" id="weStr" style="display: none;" /> 
		<input name="teStr" id="teStr" style="display: none;" /> 
		<input name="rpStr" id="rpStr" style="display: none;" /> 
		<input name="ca.id" value="${ca.id}" id="caId"  style="display: none;" />
		<div id="tt" class="easyui-tabs">
			<div title="干部基础信息" style="padding: 5px;">
					<div
				style="margin-left: auto; margin-right: auto; vertical-align: middle; width: 780px; min-height: 400px;">
				<div style="float: left;">
					<img alt="照片" src="${basePath }images/p.png"
						style="width: 100px; height: 120px;" id="cadreImg1"><br />
					 <input
						type="hidden" value=""  name="ca.filesToJson" id="taskFiles">
				</div>
				<div style="float: left;">
					<table style="width: 630px" border="0" class="base_table">
						<tbody>
							<tr>
								<td class="info_title">姓名：</td>
								<td class="info"><input name="ca.cname" required="true" value="${ca.cname} "
									class="easyui-validatebox single_input" /></td>
								<td class="info_title">性别：</td>
								<td class="info"><select name="ca.csex">
										<option value="1"   ${ca.csex== '1'? "selected='selected'":""}>男</option>
										<option value="0" ${ca.csex== '0'? "selected='selected'":""}>女</option>
								</select></td>
							</tr>
							<tr>
								<td class="info_title">民族：</td>
								<td class="info"><input name="ca.nation"
									class="single_input"  value="${ca.nation}" /></td>
								<td class="info_title">出生年月：</td>
								<td class="info"><input class="easyui-datebox single_input"
									name="ca.cbirthday"  value="<fmt:formatDate value="${ca.cbirthday}" pattern="yyyy-MM-dd"/>"/></td>

							</tr>
							<tr>
								<td class="info_title">政治面貌：</td>
								<td class="info"><input name="ca.politicalStatus"
									 class="single_input"  value="${ca.politicalStatus }"></td>
								<td class="info_title">参加工作时间：</td>
								<td class="info"><input name="ca.worktime"
									class="easyui-datebox single_input" value="<fmt:formatDate value="${ca.worktime}" pattern="yyyy-MM-dd"/>" /></td>
							</tr>
							<tr>
								<td class="info_title">身份证：</td>
								<td class="info"><input name="ca.idCard"
									class="single_input" value="${ca.idCard}" /></td>
								<td class="info_title">入党时间：</td>
								<td class="info"><input name="ca.joinparty"
									class="easyui-datebox single_input"  value="<fmt:formatDate value="${ca.joinparty }" pattern="yyyy-MM-dd"/>"/></td>
							</tr>
							<tr>
								<td class="info_title">学历：</td>
								<td class="info"><input name="ca.education"
									class="single_input"  value="${ca.education }"/></td>
								<td class="info_title">职称：</td>
								<td class="info"><input name="ca.major"
									class="single_input" value="${ca.major }" /></td>

							</tr>
							<tr>
								<td class="info_title">电话：</td>
								<td class="info"><input name="ca.phone"
									class="single_input" value="${ca.phone }" /></td>
								<td class="info_title">在职情况：</td>
								<td class="info">
								<input name="ca.workState"
									  type="radio"  value="0"  ${ca.workState== '0'? "checked='checked'":""} />在职<br/>
								<input name="ca.workState"
									  type="radio"  value="1" ${ca.workState== '1'? "checked='checked'":""} />已退出现职尚未办理退休手续
								</td>
							</tr>
							<tr>
								<td class="info_title">工作单位：</td>
								<td class="info"><input id="workArchives" name="ca.wa.id"
									type="hidden" value="${user.unitId }" /><%=UnitUtil.getUnitNameById(user.getUnitId())%></td>
								<td class="info_title">现任职位：</td>
								<td class="info"><input name="ca.job"
									class="single_input" value="${ca.job}" /></td>
							</tr>
							<tr>
								<td class="info_title">婚姻状况：</td>
								<td class="info" colspan="3">
									<input name="ca.marriageState"
									  	type="radio"  value="0"  ${ca.marriageState=='0'? "checked='checked'":""} />未婚
									<input name="ca.marriageState"
									    type="radio"  value="1" ${ca.marriageState=='1'? "checked='checked'":""} />已婚
									 <input name="ca.marriageState"
									    type="radio"  value="2" ${ca.marriageState=='2'? "checked='checked'":""} />离异
									  <input name="ca.marriageState"
									    type="radio"  value="3"  ${ca.marriageState=='3'? "checked='checked'":""} />丧偶
								</td>
							</tr>
							<tr>
								<td class="info_title">户籍地：</td>
								<td class="info" colspan="3"><input name="ca.nativeplace"
									class="single_input_long"  value="${ca.nativeplace }"/></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			</div>
			<div title="领导干部有关事项报告表一" style="padding: 5px;">
				<div id="leaderReport1" class="easyui-tabs" data-options=" onSelect:leaderReport1TabSelect">
					<div title="1、婚姻变化情况" style="padding: 5px; min-height: 300px">
							<%@ include file="/WEB-INF/jsp/leader-extend/marriageChangeInfo.jsp"  %>
					</div>
					<div title="2、持有因私出国（境）证件情况" style="padding: 5px;min-height: 300px">
						<%@ include file="/WEB-INF/jsp/leader-extend/go_abroad_credentials.jsp"  %>
					</div>
					<div title="3、因私出国（境）的情况" style="padding: 5px;min-height: 300px">
						<%@ include file="/WEB-INF/jsp/leader-extend/go_abroad_situation.jsp"  %>
					</div>
					<div title="4、子女与外国人、无国籍人通婚的情况" style="padding: 5px;min-height: 300px">
						<%@ include file="/WEB-INF/jsp/leader-extend/ChildrenMarryForeigner.jsp"  %>
					</div>
					<div title="5、子女与港澳以及台湾居民通婚的情况" style="padding: 5px;min-height: 300px">
						<%@ include file="/WEB-INF/jsp/leader-extend/ChildrenMarryHongkong.jsp"  %>
					</div>
					<div title="6、配偶与子女移居国（境）外的情况" style="padding: 5px;min-height: 300px">
						<%@ include file="/WEB-INF/jsp/leader-extend/familyMigrateInfo.jsp"  %>
					</div>
					<div title="7、配偶、子女从业情况" style="padding: 5px;min-height: 300px">
						<%@ include file="/WEB-INF/jsp/leader-extend/familyJobInfo.jsp"  %>
					</div>
					<div title="8、配偶、子女被司法机关追究刑事责任的情况" style="padding: 5px;min-height: 300px">
						<%@ include file="/WEB-INF/jsp/leader-extend/familyCriminalResponsibilityInfo.jsp"  %>
					</div>
				</div>
			</div>
			<div title="领导干部有关事项报告表二"  style="padding: 5px;">
				<div id="leaderReport2"  class="easyui-tabs"  data-options="onSelect:leaderReport2TabSelect">
					<div title="1、本人津贴及各类奖金、津贴、补贴等" style="padding: 5px;min-height: 300px">
						<%@ include file="/WEB-INF/jsp/leader-extend/salaryAndBonusInfo.jsp"  %>
					</div>
					<div title="2、本人从事讲学、写作、咨询、审稿、劳务等所得" style="padding: 5px;min-height: 300px">
						<%@ include file="/WEB-INF/jsp/leader-extend/LabourIncomeInfo.jsp"  %>
					</div>
					<div title="3、本人、配偶及子女的房产情况" style="padding: 5px;min-height: 300px">
						<%@ include file="/WEB-INF/jsp/leader-extend/familyHousePropertyInfo.jsp"  %>
					</div>
					<div title="4、本人、配偶及子女的投资理财情况" style="padding: 5px;min-height: 300px">
					<%@ include file="/WEB-INF/jsp/leader-extend/investmentFinancing.jsp"  %>
					</div>
					<div title="5、配偶及子女的投资非上市公司、企业情况" style="padding: 5px;min-height: 300px">
						<%@ include file="/WEB-INF/jsp/leader-extend/familyCompanyInfo.jsp"  %>
					</div>
					<div title="6、配偶及子女注册个体工商户、个人独资企业或合作企业情况" style="padding: 5px;min-height: 300px">
						<%@ include file="/WEB-INF/jsp/leader-extend/familyRegisterEnterpriseInfo.jsp"  %>
					</div>
				</div>
			</div>
			<div title="工作及培训经历" style="padding: 5px;">
					<div id="worktrainexperien" class="easyui-tabs" data-options="onSelect:exprienceTabSelect">
						<div title="工作经历" style="padding: 5px;min-height: 300px">
							<%@ include file="/WEB-INF/jsp/leader-extend/workexprience.jsp"  %>
						</div>
						<div title="培训经历" style="padding: 5px;min-height: 300px">
							<%@ include file="/WEB-INF/jsp/leader-extend/trainexperien.jsp"  %>
						</div>
					</div>
			</div>
			<div title="述责述廉报告" style="padding: 5px;">
				<div
					style="margin-left: auto; margin-right: auto; vertical-align: middle; width: 750px; min-height: 400px;">
					<div
					style="margin-top: 20px; margin-left: 50px; margin-bottom: 30px;">
					<input id="cwsyears" style="width: 650px" />
					<input id="workSummaryId"  type="hidden"  />
				</div>
				<textarea rows="20" cols="120" id="cwsyearSummary"></textarea>
				</div>
			</div>
		</div>
	</form>

	<script type="text/javascript">
	
	//禁用输入款
	$("input").attr("disabled","disabled");
	$("select").attr("disabled","disabled");
	
	//重新设置扩展表格的初始化参数
	$("input[name=isInit]").each(function(i,n){
		var ids = $(n).attr("tableId").split(",");
		$.each(ids,function(i,n){
			var opt="fitColumns:true,singleSelect: true,url:'cadreArchive!getLeaderInfoExtend.action?lex.actionType="+n+"&lex.leaderInfoId=${ca.id}'";
			$("#"+n).attr("data-options",opt);
		});
	});
	$("div[id$=Tool]").remove();
	
$(function() {
	CKEDITOR.replace('cwsyearSummary', {
		skin : 'office2003'
	});
	 var rule=[];
	  var year= new Date().getFullYear();
	  var minYear=2004;
	  while(true){
		   rule.push(minYear);
		   if(minYear>=year){
			 break; 
		   }else{
			   minYear=minYear+1;
		   }
	  }
	  
	  //述责述廉报告拖动的按钮可用
	$("#cwsyears").removeAttr("disabled");
	$("#cwsyears").slider({
		"showTip" : true,
		"rule" : rule,
		"min" : 2004,
		"max" : year,
		"step" : 1,
		onChange : function(value) {
			$.messager.progress({ 
		        title: '请稍等', 
		        msg: '数据加载中......', 
		        text: '拼命读取.......' 
		    });
			$.post("cadreArchive!getLeaderInfoExtend.action?lex.actionType=cadreWorkSummary&lex.leaderInfoId=${ca.id}&lex.year="+value,
				function(data){
					$.messager.progress('close');
					if(data.rows!=null&&data.rows.length!=0){
						CKEDITOR.instances.cwsyearSummary.setData(data.rows[0]['lex.yearSummary']);
						$("#workSummaryId").val(data.rows[0]['lex.id']);
					}else if(data.rows!=null&&data.rows.length==0){
						CKEDITOR.instances.cwsyearSummary.setData('');
						$("#workSummaryId").val('');
					}else{
						$.messager.alert("提示", "数据加载错误，请刷新页面重试！", "error");
					}
				},"json");
		}
	});
	$("#cwsyears").slider("setValue",year);
 	var lima = '${ca.filesToJson}';
	if (null != lima && '' != lima)
	{
		var obj = jQuery.parseJSON(lima);
		$("#taskFiles").val(lima);
		$("#cadreImg1").attr("src","${basePath }uploadCadre/"+obj.id);
	}
});
	</script>
</body>
</html>