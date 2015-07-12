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
<script type="text/javascript" src="${basePath}js/json2.js"></script>

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
            width:60px;  
        }
        .f{
        	width: 350px;
        }
    </style>  


  <script type="text/javascript">  
        var url;  
        function editUser(){  
            var row = $('#dg').datagrid('getSelected');  
            if (row){  
                $('#dlg').dialog('open').dialog('setTitle','任务详细');
                
                $("#title").val(row.taskLZCP.title);
                $("#remark").val(row.taskLZCP.remark);
                $("#date").combobox("setValue",row.taskLZCP.date);
                $("#satisfiedCount").numberbox("setValue",row.satisfiedCount);
                $("#ordinaryCount").numberbox("setValue",row.ordinaryCount);
                $("#unsatisfiedCount").numberbox("setValue",row.unsatisfiedCount);
                $("#lastDate").datebox("setValue",dateToStr(row.taskLZCP.lastDate));
                $("#tt").datagrid("loadData",row.leaders);
                
                url = 'taskLzcp!updateTaskLZCPResult.action?tlr.id='+row.id;
                editing=false;
            }  
        }  
        function saveUser(){
        	
        	if(editing){
        		$.messager.show({  
                    title: '提示',  
                    msg: '当前正在编辑数据，请保存！'});
        		
        	}else{
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
        		return "已提交";
        	}else{
        		return "未提交";
        	}
        	
        }
        
        
        function seleRow(rowIndex, rowData){
        	
        	if(rowData.state==0){
        		$("#modify").linkbutton("enable");
        		$("#push").linkbutton("enable");
        	}else{
        		$("#modify").linkbutton("disable");
        		$("#push").linkbutton("disable");
        	}
        	
        }
        
        function load(){
        	$("#modify").linkbutton("disable");
    		$("#delete").linkbutton("disable");
    		$("#push").linkbutton("disable");
        }
        
        function formatterTitle(val,row){
        	
        	return row.taskLZCP.title;
        }
        
        function formatterDate(val,row){
        	return row.taskLZCP.date;
        }
        
        function formatterLastDate(val,row){
        	
        	return dateToStr(row.taskLZCP.lastDate);
        }
        
        function openInfo(){
        	
        }
        
        var editing=false;
        
        function starteditr(){
        	
        	 var rows = $("#tt").datagrid("getRows");
        	 
        	 for(var i=0;i<rows.length;i++){
        		 $('#tt').datagrid('beginEdit',i); 
        	 }
        	 editing=true;
        	   
        }
        
        function saveEditr(){
        	
        	 var rows = $("#tt").datagrid("getRows");
        	 
        	 for(var i=0;i<rows.length;i++){
        		 $('#tt').datagrid('endEdit',i); 
        	 }
        	 
        	 var leader=JSON.stringify($("#tt").datagrid("getData").rows);
        	 
        	 $("#leader").val(leader);
        	 editing=false;
        }
        
    </script>  

</head>

<body>

 <table id="dg" title="廉政测评任务列表" class="easyui-datagrid" style="height:450px"  
            url="taskLzcp!getTaskLZCPResults.action"  
            toolbar="#toolbar" pagination="true"  
            rownumbers="true" fitColumns="true" singleSelect="true" data-options="onDblClickRow:openInfo,onClickRow:seleRow,onLoadSuccess:load" >  
        <thead>  
            <tr>  
                <th field="taskLZCP" formatter="formatterTitle" width="250">标题</th>  
                <th field="date" formatter="formatterDate" width="50">年份</th>
                <th field="lastDate" formatter="formatterLastDate" width="50" formatter="dateToStr">提交时限</th> 
                <th field="state" width="50" formatter="formatterState">状态</th>  
            </tr>  
        </thead>  
    </table>  
    <div id="toolbar">  
        <a href="javascript:void(0)" id="modify" class="easyui-linkbutton" iconCls="icon-edit"  disabled="true" plain="true" onclick="editUser()">上报任务</a>  
    </div>  
     <div>
    <div id="dlg" class="easyui-dialog" style="width:600px;height:450px;padding:10px 20px"  
            closed="true" buttons="#dlg-buttons">
        <div class="easyui-tabs">
          <div title="任务信息" >
	        <form id="fm" method="post" novalidate>  
	            <div class="fitem">  
	                <label>年份:</label>  
	                <input name="taskLZCP.date" id="date"  class="easyui-combobox" disabled="disabled"  data-options="valueField:'year',textField:'year',data:date,onChange:changeYear"  required="true">  
	            </div>
	            <div class="fitem">  
	                <label>提交时间:</label>  
	                <input name="taskLZCP.lastDate" id="lastDate" class="easyui-datebox" disabled="disabled" required="true">  
	            </div>  
	            <div class="fitem">  
	                <label>标题:</label>  
	                <input name="taskLZCP.title" id="title" class="easyui-validatebox f" disabled="disabled" required="true">  
	            </div>
	            <div class="fitem">  
	                <label> 备注:</label>
	                <textarea name="taskLZCP.remark" id="remark" rows="4" class="easyui-validatebox f" disabled="disabled" ></textarea>
	            </div>
	         <!--    <div class="ftitle">廉政测评反馈</div>
	            <div class="fitem">
	            	<label>满意:</label><input id="satisfiedCount" name="tlr.satisfiedCount" class="easyui-numberbox" style="width: 60px;" />票&nbsp;
	            	<label>基本满意:</label><input id="ordinaryCount" name="tlr.ordinaryCount" class="easyui-numberbox" style="width: 60px;" />票&nbsp;
	            	<label>不满意:</label><input id="unsatisfiedCount" name="tlr.unsatisfiedCount" class="easyui-numberbox" style="width: 60px;" />票&nbsp;
	            </div> -->
	            <input type="hidden" value="" id="leader" name="leader">
	        </form>
	    </div>
	    <div  title="廉政测评">
	    	<table id="tt" toolbar="#tttool"  class="easyui-datagrid" fitColumns="true" singleSelect="true"  >
	    		<thead>
	    			<tr>
	    				<th field="name" width="80">姓名</th>  
		                <th field="zc"  width="50">职务</th>
		                <th field="satisfiedCount" editor="{type:'numberbox'}"  width="50">满意票</th> 
		                <th field="ordinaryCount" editor="{type:'numberbox'}" width="50" >基本满意票</th>
		                <th field="unsatisfiedCount" width="50" editor="{type:'numberbox'}" >不满意票数</th>  
	    			</tr> 
	    		</thead>
	    	</table>
	    	  <div id="tttool">
	    	  	<a href="javascript:void(0)" id="startleader" class="easyui-linkbutton" iconCls="icon-edit"  plain="true" onclick="starteditr()">编辑</a>
       			<a href="javascript:void(0)" id="saveleader" class="easyui-linkbutton" iconCls="icon-save"  plain="true" onclick="saveEditr()">保存</a>  
    		</div>  
	    </div>
	    </div>
    </div>
    <div id="dlg-buttons">  
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">上报</a>  
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>  
    </div>  
</body>
</html>