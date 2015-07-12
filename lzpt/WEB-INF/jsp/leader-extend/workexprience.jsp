<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<input name="isInit"  value="false" hidden="true"  tableId="workexprience">
<table id="workexprience" data-options="
																	url:'cadreArchive!getLeaderInfoExtend.action?lex.actionType=workexprience&lex.leaderInfoId=${ca.id}',
													                iconCls: 'icon-edit',
													                singleSelect: true,
													                toolbar: '#workexprienceTool',
													                onClickRow: workexprience.onClickRow,
													                fitColumns:true">
				  <thead>
				        <tr>
				            <th rowspan="2" data-options="field:'lex.bdate',editor:{
																						 type:'datebox',options:{required:true}
																                     },
																                     width : 100
																                   ">开始时间</th>
				            <th rowspan="2" data-options="field:'lex.edate',editor:{
																                       type:'datebox',options:{required:true}
																                     },width : 100,">结束时间</th>
				    		
						   <th data-options="field:'lex.wexperise',editor:{
														                         type:'text'
														                     },width : 200,">担任职务</th>	
													                     
				        </tr>
							</thead>
			</table>
			
	<div id="workexprienceTool"  style="height: auto">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-add',plain:true" onclick="workexprience.append()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="workexprience.remove()">删除</a> <a href="javascript:void(0)"
			class="easyui-linkbutton"
			data-options="iconCls:'icon-save',plain:true" onclick="workexprience.accept()">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="workexprience.reject()">撤销</a>
	</div>
    