<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
	
	String wimS = request.getAttribute("wimS").toString();
	String wss = request.getAttribute("wss").toString();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改单位廉政档案</title>

<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">
<style type="text/css">
.info_title {
	text-align: right;
	width: 14%;
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
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath }js/json2.js"></script>
<script type="text/javascript">
var wim = <%=wimS%>;
var wss = <%=wss%>;
var ishas = 0;
var len = 0;
var wimoldyear = 0;  //年度更改之前 的年度
var wsoldyear = 0;  //年度更改之前 的年度
var a1 = "";
var a2 = "";
var a3 = "";
function topage(url){
	
	document.myform.action = url;
	document.myform.submit();
}
  function toAddWA()
  {
	  //重大事项
	  ishas = 0;
	  a1 = $("#wimwencourage").val();
	  a2 = $("#wimwpunish").val();
	  a3 = $("#wimwyearOfCheck").val();
	  	  for(var i=0;i<wim.length;i++)
	  	  {
	  	    	if (wim[i]["years"] == wimoldyear)
	  		  {
	  	    		wim[i]["wencourage"] = a1;
	  	    		wim[i]["wpunish"] = a2;
	  	    		wim[i]["wyearOfCheck"] = a3;
	  			    ishas = 1;
	  		  }
	     }
	  	len = wim.length;
	  	  if (ishas == 0)
	  	  {
	  		  wim[len] = {};
	  		  wim[len]["wencourage"] = a1;
	  		  wim[len]["wpunish"] = a2;
	  		  wim[len]["wyearOfCheck"] = a3;
	  		  wim[len]["years"] = wimoldyear;
	  	  }
	  //工作总结
	  ishas = 0;
	    	a1 = $("#wsyearSummary").val();
	    	a2 = $("#wsreport").val();
	    	a3 = $("#wsjobs").val();
	    	for(var i=0;i<wss.length;i++)
		  	  {	  		  
		  		  if (wss[i]["years"] == wsoldyear)
		  		  {
		  			  wss[i]["yearSummary"] = a1;
		  			  wss[i]["report"] = a2;
		  			  wss[i]["jobs"] = a3;
		  			  ishas = 1;
		  			  break;
		  		  }
		  	  }
	    	
	    	len = wss.length;
		  	  if (ishas == 0)
		  	  {
		  		  wss[len] = {};
		  		  wss[len]["yearSummary"] = a1;
				  wss[len]["report"] = a2;
				  wss[len]["jobs"] = a3;
				  wss[len]["years"] = wsoldyear;
		  	  }
		 $("#wimstr").val(JSON.stringify(wim));
		 $("#wsstr").val(JSON.stringify(wss));
	  
	  if($("#myform").form("validate"))
		{
		  document.myform.submit();
		}
  }
</script>
</head>
<body>
<form id="myform" name="myform" method="post" novalidate action="workArchive!updateWorkArchive.action">
	<div id="tt" class="easyui-tabs">
		<div title="单位基础信息" style="padding: 5px;">
			<table style="width: 100%;" border="0">
				<tbody>
					<tr>
						<td class="info_title">单位名称：</td>
						<td><input class="easyui-validatebox" required="true" name="wa.wname" value="${wa.wname}" /></td>
						<td class="info_title">单位编码：</td>
						<td><input class="easyui-validatebox" name="wa.zipcode" value="${wa.zipcode}"/></td>
						<td class="info_title">负责人：</td>
						<td><input class="easyui-validatebox" name="wa.principal" value="${wa.principal}"/></td>
						
					</tr>
					<tr>
						<td class="info_title">联系电话：</td>
						<td><input class="easyui-validatebox" name="wa.phone" value="${wa.phone}"/></td>
						<td class="info_title">单位人数：</td>
						<td colspan="3"><input name="wa.peoNum"  value="${wa.peoNum}"></td>
					</tr>
					
					<tr>
						<td class="info_title">单位地址：</td>
						<td colspan="5"><input class="easyui-validatebox" style="width: 490px;" name="wa.address" value="${wa.address}"/>
							<input name="wa.id" value="${wa.id}" style="display: none;"/>
							<input name="wimS" id="wimstr" style="display: none;"/>
							<input name="wss" id="wsstr" style="display: none;"/>
						</td>
					</tr>
				</tbody>
			</table>
			<!--<div style="margin-top: 3px;">
				<table class="easyui-datagrid" title="单位成员" data-options="collapsible:true" fitColumns="true" rownumbers="true">
					<thead>
						<tr>
							<th data-options="field:'itemid',width:100">姓名</th>
							<th data-options="field:'productid',width:100">职务</th>
							<th data-options="field:'listprice',width:400">联系电话</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>张三</td>
							<td>科长</td>
							<td>1234567</td>
						</tr>
						<tr>
							<td>张三</td>
							<td>科长</td>
							<td>1234567</td>
						</tr>
						<tr>
							<td>张三</td>
							<td>科长</td>
							<td>1234567</td>
						</tr>
						<tr>
							<td>张三</td>
							<td>科长</td>
							<td>1234567</td>
						</tr>
						<tr>
							<td>张三</td>
							<td>科长</td>
							<td>1234567</td>
						</tr>
						<tr>
							<td>张三</td>
							<td>科长</td>
							<td>1234567</td>
						</tr>
						<tr>
							<td>张三</td>
							<td>科长</td>
							<td>1234567</td>
						</tr>
					</tbody>
				</table>
			</div>-->
		</div>
		<div title="单位重大事项" style="padding: 5px;">
		    <div style="margin-top: 20px; margin-left: 50px; margin-bottom: 30px;">
				<input style="width: 500px" name="wim.years" id="wimyears">
			</div>
			<table style="width: 100%; border-right: 1px solid #96B0C6; border-top: 1px solid #96B0C6;" cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td class="great_title">受奖励情况:</td>
						<td class="great_contex"><textarea rows="4" cols="80" name="wim.wencourage" id="wimwencourage"></textarea></td>
					</tr>
					<tr>
						<td class="great_title">受奖处罚情况:</td>
						<td class="great_contex"><textarea rows="4" cols="80" name="wim.wpunish" id="wimwpunish"></textarea></td>
					</tr>
					<tr>
						<td class="great_title">年度考核情况:</td>
						<td class="great_contex"><textarea rows="4" cols="80" name="wim.wyearOfCheck" id="wimwyearOfCheck"></textarea></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div title="廉政工作总结" style="padding: 5px;">
			<div style="margin-top: 20px; margin-left: 50px; margin-bottom: 30px;">
				<input id="wsyears" style="width: 500px" name="ws.years">
			</div>

			<div id="tt2" class="easyui-tabs" style="height: 350px;" >
				<div title="年度总结">
					<textarea rows="15" cols="120" name="ws.yearSummary" id="wsyearSummary"></textarea>
				</div>
				<div title="述廉报告"><textarea rows="15" cols="120" name="ws.report" id="wsreport"></textarea></div>
				<div title="具体工作"><textarea rows="15" cols="120" name="ws.jobs" id="wsjobs"></textarea></div>
			</div>

		</div>
	</div>
	<div align="center">
	 <a href="javascript:toAddWA()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
	 <a href="javascript:topage('workArchive!toPage.action?pageName=list')" class="easyui-linkbutton" data-options="iconCls:'icon-back'">返回</a>  
</div>
</form>

<script type="text/javascript">
	  
		var rule=[];
		var year= new Date().getFullYear();
		var minYear=2012;
		while(true){
			   rule.push(minYear);
			   
			   if(minYear>=year){
				 break;  
			   }else{
				   rule.push('|'); 
				   minYear=minYear+1;
			   }
		}
	  $("#wimyears").slider({
		  "showTip":true,  
	    "rule": rule ,
	    "min":2012,
	    "max":year,
	    "step":1,
	    onChange:function(value)
	    { 
	    	ishas = 0;
	    	a1 = $("#wimwencourage").val();
	  	    a2 = $("#wimwpunish").val();
	  	    a3 = $("#wimwyearOfCheck").val();
	  	  for(var i=0;i<wim.length;i++)
	  	  {
	  	    	if (wim[i]["years"] == wimoldyear)
	  		  {
	  	    		wim[i]["wencourage"] = a1;
	  	    		wim[i]["wpunish"] = a2;
	  	    		wim[i]["wyearOfCheck"] = a3;
	  			    ishas = 1;
	  		  }
	     }
	  	  
	  	len = wim.length;
	  	  if (ishas == 0)
	  	  {
	  		  wim[len] = {};
	  		  wim[len]["wencourage"] = a1;
	  		  wim[len]["wpunish"] = a2;
	  		  wim[len]["wyearOfCheck"] = a3;
	  		  wim[len]["years"] = wimoldyear;
	  	  }
	  	
	  	  $("#wimwencourage").val("");
		  $("#wimwpunish").val("");
		  $("#wimwyearOfCheck").val("");
	  	  for(var i=0;i<wim.length;i++)
	  	  {
	  	    
	  		  if (wim[i]["years"] == value)
	  		  {        			  
	  			  $("#wimwencourage").val(wim[i]["wencourage"]);
	  			  $("#wimwpunish").val(wim[i]["wpunish"]);
	  			  $("#wimwyearOfCheck").val(wim[i]["wyearOfCheck"]);
	  			  break;
	  		  }else
	  		  {
	  			  $("#wimwencourage").val("");
	  			  $("#wimwpunish").val("");
	  			  $("#wimwyearOfCheck").val("");
	  		  }
	  	    
	  	  }
	  	  
	  	  wimoldyear = value;
	    }
	});

	$("#wsyears").slider({
		  "showTip":true,  
	    "rule":rule ,
	    "min":2012,
	    "max":year,
	    "step":1,
	    onChange:function(value)
	    {  
	    	ishas = 0;
	    	a1 = $("#wsyearSummary").val();
	    	a2 = $("#wsreport").val();
	    	a3 = $("#wsjobs").val();
	    	for(var i=0;i<wss.length;i++)
		  	  {	  		  
		  		  if (wss[i]["years"] == wsoldyear)
		  		  {
		  			  wss[i]["yearSummary"] = a1;
		  			  wss[i]["report"] = a2;
		  			  wss[i]["jobs"] = a3;
		  			  ishas = 1;
		  			  break;
		  		  }
		  	  }
	    	
	    	len = wss.length;
		  	  if (ishas == 0)
		  	  {
		  		  wss[len] = {};
		  		  wss[len]["yearSummary"] = a1;
				  wss[len]["report"] = a2;
				  wss[len]["jobs"] = a3;
				  wss[len]["years"] = wsoldyear;
		  	  }
		  	$("#wsyearSummary").val("");
			  $("#wsreport").val("");
			  $("#wsjobs").val("");
	  	  for(var i=0;i<wss.length;i++)
	  	  {	  		  
	  		 
	  		  if (wss[i]["years"] == value)
	  		  {        			  
	  			  $("#wsyearSummary").val(wss[i]["yearSummary"]);
	  			  $("#wsreport").val(wss[i]["report"]);
	  			  $("#wsjobs").val(wss[i]["jobs"]);
	  			  break;
	  		  }else
	  		  {
	  			  $("#wsyearSummary").val("");
	  			  $("#wsreport").val("");
	  			  $("#wsjobs").val("");
	  		  }
	  	    
	  	  }
	  	  
	  	  
	  	wsoldyear = value;
	    }
	});

	  for(var i=0;i<wim.length;i++)
	  {
		  if (wim[i]["years"] == $("#wimyears").val())
		  {
			  $("#wimwencourage").text( wim[i]["wencourage"]);
			  $("#wimwpunish").text(wim[i]["wpunish"]);
			  $("#wimwyearOfCheck").text(wim[i]["wyearOfCheck"]);
			  wimoldyear = $("#wimyears").val();
			  break;
		  }
	    
	  }
	  
	  for(var i=0;i<wss.length;i++)
	  {
		  if (wss[i]["years"] == $("#wsyears").val())
		  {
			  $("#wsyearSummary").text(wss[i]["yearSummary"]);
  			  $("#wsreport").text(wss[i]["report"]);
  			  $("#wsjobs").text(wss[i]["jobs"]);
  			  wsoldyear = $("#wsyears").val();
			  break;
		  }
	    
	  }
	  

	</script>
</body>
</html>