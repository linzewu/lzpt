<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.kteam.lzpt.entity.User"%>
<%@page import="com.kteam.lzpt.common.UnitUtil"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
	String units = application.getAttribute("units").toString();
	User user = (User) session.getAttribute("user");
	Date data=new Date();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	String currentDate = sdf.format(data);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改批评警告</title>
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">
<link rel="stylesheet"  type="text/css" href="${basePath }css/base.css" >
<script type="text/javascript" src="${basePath }js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath }js/json2.js"></script>
<script type="text/javascript" src="${basePath }js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${basePath }js/upload/ajaxfileupload.js"></script>
<script type="text/javascript" src="${basePath }js/dataCode.js"></script>
<script type="text/javascript" src="${basePath }js/lzpt/common.js"></script>
<script type="text/javascript">

$.extend($.fn.validatebox.defaults.rules, {
    validYear: {
        validator: function(value,param){
        	var year= $("#year").combobox("getValue");
        	var id=$("#dataid").val();
        	var data={'be.year':year,'be.unitId':'<%=user.getUnitId()%>','be.id':id};
        	
        	var rvalue = $.ajax({url:'baseManager!!getUniqueQueryResult.action?be.queryType=ValidateUnitYearBudget',dataType:"json",data:data,async:false,cache:false,type:"post"}).responseText
            return rvalue=='true';
        },
        message: '该年度预算已经存在'
    }
});

        $(function(){
        	$("#spanUnit").text(getSysUnitById("<%=user.getUnitId()%>"));
            $('#myform').form({
            	onSubmit:function(){
            		var isValid = $(this).form('validate');
            		return isValid;
            	},
                success:function(data){
                	var datajson = $.parseJSON(data);
                	if(datajson.state==200){
                		$.messager.alert('提示', "保存成功", 'info',function(){
                			window.location.href="baseManager!UnitYearBudgetList!toPage.action";
                		});               		
                	}
                }
            });
            
        	loadInfo("baseManager!!getBaseEntity.action?be.df=d2", 'UnitYearBudget',
    				"${param['be.id']}", "myform",function(data){
    				});
        });
        
  	function sum(){
        	var gwycys = $("#gwycys").numberbox("getValue");
        	var gwjdys = $("#gwjdys").numberbox("getValue");
        	var ygcgys=$("#ygcgys").numberbox("getValue");
        	
        	gwycys=gwycys==""?0:Number(gwycys);
        	gwjdys=gwjdys==""?0:Number(gwjdys);
        	ygcgys=ygcgys==""?0:Number(ygcgys);
        	
        	$("#money").numberbox("setValue",gwycys+gwjdys+ygcgys);
        }
        
    </script>
</head>
<body>
	<form action="baseManager!!saveBaseEntity.action"  id="myform" name="myform" method="post" enctype="multipart/form-data">
		<div id="p" class="easyui-panel" style="padding: 10px; min-width: 700px; min-height: 300px;" title="单位年度 添加">
			<div style="margin-left: auto; margin-right: auto; vertical-align: middle; width: 680px; min-height: 400px;">
				<table style="width: 680px" border="0" class="base_table" cellpadding="0"  cellspacing="0">
					<tbody>
						<tr>
							<td class="info_title">年度：</td>
							<td class="info" ><input class="easyui-combobox"  name="be.year"  id="year" data-options="valueField:'value',textField:'label',data:datacode.years"  required="true"  validtype="validYear"   /></td>
							<td class="info_title">单位：</td>
							<td class="info"  >
								<input name="be.unitId"  value="<%=user.getUnitId() %>"   type="hidden" />
								<span id="spanUnit"></span>
							</td>
						</tr>
						<tr>
							<td class="info_title">公务接待费预算（万元）：</td>
							<td class="info" ><input id="gwjdys" name="be.gwjdys" class="easyui-numberbox"  data-options="min:0,precision:2,max:999999999,onChange:sum"  required="true" /></td>
							<td class="info_title">因公出国（境）预算（万元）：</td>
							<td class="info" ><input id="ygcgys"  name="be.ygcgys" class="easyui-numberbox"  data-options="min:0,precision:2,max:999999999,onChange:sum"  required="true" /></td>
						</tr>
						
						<tr>
							<td class="info_title">公务用车预算（万元）：</td>
							<td class="info" ><input id="gwycys"  name="be.gwycys" class="easyui-numberbox"  data-options="min:0,precision:2,max:999999999,onChange:sum"  required="true" /></td>
							<td class="info_title">预算总金额：</td>
							<td class="info" ><input id="money"  name="be.money" class="easyui-numberbox"  data-options="min:0,precision:2,max:999999999"  required="true" /></td>
						</tr>
						<tr>
							<td class="info_title">备注：</td>
							<td class="info" colspan="3">
								<textarea rows="5" cols="60" name="be.remarks" ></textarea>
								<input type="hidden"  name="be.actionType"  value="UnitYearBudget">
								<input type="hidden"  id="dataid" name="be.id"  value="UnitYearBudget">
								<input name="be.state" type="hidden" value="0"/>
							</td>
						</tr>
					</tbody>
				</table>
				<div align="center">
					<a href="javascript:$('#myform').submit();" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a> <a
						href="baseManager!UnitYearBudgetList!toPage.action" class="easyui-linkbutton" data-options="iconCls:'icon-back'">返回</a>
				</div>
			</div>
		</div>
	</form>
</body>
</html>