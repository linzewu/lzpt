<%@page import="com.kteam.lzpt.common.UnitUtil"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 	String units = application.getAttribute("units").toString();
 
 	JSONArray ja=JSONArray.fromObject(units);
 	
 	String unit = UnitUtil.getUnitNameById(ja, request.getParameter("unitId"));
 	
 
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文件检索</title>

<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">

<script type="text/javascript" src="${basePath }js/json2.js"></script>
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	function doSearch(text){
		
		var param={};
		if(text!=""){
			param["key"]=text;
		}
		
		var startTime = $("#startTime").datebox("getValue");
		
		var endTime=$("#endTime").datebox("getValue");
		
		if(startTime!=""){
			param["startTime"]=startTime;
		}
		
		if(endTime!=""){
			param["endTime"]=endTime;
		}
		
		
		$("#ftable").datagrid("reload",param);
	}
	
	function formatUrl(value,row,index){
		
		var fn=encodeURI(encodeURI(row.filename));
		
		var url="upload!download.action?fileId="+value+"&fn="+fn;
		
		var text="<a href='"+url+"'>下载</a>";
		
		return text;
		
	}
	
	function dateToStr(o){
		if(o!=null){
			var date=new Date(o.time);
			return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
		}else{
			return o;
		}
	}
	
</script>
</head>
<body>
	 <table class="easyui-datagrid" id="ftable" title="<%=unit %>台账附件" style="height:450px"  
            data-options="rownumbers:true,singleSelect:true,fitColumns:true,toolbar:'#tb',url:'task!searchFile.action?unitId=${param.unitId}'" >  
        <thead>  
            <tr>  
                <th data-options="field:'filename',width:320">附件名称</th>
                <th data-options="field:'uploadTime',width:80,formatter:dateToStr">上报时间</th>  
                <th data-options="field:'size',width:50">大小</th>  
                <th data-options="field:'id',width:50,formatter:formatUrl">下载</th>   
            </tr>  
        </thead>  
    </table>
    <div id="tb" style="padding:5px;height:auto">
    	<label>时间：</label><input type="text" class="easyui-datebox" id="startTime" ></input>至<input  type="text" class="easyui-datebox" id="endTime"></input>
    	<label>关键字：</label> <input class="easyui-searchbox" data-options="prompt:'请输附件关键字',searcher:doSearch" style="width:300px"></input> 
    </div>
</body>
</html>