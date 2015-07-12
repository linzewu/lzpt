<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					url:"evaluate!getListByYearAndUnit.action?year="+newValue,
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
	
	function save(){
		var year=$("#lyoyear").combobox("getValue");
		if(year==null||year==""){
			$.messager.alert("提示","请选择年份");
		}else{
			var data = $("#dg").datagrid("getData").rows;
			
			var evaluates=[];
			for(var i=0;i<data.length;i++){
				var evaluate={};
				var value=$("input[name='"+i+"evaluate']:checked").val();
				if(value=="undefined"||value==""||value==null){
					$.messager.alert("提示","请为"+data[i].win+"窗口评价！");
					return
				}
				else{
					evaluate.year=year;
					evaluate.win=data[i].win;
					evaluate.evaluate=value;
					evaluates[i]=evaluate;
				}
			}
			var strEvaluates = JSON.stringify(evaluates);
			
			$.ajax({
				type : "POST",
				url : "evaluate!add.action",
				data:{"strEvaluates":strEvaluates},
				success : function(msg) {
					if(msg=="success"){
						$.messager.alert("提示","上报成功");
					}
				}
			});
			
		}
	}
	
</script>
<body>
 <table id="dg" title="行政服务中心各窗口评价" class="easyui-datagrid"  
            toolbar="#toolbar"  rownumbers="true" fitColumns="true" singleSelect="true" >  
        <thead>  
            <tr>  
                <th field="win" width="20" >窗口名称</th>
                <th field="evaluate1" width="30" align="center" formatter="toCheck1" >满意</th>  
                <th field="evaluate2" width="30" align="center" formatter="toCheck2" >基本满意</th>
                <th field="evaluate3" width="30" align="center" formatter="toCheck3" >不满意</th>
            </tr>  
        </thead>  
  </table>  
  
   <div id="toolbar">
      <div>  
       	年度: <input  style="width:150px" name="year" id="lyoyear" >
       	<a href="javaScript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="save()">上报</a>
      </div>
    </div>

</body>
</html>