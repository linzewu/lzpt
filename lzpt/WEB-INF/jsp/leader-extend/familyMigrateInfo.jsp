<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <input name="isInit"  value="false" hidden="true"  tableId="familyMigrateInfo">
<table id="familyMigrateInfo"   data-options="
													                iconCls: 'icon-edit',
													                url:'cadreArchive!getLeaderInfoExtend.action?lex.actionType=familyMigrateInfo&lex.leaderInfoId=${ca.id}',
													                singleSelect: true,
													                toolbar: '#familyMigrateInfoTool',
													                onClickRow: familyMigrateInfo.onClickRow,
													                fitColumns:true">
				  <thead>
				        <tr>
				        	<th data-options="field:'lex.appellation',editor:{
																                         type:'validatebox',options:{required:true}
																                     },width : 100,">称谓</th>
							<th data-options="field:'lex.name',editor:{
																                        type:'validatebox',options:{required:true}
																                     },width : 100,">姓名</th>
							<th data-options="field:'lex.migrateCountry',editor:{
																                         type:'validatebox',options:{required:true}
																                     },width : 200,">移居国家（地区）</th>
																                     							                     							
				            <th data-options="field:'lex.migrateType',editor:{
																						 options:{
																                                valueField:'value',
																                                textField:'label',
																                                data:familyMigrateInfo.item,
																                                required:true,
																                                editable:false
																                            },
																                         type:'combobox'
																                     },
																                     width : 100,
																                     formatter:familyMigrateInfo.formaterChage">移居类别</th>
				            <th data-options="field:'lex.migrateInfoDate',editor:{
																                         type:'datebox'
																                     },width : 100,">移居时间</th>
				            <th data-options="field:'lex.migrateCity',editor:{
																                         type:'text'
																                     },width : 200,">移居城市</th>
				        </tr>
							</thead>
			</table>
	<div id="familyMigrateInfoTool" style="height: auto">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-add',plain:true" onclick="familyMigrateInfo.append()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="familyMigrateInfo.remove()">删除</a> <a href="javascript:void(0)"
			class="easyui-linkbutton"
			data-options="iconCls:'icon-save',plain:true" onclick="familyMigrateInfo.accept()">保存</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="familyMigrateInfo.reject()">撤销</a>
	</div>
