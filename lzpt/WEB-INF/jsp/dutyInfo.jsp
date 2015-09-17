<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>乡镇纪委履职情况</title>

<link rel="stylesheet" type="text/css"
	href="${basePath }js/jquery-easyui-1.4.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${basePath }js/jquery-easyui-1.4.3/themes/icon.css">

<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript"
	src="${basePath }js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="/lzpt/js/ckeditor_4.5.1_basic/ckeditor.js"></script>

<script type="text/javascript">
	var year = new Date().getFullYear();

	function getYears() {

		var rule = [];

		for (var i = 2012; i <= year + 5; i++) {
			rule.push(i);
		}
		return rule;
	}

	var years = getYears();
	
	$(function(){
		
		CKEDITOR.replace('jwzz',
				{
		       toolbar : 'Basic'
		   });
		
		CKEDITOR.replace('zzzxqk',
				{
		       toolbar : 'Basic'
		   });
		
		$("#wa").combobox({
			url:'workArchive!queryWorkArchives.action',
			valueField:'id',
			textField:'wname',
			multiple:false
		});
	});
</script>
</head>
<body>
	<div id="p" class="easyui-panel" title="乡镇纪委履职情况"
		data-options="fit:true" style="padding: 10px 0 0 10px;">

		<table cellpadding="8" >
			<tr>
				<td><label>单位：</label></td>
				<td><input id="wa" name="wa"/></td>
			</tr>
			<tr>
				<td>年份：</td>
				<td>
					<div>
						<input class="easyui-slider" style="width: 400px;"
							data-options="showTip:true,rule:years,min:2012,max:years[years.length-1],value:year">
					</div>
				</td>
			</tr>
		</table>
		<div style="width: 95%;margin-top: 30px;height: 300px" >
		<div id="tt" class="easyui-tabs" data-options="fit:true">
			<div title="纪委职责" ><textarea rows="20" cols="120" id="jwzz"></textarea></div>
			<div title="职责执行情况" data-options=""><textarea rows="20" cols="120" id="zzzxqk"></textarea></div>
		</div>
		</div>
	</div>
</body>
</html>