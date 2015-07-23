<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<div id="tt" class="easyui-tabs"  style="height: 480px">
	<div title="年度考核综合表" >
		<table class="easyui-datagrid" id="yearReport"
				data-options="url:'/lzpt/project!getYearReport.action',border:false,singleSelect:true,fit:true,fitColumns:true,toolbar:'#tb'">
				<thead>
					<tr>
						<th data-options="field:'year'" width="100">年份</th>
						<th data-options="field:'unit'" width="100"  formatter="unitFormatter">单位名称</th>
						<th data-options="field:'score'" width="100">总得分</th>
						<th data-options="field:'bt'" width="100" formatter="queryReportInfo">查看详细</th>
					</tr>
				</thead>
			</table>
	</div>
</div>

 <div id="tb" style="padding:2px 5px;">
                            年份: <input id="year" class="easyui-combobox" panelHeight="auto" style="width:100px" data-options="valueField: 'label',textField: 'value',data:years" />
                            单位: 
        <input id="unit" class="easyui-combobox" panelHeight="auto" style="width:100px" data-options="data:units"   valueField="id" textField="wname" />
        <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="queryReport()">查询</a>
 </div>
 
 <script type="text/javascript">
 
 function queryReport(){
		
		var params={'pro.projectType':projectTypeId}
		
		var year = $("#year").combobox("getValue");
		
		if(year!=""){
			params['pro.year']=year
		}
		
		var unit = $("#unit").combobox("getValue");
		
		if(unit!=""){
			params['pro.unit']=unit
		}
		
		$("#yearReport").datagrid("reload",params);
	}
 
 function queryReportInfo(value,row,index){
	 
	 var link="<a href=\"javascript:void(0)\" onClick=\"openinfo('"+row["year"]+"','"+row["unit"]+"')\">查看</a>";
	
	 return link
	 
 }
 
 function openinfo(year,id){
	
	 var unit = getUnit(id);
	 
	 var title=unit+year+"年年度考核得分明细";
	 
	 if( !$("#tt").tabs("exists",title)){
		 $("#tt").tabs("add",{
				title: title,
				selected: true,
				closable:true,
				href:"reportinfo.jsp?unit="+id+"&year="+year
			}); 
	 }else{
		 $("#tt").tabs("select",title);
	 }
 }
 
 </script>