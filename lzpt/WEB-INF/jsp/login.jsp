<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("basePath", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>永新县党风廉政建设管理系统</title>

<link rel="stylesheet" type="text/css" href="${basePath}js/themes/default/easyui.css" />

<script type="text/javascript" src="${basePath}js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath}js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath}js/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">

var loginMessage="${loginMessage}";

$(function(){
	
	if($.trim(loginMessage)!=""){
		
		var message="";
		
		if(loginMessage=="l1"){
			message="验证码输入错误！";
		}else if(loginMessage=="l2"){
			
			message="账号或密码错误！";
		}
		$.messager.alert("提示",message);
		
	}
	
	//if(action != "loginError"){
	//	   document.getElementById("user_userName").focus();
	//}
	
	//如果存在上级页面，即页面停留在主页
	if(window.parent.frames.length>0){
    	if(navigator.appName == "Microsoft Internet Explorer") {
    	   var ua = navigator.userAgent;
    	   var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
    	   if (re.exec(ua) != null){
    		   rv = parseFloat(RegExp.$1);
    	   }
    	   //如果不是IE6
    	   if(rv != 6){
    		   window.top.location = window.location;
    	   }
        }else {
        	window.top.location = window.location;
        }
	}
});

function enterValidate(event){
	if(event.keyCode == 13){
		if(userLogin()){
			$("#loginForm").submit();
		}
		
	}
}

function res(){
	$("#loginForm").get(0).reset();
}


function sub(){
	if(userLogin()){
		$("#loginForm").submit();
	}
}

function userLogin()
{
	return $("#loginForm").form("validate");
}

$.extend($.fn.validatebox.defaults.rules, {
    length: {
        validator: function(value,param){        	
        	return value.length >= param[0] && value.length <= param[1];

        },
        message: "内容长度必须在{0}与{1}之间!"
    }
});


function changecode(){
	$("#codeimg").attr("src","images/num.jsp?"+new Date());
}

</script>

<style type="">
	input{ background: no-repeat;border: 0px; vertical-align:bottom;}
</style>

</head>

<body style="margin: 0 auto; background-image: url('images/body_bg.jpg');">
	<form action="user!login.action" method="post" id="loginForm" name="loginForm" >
	<div style="background: url('images/login_top.jpg');height: 40px;width: auto;"></div>
	<div style="background: url('images/login_left.jpg');height: 650px;width: auto;">
		<img src="images/login_center.jpg" alt="" style="border: 0px" />
		<input class="easyui-validatebox"  maxLength=18 onkeyup="enterValidate(event)" id="user_userName" name="user.userName" type="text" 
      		data-options="required:true" validType="length[3,18]" missingMessage="请输入用户名"  
			style="position: absolute;top: 286px;left: 390px;border: 0px;border-style:none; 
						background-image: url('images/input1.gif'); width:149px; height: 27px; " />
		<input type="password" class="easyui-validatebox"  maxLength=18 onkeyup="enterValidate(event)"
				id="user_passWord" name="user.password"  data-options="required:true"
				validType="length[6,18]" missingMessage="请输入密码" 
				style="position: absolute;top: 325px;left: 390px;border: 0px;border-style:none; 
						background-image: url('images/input1.gif'); width:149px; height: 27px; " />
		<input style="position: absolute;top: 362px;left: 390px;border: 0px;border-style:none; 
						background-image: url('images/input2.gif'); width:86px; height: 27px; " name="rand" class="easyui-validatebox" required="true" missingMessage="请输入验证码！"   />
		<a href="javaScript:void(0)" onclick="changecode();"><img id="codeimg" src="images/num.jsp" alt="点击刷新"  style="position: absolute;top: 362px;left: 480px;border: 0px;  width:60px; height: 27px;" /></a>
		
		<input type="button" onclick="sub();" style="background-image: url('images/login_butten.jpg');width: 75px; height: 27px; position: absolute;top: 430px;left: 228px;border: 0px;" />
		<input type="button"  onclick="res();"  style="background-image: url('images/login_res.jpg');width: 75px; height: 27px; position: absolute;top: 430px;left: 420px;border: 0px;" />
		
	</div>
	<div style="background: url('images/login_bottom.jpg');height: 40px;width: auto;">
	</div>
	</form>
</body>
</html>
<% session.setAttribute("loginMessage", ""); %>