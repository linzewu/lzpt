<%@page import="com.kteam.lzpt.common.UnitUtil"%>
<%@page import="com.kteam.lzpt.entity.Role"%>
<%@page import="net.sf.json.util.PropertyFilter"%>
<%@page import="net.sf.json.JsonConfig"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.kteam.lzpt.entity.User" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
	User user=(User)session.getAttribute("user");
	
	String units = application.getAttribute("units").toString();
	
 	JSONArray unitsJa=JSONArray.fromObject(units);
 	
 	String unit = UnitUtil.getUnitNameById(unitsJa, user.getUnitId());
	
	String strRole = request.getParameter("cr");
	
	if(strRole!=null){
		for(Role role:user.getRoles()){
			if(role.getId().equals(strRole)){
				user.setDefaultRole(role);
				 break;
			}
			
		}
	}
	
	String  roleName=user.getDefaultRole().getRoleName().trim();
	
	String defaultUrl="";
	
	String defaultTitle="";
	
	int defaultRoleIndex=0;
	
	int i=0;
	for(Role role:user.getRoles()){
		if(role.getRoleName().equals(roleName)){
			defaultRoleIndex=i;
			 break;
		}
		i++;
	}
	
	JSONArray ja=JSONArray.fromObject(user.getRoles());
	ja.getJSONObject(defaultRoleIndex).put("selected",true);
	
	String menuId="";
	
	if(roleName.equals("纪委")||roleName.equals("纪委工作人员")){
		menuId="sgjf";
		defaultTitle="党风政风监督";
		defaultUrl="baseManager!UnitYearBudgetList!toPage.action";
	}
	
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>廉政建设综合信息平台</title>
<link rel="stylesheet" type="text/css" href="${basePath}js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${basePath}css/menu.css">
<link rel="stylesheet" type="text/css" href="${basePath}css/nav.css">

<style type="text/css">
.tb {
	border-top: 1px solid #CCC;
	border-left: 1px solid #CCC;
	width: 100%;
}

.tb td{
	border-bottom: 1px solid #CCC;
	border-right: 1px solid #CCC;
}

.td_label{
	text-align: right;
	background-color: #EEE;
}

.td_contex{
	text-align: left;
	padding-left: 7px;
}


</style>

<script type="text/javascript" src="${basePath}js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath}js/jquery.easyui.min.js"></script>

<script type="text/javascript">
	
	var roles=<%=ja.toString()%>
	
	var workItem=${wis==""?"[]":wis};
	
	var unit=${units==""?"[]":units};


	function topage(url, e) {
		window.frames[0].location.href = url;
	}

	function showMenu(id, url) {
		$(".mpanel").hide();
		$("#" + id).show();
		window.frames[0].location.href = url;
		if(id=="lzzsfx"){
			$.parser.parse('#'+id);
		}
		
	}
	
	
	function toWorkPage(node){
		var data = $("#workItem").tree("getData",node.target);
		if(data.children==0){
			window.frames[0].location.href="task!toPage.action?pageName=list&workItem="+node.id;
		}
	}
	
	function toOverWorkPage(node){
		window.frames[0].location.href="task!toPage.action?pageName=overList&workItem="+node.id;
		
	}
	
	function toFileSearch(node){
		window.frames[0].location.href="task!toPage.action?pageName=fileSearch&unitId="+node.id;
		
	}
	
	
	function reloading(value){
		window.location.href="dfzfjd.action?cr="+value.id;
	}
	
	$(function(){
		var menuId="<%=menuId%>";
		var titel="<%=defaultTitle%>";
		var url="<%=defaultUrl%>";
		showMenu(menuId,url);
	});
	
</script>

<style type="text/css">
.bottom{
	float: right;
	margin: 3px 5px 0px 20px;
}

.userInfo{
	font-size: 14px;
	color: blue;
}
a{color:#000000;text-decoration:none; } 
a:hover {color:#000000;text-decoration:none;}

</style>

</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false" 
		style="height: 112px;min-width: 1024px; background-image: url('images/bg.jpg');overflow: hidden;">
		<img alt="" src="${basePath }images/top2.jpg" style="margin: 0 auto; padding: 0; border: 0px; height: 112px;">
		<div class="nav">
			<ul>
				<% 
					if(roleName.equals("纪委")){ 
				%>
				<li><a href="javaScript:void(0);" onclick="showMenu('sgjf','quarterOutlay!toPage.action?pageName=list')">三公经费</a></li>
				<li><a href="javaScript:void(0);" onclick="showMenu('sjbg','baseManager!auditReport!toPage.action')">审计报告</a></li>
				<li><a href="javaScript:void(0);" onclick="showMenu('jdypjred','baseManager!EvaluationSupervisionRead!toPage.action')">监督员评价</a></li>
				<li><a href="javaScript:void(0);"  onclick="showMenu('zxzl','baseManager!SpecialManageList!toPage.action')">专项治理</a></li> 
				
				<li><a href="http://203.171.235.222:8089/sanzi/?pid=360830"  target="_blank">井冈阳光农廉网</a></li>
				<li><a href="http://10.177.10.88:8008/yxxecgap"  target="_blank">行政审批</a></li>
				<%
					}
					else{
				%>
					<script type="text/javascript">
						window.location.href="index.action";
					</script>
				<%} %>
			</ul>
		</div>
	</div>
	<div data-options="region:'west',title:'功能菜单'" style="width: 230px;">
		<div class="menus mpanel" id="dzda"  style="display: none;">
			<ul>
				<li><a href="javascript:void(0)" onclick="topage('cadreArchive!toPage.action?pageName=list',this)"><img
						alt="干部廉政档案" src="${basePath}images/grda.png" />干部廉政档案</a></li>
			 	<li><a href="javascript:void(0)" onclick="topage('workArchive!toPage.action?pageName=list',this)"><img
						alt="单位机构廉政档案" src="${basePath}images/bmda.png" />单位机构廉政档案</a></li>
			</ul>
		</div>

		<div class="mpanel" id="sgjf" style="display: none;  height: 100%;">
				<div title="三公经费">
					<ul class="easyui-tree">
					
						<li><a href="javascript:void(0)" onclick="topage('baseManager!UnitYearBudgetList!toPage.action',this)">年度预算管理</a></li>
						<li><a href="javascript:void(0)" onclick="topage('baseManager!quarterOutlayReport!toPage.action',this)">季度经费查询</a></li>
						
<!-- 					<li><a href="javascript:void(0)" onclick="topage('yearOutlay!toPage.action?pageName=list',this)">上年度未结余额数上报</a></li>
 -->						
 						<li><a href="javascript:void(0)" onclick="topage('quarterOutlay!toPage.action?pageName=tocheck',this)">三公经费支出统计</a></li>
						<li><a href="javascript:void(0)" onclick="topage('yearOutlay!toPage.action?pageName=tocompare',this)">年度三公经费支出对比</a></li>
					</ul> 
				</div>
		</div>
		
		
		<div class="menus mpanel" id="jdypjred" style="display: none;">
			<ul>
				<li><a href="javascript:void(0)" onclick="topage('baseManager!EvaluationSupervisionRead!toPage.action',this)"><img
						alt="监督员评价" src="${basePath}images/qllc.png" />监督员评价</a></li>
			<li><a href="javascript:void(0)" onclick="topage('baseManager!EvaluationSupervisionReport!toPage.action',this)"><img
						alt="监督员评价" src="${basePath}images/gif_47_032.gif" />统计报表</a></li>
			</ul>
		</div>
		
		<div class="menus mpanel" id="zxzl" style="display: none;">
			<ul>
				<li><a href="javascript:void(0)" onclick="topage('baseManager!SpecialManageList!toPage.action',this)"><img
						alt="专项治理" src="${basePath}images/grda.png" />专项治理</a></li>
				<li><a href="javascript:void(0)" onclick="topage('baseManager!SpecialManageReport!toPage.action',this)"><img
						alt="专项治理" src="${basePath}images/gif_47_084.gif" />统计报表</a></li>
			</ul>
		</div>
		
		<div class="menus mpanel" id="sjbg" style="display: none;">
			<ul>
					<li><a href="javascript:void(0)" onclick="topage('baseManager!auditReport!toPage.action',this)"><img
						alt="审计报告" src="${basePath}images/gif_47_078.gif" />审计报告</a></li>
			</ul>
		</div>
		
		<div class="mpanel" id="tzfjjs" style="display: none;">
			<ul class="easyui-tree"  data-options="data:unit,onClick:toFileSearch" ></ul>  
		</div>
		
	</div>
	<div data-options="region:'center',title:'<%=defaultTitle %>'" style="padding: 5px;">
		<iframe src="" width="100%" height="100%"  allowTransparency scrollbars=yes frameBorder="0" name="context" ></iframe>
	</div>
	<div data-options="region:'south',title:''" style="height: 30px;" >
		<div class="bottom">
			<a href="javaScript:void(0)" class="easyui-linkbutton" onclick="$('#dlg').dialog('open')" data-options="iconCls:'icon-edit'">密码修改</a>
		</div>
		<div class="bottom">
			<a href="/lzpt" class="easyui-linkbutton"  data-options="iconCls:'icon-home'">主页</a>
		</div>
		<div class="bottom">
			<a href="user!logout.action" class="easyui-linkbutton" data-options="iconCls:'icon-usergo'">注销</a>
		</div>
		<div class="bottom userInfo">
			|<label><em>当前角色：</em></label>
			<input class="easyui-combobox" data-options="valueField:'id',textField:'roleName',data:roles,onSelect:reloading"/>
		</div>
		
		<div class="bottom userInfo">
			|<label><em>当前用户：</em><%=user.getUserName() %></label>
		</div>
		
		<%
			if(user.getDefaultRole().getRoleName().equals("乡镇单位管理员")){
		%>
		
		<div class="bottom userInfo">
			|<label>您好，<%=unit%>单位</label>
		</div>
		<%
			}
		%>
	</div>
	
	<div id="dlg" class="easyui-dialog" title="Basic Dialog" data-options="iconCls:'icon-save',closed:true, modal: true,title:'密码修改', 
				buttons: [{
                    text:'确认',
                    iconCls:'icon-save',
                    handler:function(){
                        $('#pw').submit();
                    }
                },{
                    text:'取消',
                    handler:function(){
                       $('#dlg').dialog('close');
                    }
                }]" style="width:500px;height:250px;padding:10px">
                
      <form id="pw" method="post">
       
       <table cellpadding="0" cellspacing="0" class="tb" >
       	<tr>
       		<td width="20%" height="30px;" class="td_label" >原密码：</td>
       		<td width="85%"  class="td_contex">
       			<input id="oldPassword" type="password" class="easyui-validatebox" data-options="required:true,missingMessage:'请输入旧密码！'" validType="check_password">
       		</td>
       	</tr>
       	<tr>
       		<td width="20%" height="30px;" class="td_label" >新密码：</td>
       		<td width="85%"  class="td_contex">
       			<input id="newPassword" name="newPassword"  type="password" class="easyui-validatebox" data-options="required:true,missingMessage:'请输入新密码！',validType:'length[6,18]'" invalidMessage="请输入6到18位密码！">
       		</td>
       	</tr>
       	<tr>
       		<td width="20%" height="30px;" class="td_label" >新密码确认：</td>
       		<td width="85%"  class="td_contex">
       			<input id="confir" type="password" class="easyui-validatebox" data-options="required:true,missingMessage:'请输入确认的新密码！'" validType="confirm_passwor[$('#newPassword').val()]">
       		</td>
       	</tr>
       </table>
       </form>
    </div>
    <script type="text/javascript">
    	$(function(){
    		$.extend($.fn.validatebox.defaults.rules, {
    			confirm_passwor: {
    		        validator: function(value, param){
    		            return value == param[0];
    		        },
    		        message: '两次输入密码不一致！'
    		    }
    		});
    		
    		$.extend($.fn.validatebox.defaults.rules, {
    			check_password: {
    		        validator: function(value, param){
    		        	
    		        	var results=false
    		        	if(value.length>=6){
    		        		var text=$.ajax({ type: "POST",//http请求方式  
        		                url: "user!validatePassword.action",    //服务器段url地址  
        		                data:"password="+value,    //发送给服务器段的数据  
        		                dataType: "text", //告诉JQuery返回的数据格式  
        		                async: false      		
        		        	}).responseText;
    		        		
    		        		
    		        		if(text=="true"){
    		        			results=true;
    		        		}
    		        	}
    		        	return results;
    		        },
    		        message: '密码输入不正确！'
    		    }
    		});
    		$('#pw').form({
    		    url:"user!updatePassword.action",
    		    success:function(data){
    		    	$.messager.alert('成功','修改成功');
    		    	 $('#dlg').dialog('close');
    		    }
    		});
    		
    	});
    </script>
</body>
</html>