<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
request.setAttribute("basePath", basePath);
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${basePath}js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">

<script type="text/javascript" src="${basePath}js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath}js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>

<title>Insert title here</title>

  <style type="text/css">  
        #fm{  
            margin:0;  
            padding:10px 30px;  
        }  
        .ftitle{  
            font-size:14px;  
            font-weight:bold;  
            padding:5px 0;  
            margin-bottom:10px;  
            border-bottom:1px solid #ccc;  
        }  
        .fitem{  
            margin-bottom:5px;  
        }  
        .fitem label{  
            display:inline-block;  
            width:80px;  
        }
        .f{
        	width: 350px;
        }
    </style>  


  <script type="text/javascript">  
        var url;  
        function newUser(){  
            $('#dlg').dialog('open').dialog('setTitle','添加任务');  
            $('#fm').form('clear');  
            url = 'taskLzcp!addTaskLZCP.action';
        }  
        function editUser(){  
            var row = $('#dg').datagrid('getSelected');  
            if (row){  
                $('#dlg').dialog('open').dialog('setTitle','修改任务');
                
                $("#title").val(row.title);
                $("#remark").val(row.remark);
                $("#date").combobox("setValue",row.date);
                $("#lastDate").datebox("setValue",dateToStr(row.lastDate));
                url = 'taskLzcp!modifyTaskLZCP.action?taskLZCP.id='+row.id;  
            }  
        }  
        function saveUser(){  
            $('#fm').form('submit',{  
                url: url,  
                onSubmit: function(){  
                    return $(this).form('validate');  
                },  
                success: function(result){ 
                    if (result=="error"){  
                        $.messager.show({  
                            title: '提示',  
                            msg: '保存失败'  
                        });  
                    } else {  
                        $('#dlg').dialog('close');       
                        $('#dg').datagrid('reload');   
                    }  
                }  
            });  
        }  
        function destroyUser(){  
            var row = $('#dg').datagrid('getSelected');  
            if (row){  
                $.messager.confirm('确认','您是否删除这条记录',function(r){  
                    if (r){  
                        $.post('taskLzcp!deleteTaskLZCP.action',{"taskLZCP.id":row.id},function(result){
                            if (result=="success"){
                                $('#dg').datagrid('reload');    // reload the user data  
                            } else {  
                                $.messager.show({   // show error message  
                                    title: '错误',  
                                    msg: "删除错误"  
                                });  
                            }  
                        });  
                    }  
                });  
            }  
        }
        
        var date=[];
        
        for( var j=0,i=2000;i<=2050;i++,j++){
    		date[j]={"year":i};
    	}
        
        function changeYear(data){
        	var  title ="发布"+data+"年度领导班子、领导干部落实党风廉政建设责任制民主测评任务";
        	$("#title").val(title);
        }
        
        function dateToStr(o){
        	if(o!=null){
        		var date=new Date(o.time);
        		return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
        	}else{
        		return o;
        	}
        }
        
        function formatterState(state){
        	
        	if(state==1){
        		return "已发布";
        	}else{
        		return "未发布";
        	}
        	
        }
        
        function push(){
        	$.messager.confirm('确认','您是否发布这项任务，发布后该记录不能修改！',function(r){
        		  var row = $('#dg').datagrid('getSelected');  
        		if(r){
        			$.post('taskLzcp!pushTaskLZCP.action',{"taskLZCP.id":row.id,"taskLZCP。state":1},function(result){
            			
              			if(result=="success"){
              			  $('#dg').datagrid('reload');
              				
              			   $.messager.show({   // show error message  
                               title: '提示',  
                               msg: "发布成功！"  
                           });
              			   
              			   
              			}else{
              				$.messager.show({   // show error message  
                                title: '提示',  
                                msg: "发布失败！"  
                            });
              			}
                 });
        		}
        	});
        }
        
        
        function seleRow(rowIndex, rowData){
        	
        	if(rowData.state==0){
        		$("#modify").linkbutton("enable");
        		$("#delete").linkbutton("enable");
        		$("#push").linkbutton("enable");
        	}else{
        		$("#modify").linkbutton("disable");
        		$("#delete").linkbutton("disable");
        		$("#push").linkbutton("disable");
        	}
        	
        }
        
        function load(){
        	$("#modify").linkbutton("disable");
    		$("#delete").linkbutton("disable");
    		$("#push").linkbutton("disable");
        }
        
    </script>  

</head>

<body>

 <table id="dg" title="廉政测评任务列表" class="easyui-datagrid" style="height:450px"  
            url="taskLzcp!getAllTaskLZCP.action"  
            toolbar="#toolbar" pagination="true"  
            rownumbers="true" fitColumns="true" singleSelect="true" data-options="onClickRow:seleRow,onLoadSuccess:load" >  
        <thead>  
            <tr>  
                <th field="title" width="250">标题</th>  
                <th field="date" width="50">年份</th>
                <th field="lastDate" width="50" formatter="dateToStr">提交时限</th> 
                <th field="state" width="50" formatter="formatterState">状态</th>  
            </tr>  
        </thead>  
    </table>  
    <div id="toolbar">  
        <a href="javascript:void(0)" id="add" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">添加任务</a>  
        <a href="javascript:void(0)" id="modify" class="easyui-linkbutton" iconCls="icon-edit"  disabled="true" plain="true" onclick="editUser()">修改任务</a>  
        <a href="javascript:void(0)" id="delete" class="easyui-linkbutton" iconCls="icon-remove"  disabled="true" plain="true" onclick="destroyUser()">删除任务</a>
        <a href="javascript:void(0)" id="push" class="easyui-linkbutton" iconCls="icon-redo" disabled="true" plain="true" onclick="push()">发布任务</a>  
    </div>  
      
    <div id="dlg" class="easyui-dialog" style="width:600px;height:350px;padding:10px 20px"  
            closed="true" buttons="#dlg-buttons">  
        <div class="ftitle">廉政测评</div>  
        <form id="fm" method="post" novalidate>  
            <div class="fitem">  
                <label>年份:</label>  
                <input name="taskLZCP.date" id="date"  class="easyui-combobox"  data-options="valueField:'year',textField:'year',data:date,onChange:changeYear"  required="true">  
            </div>
            <div class="fitem">  
                <label>提交时间:</label>  
                <input name="taskLZCP.lastDate" id="lastDate" class="easyui-datebox " required="true">  
            </div>  
            <div class="fitem">  
                <label>标题:</label>  
                <input name="taskLZCP.title" id="title" class="easyui-validatebox f" required="true">  
            </div>
            <div class="fitem">  
                <label> 备注:</label>
                <textarea name="taskLZCP.remark" id="remark" rows="5" class="easyui-validatebox f" ></textarea>
            </div>  
        </form>  
    </div>  
    <div id="dlg-buttons">  
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">保存</a>  
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>  
    </div>  
</body>
</html>