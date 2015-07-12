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
<link rel="stylesheet" type="text/css" href="${basePath}js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath }js/themes/icon.css">

<script type="text/javascript" src="${basePath}js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${basePath}js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath }js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath}js/json2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加窗口</title>

   <script type="text/javascript">  
        var url;  
        function newUser(){  
            $('#dlg').dialog('open').dialog('setTitle','添加服务窗口');  
            $('#fm').form('clear');  
            url = 'win!add.action';  
        }  
        function editUser(){  
            var row = $('#dg').datagrid('getSelected');  
            if (row){  
                $('#dlg').dialog('open').dialog('setTitle','修改服务窗口');
                
                $("#name").val(row.name);
                url = 'win!modify.action?wi.id='+row.id; 
            }  
        }  
        function saveUser(){  
            $('#fm').form('submit',{  
                url: url,  
                onSubmit: function(){  
                    return $(this).form('validate');  
                },  
                success: function(result){
                	if(result=="success"){
                		$.messager.show({  
                            title: '提示',  
                            msg: "保存成功"  
                        });
                		$('#dlg').dialog('close');      // close the dialog  
                        $('#dg').datagrid('reload');    // reload the user data
                	}
                	
                }  
            });  
        }  
        function destroyUser(){  
            var row = $('#dg').datagrid('getSelected');  
            if (row){  
                $.messager.confirm('提示确认','你是否确定激活或者废弃这条记录',function(r){  
                    if (r){  
                        $.post('win!modifyState.action',{'wi.id':row.id,'wi.state':row.state==0?1:0},function(result){  
                        	if (result=="success"){  
                                $('#dg').datagrid('reload');    // reload the user data
                                $.messager.show({   // show error message  
                                    title: '提示',  
                                    msg: "修改成功！" 
                                });  
                            } else {  
                                $.messager.show({   // show error message  
                                    title: '错误',  
                                    msg: "修改失败!"  
                                });  
                            }  
                        });  
                    }  
                });  
            }  
        }
        

        
        function convertState(value,data,index){
        	
       		if(value==0){
           		return "激活";
           	}else{
           		return "废弃";
           	}
        }
        
    </script>  
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
    </style>  
    
</head>
<body>
 <table id="dg" title="行政窗口列表" class="easyui-datagrid"  
            toolbar="#toolbar" pagination="true"  
            url="win!getList.action"
            rownumbers="true" fitColumns="true"   singleSelect="true">  
        <thead>  
            <tr>  
                <th field="name" width="50" >窗口名称</th>
                <th field="state" width="50" formatter="convertState" >窗口名称</th>  
            </tr>  
        </thead>  
  </table>  
  
   <div id="toolbar">  
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">添加服务窗口</a>  
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">修改服务窗口</a>  
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">(废弃\激活)服务窗口</a>  
    </div>
     <div id="dlg" class="easyui-dialog" style="width:400px;height:180px;padding:10px 20px"  
            closed="true" buttons="#dlg-buttons">  
        <div class="ftitle">行政服务窗口信息</div>  
        <form id="fm" method="post" novalidate>  
            <div class="fitem">  
                <label>窗口名称:</label>  
                <input name="wi.name" id="name" class="easyui-validatebox" required="true">  
            </div>  
        </form>  
    </div>  
    <div id="dlg-buttons">  
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">保存</a>  
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>  
    </div>
</body>
</html>