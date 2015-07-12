<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("basePath", basePath);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>廉政建设综合信息平台</title>


<link href="${basePath}css/userlogin.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${basePath}js/themes/default/easyui.css">
<script type="text/javascript" src="${basePath}js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath}js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath}js/locale/easyui-lang-zh_CN.js"></script>
<META http-equiv=Content-Type content="text/html; charset=UTF-8">
<META content="MSHTML 6.00.6000.16674" name=GENERATOR></HEAD>
<BODY id=userlogin_body>
<Form action="user!login.action" method="post" id="loginForm" name="loginForm" >
<DIV id=user_login> 
<DL>
  <DD id=user_top>
  <UL>
    <LI class=user_top_l></LI>
    <LI class=user_top_c></LI>
    <LI class=user_top_r></LI></UL>
  <DD id=user_main>
  <UL>
    <LI class=user_main_l></LI>
    <LI class=user_main_c>
    <DIV class=user_main_box>
    <UL>
      <LI class=user_main_text>用户名： </LI>
      <LI class=user_main_input><INPUT class="easyui-validatebox TxtUserNameCssClass"
      maxLength=18 onkeyup="enterValidate(event)" id="user_userName" name="user.userName" type="text" 
      data-options="required:true" validType="length[3,18]" missingMessage="请输入用户名"> </LI></UL>
    <UL>
      <LI class=user_main_text>密 码： </LI>
      <LI class=user_main_input><INPUT class="TxtPasswordCssClass easyui-validatebox"
      maxLength=18 onkeyup="enterValidate(event)" id="user_passWord" name="user.password"
      type="password" data-options="required:true" validType="length[6,18]" missingMessage="请输入密码"> </LI></UL>
   </DIV></LI>
    <LI class=user_main_r><INPUT class=IbtnEnterCssClass id=IbtnEnter 
    type="submit"  name=IbtnEnter value=" " > </LI></UL>
  <DD id=user_bottom>
  <UL>
    <LI class=user_bottom_l></LI>
    <LI class=user_bottom_c><SPAN style="MARGIN-TOP: 40px">欢迎使用廉政建设综合信息平台</SPAN> </LI>
    <LI class=user_bottom_r></LI></UL></DD></DL></DIV><SPAN id=ValrUserName 
style="DISPLAY: none; COLOR: red"></SPAN><SPAN id=ValrPassword 
style="DISPLAY: none; COLOR: red"></SPAN><SPAN id=ValrValidateCode 
style="DISPLAY: none; COLOR: red"></SPAN>
<DIV id=ValidationSummary1 style="DISPLAY: none; COLOR: red"></DIV>

<DIV></DIV>

</FORM></BODY>

<script type="text/javascript">
$(function(){
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

</script>
</HTML>
