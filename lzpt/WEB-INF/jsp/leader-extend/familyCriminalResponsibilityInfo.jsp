<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <input name="isInit"  value="false" hidden="true"  tableId="familyCriminalResponsibilityInfo">
<table id="familyCriminalResponsibilityInfo"   data-options="
													                iconCls: 'icon-edit',
													                url:'cadreArchive!getLeaderInfoExtend.action?lex.actionType=familyCriminalResponsibilityInfo&lex.leaderInfoId=${ca.id}',
													                singleSelect: true,
													                toolbar: '#familyCriminalResponsibilityInfoTool',
													                onClickRow: familyCriminalResponsibilityInfo.onClickRow,
													                fitColumns:true">
				  <thead>
				        <tr>
				        	<th data-options="field:'lex.appellation',editor:{
																                         type:'validatebox',options:{required:true}
																                     },width : 100,">称谓</th>
							<th data-options="field:'lex.name',editor:{
																                        type:'validatebox',options:{required:true}
																                     },width : 100,">姓名</th>
							<th data-options="field:'lex.startDate',editor:{
																                         type:'datebox',options:{required:true}
																                     },width : 100,">被追究的时间</th>
							<th data-options="field:'lex.cause',editor:{
																                         type:'validatebox'
																                     },width : 200,">被追究的原因</th>
																                     							                     							
				            <th data-options="field:'lex.processPhase',editor:{
																						 options:{
																                                valueField:'value',
																                                textField:'label',
																                                data:familyCriminalResponsibilityInfo.item,
																                                required:true,
																                                editable:false
																                            },
																                         type:'combobox'
																                     },
																                     width : 100,
																                     formatter:familyCriminalResponsibilityInfo.formaterChage">处理阶段</th>
				            <th data-options="field:'lex.processFruit',editor:{
																                         type:'text'
																                     },width : 100,">处理结果</th>
				        </tr>
							</thead>
			</table>
	<div id="familyCriminalResponsibilityInfoTool" style="height: auto">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-add',plain:true" onclick="familyCriminalResponsibilityInfo.append()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="familyCriminalResponsibilityInfo.remove()">删除</a> <a href="javascript:void(0)"
			class="easyui-linkbutton"
			data-options="iconCls:'icon-save',plain:true" onclick="familyCriminalResponsibilityInfo.accept()">保存</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="familyCriminalResponsibilityInfo.reject()">撤销</a>
	</div>
