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
<title>领导班子、领导干部落实党风廉政建设责任制民主测评汇总表</title>
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
</head>
<script type="text/javascript">
var date=[];

for( var j=0,i=2012;i<=2050;i++,j++){
	date[j]={"year":i};
}


$(function(){
	$("#dg").datagrid({
			url:'taskLzcp!getLeaderByYea.action',
			rownumbers:true,
			title:'领导班子、领导干部落实党风廉政建设责任制民主测评汇总表',
			fitColumns:true,
			singleSelect:true,
			showFooter: true ,
			toolbar:"#tb"

		});
	});
	
	function satisfied(val,row){
		var count = row.satisfiedCount+row.ordinaryCount+row.unsatisfiedCount;
		return ((row.satisfiedCount/count)*100).toFixed(2)+"%";
	}
	
	function ordinary(val,row){
		var count = row.satisfiedCount+row.ordinaryCount+row.unsatisfiedCount;
		return ((row.ordinaryCount/count)*100).toFixed(2)+"%";
	}
	
	function unsatisfied(val,row){
		var count = row.satisfiedCount+row.ordinaryCount+row.unsatisfiedCount;
		return ((row.unsatisfiedCount/count)*100).toFixed(2)+"%";
	}
	
	function formatterUnit(val,row){
		return val.unit.wname;
	}
	
	function serarch(){
		
		var year = $("#year").combobox("getValue");
		
		if(year!=""){
			$("#dg").datagrid("reload",{"year":year});
		}
		
	}
	
</script>
<body>
<table id="dg" style="height: 450px;" >  
     <thead>  
        <tr>  
            <th colspan="3">项目</th>  
            <th colspan="6">民主测评情况</th>  
        </tr>  
        <tr>
            <th colspan="3">领导班子</th>
		    <th data-options="field:'satisfiedCount',width:50"  rowspan="2">满意票数</th>
		    <th data-options="field:'satisfied',width:50" formatter="satisfied" rowspan="2">满意率</th>
		    <th data-options="field:'ordinaryCount',width:50" rowspan="2">基本满意票数</th>
		    <th data-options="field:'ordinary',width:50" formatter="ordinary" rowspan="2">基本满意率</th>
		    <th data-options="field:'unsatisfiedCount',width:50" rowspan="2">不满意票数</th>
		    <th data-options="field:'unsatisfied',width:50" formatter="unsatisfied" rowspan="2">不满意率</th>        	
        </tr>
        <tr>
            <th data-options="field:'name',width:50" >姓名</th>
            <th data-options="field:'zc',width:50" >现任职务</th>
             <th data-options="field:'tlr',width:50" formatter="formatterUnit" >单位</th>
        </tr>
      </thead>   
     <tfoot>
     	<tr>
     		<td colspan="2">发出表数：</td>
      		<td colspan="3">收回表数：</td>
      		<td colspan="3">回收率：</td>
     	</tr>
     	<tr>
     	    <td>备注</td>
     		<td colspan="7">评定方法："满意"得票率在90%以上的评为"满意";"满意"、"基本满意"得票率之和在85%以上，或满意率达50%以上的评为"基本满意";"满意"、"基本满意"得票率之和在84%以下，或不满意率达40%以上的评为"不满意",弃权票计入总票数计算。</td>
     	</tr>
     </tfoot>
       
</table>

<div id="tb">
	<label>年份：</label><input id="year" class="easyui-combobox"  data-options="valueField:'year',textField:'year',data:date">
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="serarch()">统计</a>
</div>

</body>
</html>
