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
<title>单位廉政档案详细信息</title>

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
</head>
<body>



	<div id="tt" class="easyui-tabs">
		<div title="单位基础信息" style="padding: 5px;">
			<table style="width: 100%;" border="0">
				<tbody>
					<tr>
						<td class="info_title">单位名称：</td>
						<td>${wa.wname}</td>
						<td class="info_title">单位编码：</td>
						<td>${wa.zipcode}</td>
						<td class="info_title">单位地址：</td>
						<td>${wa.address}</td>

					</tr>
					<tr>
						<td class="info_title">负责人：</td>
						<td>${wa.principal}</td>
						<td class="info_title">联系电话：</td>
						<td>${wa.phone}</td>
						<td class="info_title">单位人数：</td>
						<td>${wa.peoNum}</td>
					</tr>
				</tbody>
			</table>
			<div style="margin-top: 3px;">
				<table id="cadg" title="单位成员" data-options="collapsible:true" >
					<thead>
						<tr>
							<th data-options="field:'itemid',width:100">姓名</th>
							<th data-options="field:'productid',width:100">职务</th>
							<th data-options="field:'listprice',width:400">联系电话</th>
						</tr>
					</thead>
					
				</table>
			</div>
		</div>
		<div title="单位重大事项" style="padding: 5px;">
		   <div style="margin-top: 20px; margin-left: 50px; margin-bottom: 30px;">
				<input id="wimyears" style="width: 500px" name="wimyears">
			</div>
			<table style="width: 100%; border-right: 1px solid #96B0C6; border-top: 1px solid #96B0C6;" cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td class="great_title">受奖励情况:</td>
						<td class="great_contex" id="wimwencourage">&nbsp;</td>
					</tr>
					<tr>
						<td class="great_title">受奖处罚情况:</td>
						<td class="great_contex" id="wimwpunish">&nbsp;</td>
					</tr>
					<tr>
						<td class="great_title">年度考核情况:</td>
						<td class="great_contex" id="wimwyearOfCheck">&nbsp;</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div title="廉政工作总结" style="padding: 5px;">
			<div style="margin-top: 20px; margin-left: 50px; margin-bottom: 30px;">
				<input id= "wsyears" style="width: 500px">
			</div>

			<div id="tt2" class="easyui-tabs" style="height: 350px;" >
				<div title="年度总结" id = "wsyearSummary">
					
				</div>
				<div title="述廉报告" id="wsreport"></div>
				<div title="具体工作" id="wsjobs"></div>
			</div>

		</div>
	</div>
	
	<script type="text/javascript">
	  var wim = <%=wimS%>;
	  var wss = <%=wss%>;
	$(function(){
		
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
	  	  for(var i=0;i<wim.length;i++)
	  	  {
	  		  if (wim[i]["years"] == value)
	  		  {        			  
	  			  $("#wimwencourage").text(wim[i]["wencourage"]);
	  			  $("#wimwpunish").text(wim[i]["wpunish"]);
	  			  $("#wimwyearOfCheck").text(wim[i]["wyearOfCheck"]);
	  			  break;
	  		  }else
	  		  {
	  			  $("#wimwencourage").text("");
	  			  $("#wimwpunish").text("");
	  			  $("#wimwyearOfCheck").text("");
	  		  }
	  	    
	  	  }
	    }
	});

	$("#wsyears").slider({
		  "showTip":true,  
	    "rule": rule,
	    "min":2012,
	    "max":year,
	    "step":1,
	    onChange:function(value)
	    {        	  
	  	  for(var i=0;i<wss.length;i++)
	  	  {
	  		  if (wss[i]["years"] == value)
	  		  {        			  
	  			  $("#wsyearSummary").text(wss[i]["yearSummary"]);
	  			  $("#wsreport").text(wss[i]["report"]);
	  			  $("#wsjobs").text(wss[i]["jobs"]);
	  			  break;
	  		  }else
	  		  {
	  			  $("#wsyearSummary").text("");
	  			  $("#wsreport").text("");
	  			  $("#wsjobs").text("");
	  		  }
	  	    
	  	  }
	    }
	});
	//  alert($("#wimyears").slider('option','min'));
	  for(var i=0;i<wim.length;i++)
	  {
		  if (wim[i]["years"] == $("#wimyears").val())
		  {
			  $("#wimwencourage").text( wim[i]["wencourage"]);
			  $("#wimwpunish").text(wim[i]["wpunish"]);
			  $("#wimwyearOfCheck").text(wim[i]["wyearOfCheck"]);
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
			  break;
		  }
	    
	  }
	  
	});  	
	
	$("#cadg").datagrid({
		url:'cadreArchive!getCadreArchiveByWCID.action?wcid=${wa.id}',
		fitColumns:true,
		iconCls: 'icon-edit',  
		columns:[[  
		          {field:'cname',title:'姓名',width:100,editor:{type:'datebox'}},  
		          {field:'major',title:'职称',width:100,editor:{type:'datebox'}},  
		          {field:'phone',title:'联系电话',width:100,editor:'text'}  
		      ]]
	});
	
	</script>

</body>
</html>