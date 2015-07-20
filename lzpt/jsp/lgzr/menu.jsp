<%@page import="com.kteam.lzpt.common.UnitUtil"%>
<%@page import="com.kteam.lzpt.entity.Role"%>
<%@page import="net.sf.json.util.PropertyFilter"%>
<%@page import="net.sf.json.JsonConfig"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.kteam.lzpt.entity.User" pageEncoding="UTF-8"%>
<%
	User user=(User)session.getAttribute("user");
	if(user==null){
		response.sendRedirect("/lzpt/user!toPage.action?pageName=indexlogin");
		return;
	}
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
	
%>

 <script type="text/javascript">
 var roles=<%=ja.toString()%>
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
    	function reloading(value){
    		window.location.href="main.jsp?cr="+value.id;
    	}
    	
    </script>

<style>
.bottom{
	float: right;
	margin: 3px 5px 0px 20px;
}
</style>

<div data-options="region:'north',split:true,border:false"
	style="height: 112px; min-width: 1024px; overflow: hidden; width: 1366px; background-image: url(/lzpt/images/bg.jpg);">
	<img alt="" src="/lzpt/images/top41.jpg" style="margin: 0 auto; padding: 0; border: 0px; height: 112px;">
	<div class="nav">
		<ul>
			<li><a id="n1" href="javascript:void(0)" >主体责任管理</a></li>
			<li><a  id="n2" href="javascript:void(0)" >监督责任管理</a></li>
			<% if(!"乡镇单位管理员".equals(roleName)){ %>
				<li><a id="n3" href="javascript:void(0)">纪委主控台</a></li>
			<% } %>
		</ul>
	</div>
</div>
<div data-options="region:'south',title:''" style="height: 30px;">
		<div class="bottom">
			<a href="/lzpt" class="easyui-linkbutton"  data-options="iconCls:'icon-home'">主页</a>
		</div>
		<div class="bottom">
			<a href="/lzpt/user!logout.action" class="easyui-linkbutton" data-options="iconCls:'icon-usergo'">注销</a>
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
<div data-options="region:'west',split:true" title="系统菜单" style="width: 220px;">
	<div class="menus mpanel" id="dzda" style="">
		<ul>
			<li><a id="m1" href="javascript:void(0)"  ><img alt="" src="/lzpt/images/grda.png">基础工作项目</a></li>
			<li><a id="m2" href="javascript:void(0)" ><img alt="" src="/lzpt/images/bmda.png">重点考核项目</a></li>
		</ul>
	</div>
</div>