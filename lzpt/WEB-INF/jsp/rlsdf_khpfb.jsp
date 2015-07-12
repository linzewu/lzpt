<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>落实党风廉政建设责任制工作考核评分表</title>
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/menu.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/nav.css">
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
</head>
<script type="text/javascript">
$(function(){
	$("#dg").datagrid({
			url:'js/jsonfile/rlsdf_khpfb.json',
			rownumbers:true,
			title:'落实党风廉政建设责任制工作考核评分表',
			singleSelect:true,
			showFooter: true  
		}); 
	
	});
</script>
<body>

<table id="dg" style="height: 450px;">
	<thead frozen="true">
		<tr >
			  <th data-options="field:'town',width:120" rowspan="2" >乡镇\\考核项目</th>  
		</tr>
	</thead>  
     <thead>  
        <tr>  
		   <th colspan="2">组织领导</th>  
		   <th colspan="2">责任分工</th>  
		   <th colspan="2">责任考核</th>  
		   <th colspan="2">责任追究</th>  
		   <th data-options="field:'scores',width:90" rowspan="2">得分</th>  
		   <th data-options="field:'rank',width:90" rowspan="2">排名</th>  
        </tr>  
        <tr>
           <th data-options="field:'setup',width:240">成立（或调整）责任制工作领导小组（   分）</th>
		   <th data-options="field:'arrange',width:240">制定反腐败工作实施意见，并召开会议部署（   分）</th>
		   <th data-options="field:'summarize',width:150">报送责任制工作总结（   分）</th>
		   <th data-options="field:'division',width:150">将反腐败任务进行分工（   分）</th>
		   <th data-options="field:'finished',width:240">各承包领导、承包单位完成了分工任务（   分）</th>
		   <th data-options="field:'cadreCheck',width:240">对村班子和干部执行责任制情况进行考核</th>
		   <th data-options="field:'apply',width:150">对考核结果进行运用（   分）</th>
		   <th data-options="field:'workable',width:150">落实"一案双查"规定（   分）</th>
        </tr>
      </thead>  
</table>

</body>
</html>
