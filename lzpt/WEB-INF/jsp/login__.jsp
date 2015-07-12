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
<link href="css/newlogin.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="${basePath}js/themes/default/easyui.css" />

<script type="text/javascript" src="${basePath}js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath}js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath}js/locale/easyui-lang-zh_CN.js"></script>

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

</head>

<body>
<div class="main">
<div class="main_1">
</div>
<div class="main_2">
<!--登陆-->
<form action="user!login.action" method="post" id="loginForm" name="loginForm" >
<div class="dl">
<div class="xtdl">登录廉政系统管 理</div>
<div class="yhm">账&nbsp;&nbsp;号:<input  class="easyui-validatebox t1"
      maxLength=18 onkeyup="enterValidate(event)" id="user_userName" name="user.userName" type="text" 
      data-options="required:true" validType="length[3,18]" missingMessage="请输入用户名"  /></div>
<div class="mm">密&nbsp;&nbsp;码:<input class="easyui-validatebox t1"
      maxLength=18 onkeyup="enterValidate(event)" id="user_passWord" name="user.password"
      type="password" data-options="required:true" validType="length[6,18]" missingMessage="请输入密码"  />
</div>
<div class="yzm">验证码:<input type="text" name="code" style="width: 60px;" /><a href="javaScript:void(0)" onclick="changecode();"><img id="codeimg" src="images/num.jsp" alt="点击刷新" style="border:0;margin-left: 5px;"/></a></div>
<div class="sub"><div class="s1"><a href="javaScript:void(0);" onclick="sub();" class="easyui-linkbutton"  >登陆</a></div>
<div class="s2"><a href="javaScript:void(0);" onclick="res();" class="easyui-linkbutton" >重置</a></div></div>
</div>
</form>
<!--登陆end-->
</div>
</div>
<!--底部版权-->
<div class="bom">江西省吉安市永新县 </div>
<!--底部版权end-->
</body>
</html>
