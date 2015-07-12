<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<input name="isInit"  value="false" hidden="true"  tableId="trainexperien">
<table id="trainexperien"  data-options="
																	url:'cadreArchive!getLeaderInfoExtend.action?lex.actionType=trainexperien&lex.leaderInfoId=${ca.id}',
													                iconCls: 'icon-edit',
													                singleSelect: true,
													                toolbar: '#trainexperienTool',
													                onClickRow: trainexperien.onClickRow,
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
				    		
						   <th data-options="field:'lex.texperise',editor:{
														                         type:'text'
														                     },width : 200,">培训内容</th>	
													                     
				        </tr>
							</thead>
			</table>
			
	<div id="trainexperienTool"  style="height: auto">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-add',plain:true" onclick="trainexperien.append()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="trainexperien.remove()">删除</a> <a href="javascript:void(0)"
			class="easyui-linkbutton"
			data-options="iconCls:'icon-save',plain:true" onclick="trainexperien.accept()">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="trainexperien.reject()">撤销</a>
	</div>
    