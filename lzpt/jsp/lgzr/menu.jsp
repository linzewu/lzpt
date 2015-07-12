<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	Object user = session.getAttribute("user");
	if(user==null){
		response.sendRedirect("/lzpt/user!toPage.action?pageName=indexlogin");
		return;
	}

%>
<div data-options="region:'north',split:true,border:false"
	style="height: 112px; min-width: 1024px; overflow: hidden; width: 1366px; background-image: url(/lzpt/images/bg.jpg);">
	<img alt="" src="/lzpt/images/top41.jpg" style="margin: 0 auto; padding: 0; border: 0px; height: 112px;">
	<div class="nav">
		<ul>
			<li><a id="n1" href="javascript:void(0)" >主体责任管理</a></li>
			<li><a  id="n2" href="javascript:void(0)" >监督责任管理</a></li>
			<li><a href="/lzpt/demo/2.0/r1.html">纪委主控台</a></li>
			<li><a href="#">系统管理</a></li>
		</ul>
	</div>
</div>
<div data-options="region:'south',title:''" style="height: 30px;"></div>
<div data-options="region:'west',split:true" title="系统菜单" style="width: 220px;">
	<div class="menus mpanel" id="dzda" style="">
		<ul>
			<li><a id="m1" href="javascript:void(0)"  ><img alt="" src="/lzpt/images/grda.png">基础工作项目</a></li>
			<li><a id="m2" href="javascript:void(0)" ><img alt="" src="/lzpt/images/bmda.png">重点考核项目</a></li>
		</ul>
	</div>
</div>