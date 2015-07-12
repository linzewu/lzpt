<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${basePath}js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">

<script type="text/javascript" src="${basePath}js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath}js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath}js/json2.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$(function(){
		
		$("#lyoyear").combobox({
			valueField:'id',
			textField:'text',
			multiple:false,
			editable:false,
			onChange:function(newValue,oldValue){
				
				$("#dg").datagrid({
					url:"evaluate!getListByYear.action?year="+newValue,
					onLoadSuccess:function(data){
					}
				});
				
			},
			data:[{
			    "id":2012,
			    "text":"2012"
			},{
			    "id":2013,
			    "text":"2013"
			},{
			    "id":2014,
			    "text":"2014"
			},{
			    "id":2015,
			    "text":"2015"
			},{
			    "id":2016,
			    "text":"2016"
			},{
			    "id":2017,
			    "text":"2017"
			},{
			    "id":2018,
			    "text":"2018"
			},{
			    "id":2019,
			    "text":"2019"
			},{
			    "id":2020,
			    "text":"2020"
			},{
			    "id":2021,
			    "text":"2021"
			},{
			    "id":2022,
			    "text":"2022"
			},{
			    "id":2023,
			    "text":"2023"
			},{
			    "id":2024,
			    "text":"2024"
			},{
			    "id":2025,
			    "text":"2025"
			}]
		});
	});
	
	
	
	function toCheck1(value,row,index){
		var html="<input type=radio class="+index+"evaluate name="+index+"evaluate value=1 "+(row.evaluate==1?"checked":"")+">";
		return html;
	}
	
	function toCheck2(value,row,index){
		
		var html="<input type=radio  name="+index+"evaluate  value=2 "+(row.evaluate==2?"checked":"")+">";
		return html;
	}
	function toCheck3(value,row,index){
		var html="<input type=radio  name="+index+"evaluate  value=3 "+(row.evaluate==3?"checked":"")+">";
		return html;
	}
	
	function convertEvaluate(value,row,index){
		
		if(value==0){
			return "未上报";
		}else if(value==1){
			return "满意";
		}else if(value=="2"){
			return "基本满意";
		}else if(value==3){
			return "不满意";
		}else{
			return "未知";
		}
	}
	
</script>
<body>
 <table id="dg" title="行政服务中心各窗口评价" class="easyui-datagrid"  
            toolbar="#toolbar"  rownumbers="true" fitColumns="true" singleSelect="true" >  
        <thead>  
            <tr>  
                <th field="win" width="20" >窗口名称</th>
              <c:forEach items="${units_list}" var="unit">
             	<th field="${unit.wname}" width="20" formatter="convertEvaluate" >${unit.wname}</th>
              </c:forEach>
            </tr>  
        </thead>  
  </table>  
  
   <div id="toolbar">
      <div>  
       	年度: <input  style="width:150px" name="year" id="lyoyear" >
      </div>
    </div>

</body>
</html>