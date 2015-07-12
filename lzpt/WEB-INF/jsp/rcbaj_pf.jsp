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
<title>查办案件考核评分表</title>
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/menu.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/nav.css">
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
</head>
<script type="text/javascript">


/**{title:'评分标准',width:100},   
{title:'完成县纪委下达任务得满分（查处一案多人的每件加5分，答案每件加10分，查处后移送司法机关并追究刑事责任每件再加10分。）多办一件每件加5分。',colspan:5}*/

$(function(){
	 $("#dg").datagrid({
		    url:'js/jsonfile/rcbaj_pf.json',
			rownumbers:true,
			title:'查办案件考核评分表',
			fitColumns:true,
			singleSelect:true,
			onClickRow: onClickRowPunish,
			showFooter: true  
		}); 

});
var editIndexP = undefined;
function endEditingPunish(){  
    if (editIndexP == undefined){return true}  
    if ($('#dg').datagrid('validateRow', editIndexP)){  
        $('#dg').datagrid('endEdit', editIndexP);  
        editIndexP = undefined;  
        return true;  
    } else {  
        return false;  
    }  
}  
function onClickRowPunish(index){  
    if (editIndexP != index){  
        if (endEditingPunish()){  
            $('#dg').datagrid('selectRow', index)  
                    .datagrid('beginEdit', index);  
            editIndexP = index;  
        } else {  
            $('#dg').datagrid('selectRow', editIndexP);  
        }  
    }  
}  

</script>
<body>
<table id="dg" style="height: 450px;">
	<thead>  
            <tr>  
                <th data-options="field:'town',width:120,editor:{type:'text'}">乡镇</th>  
                <th data-options="field:'taskCount',width:90,align:'center',editor:{type:'text'}">任务数</th>  
                <th data-options="field:'finishCount',width:250,align:'center',editor:{type:'text'}">完成数</th>  
                <th data-options="field:'quotaCount',width:60,align:'center',editor:{type:'text'}">差欠（-）或超额（+）数</th>
                <th data-options="field:'score',width:60,align:'center',editor:{type:'text'}">得分</th>
                <th data-options="field:'rank',width:60,align:'center',editor:{type:'text'}">排名</th>  
            </tr>  
        </thead>
</table>
</body>
</html>
