<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <input name="isInit"  value="true" hidden="true" tableId="marriageChangeInfo">
<table id="marriageChangeInfo"  class="easyui-datagrid" data-options="
													                iconCls: 'icon-edit',
													                url:'cadreArchive!getLeaderInfoExtend.action?lex.actionType=MarriageChangeInfo&lex.leaderInfoId=${ca.id}',
													                singleSelect: true,
													                toolbar: '#marriageChangeInfoTool',
													                onClickRow: marriageChangeInfo.onClickRow,
													                fitColumns:true">
				  <thead>
				        <tr>
				            <th data-options="field:'lex.changeInfo',editor:{
																						 options:{
																                                valueField:'value',
																                                textField:'label',
																                                data:marriageChangeInfo.item,
																                                required:true,
																                                editable:false
																                            },
																                         type:'combobox'
																                     },
																                     width : 100,
																                     formatter:marriageChangeInfo.formaterChage">变化情况</th>
				            <th data-options="field:'lex.changeDate',editor:{
																                         type:'datebox'
																                     },width : 100,">变化时间</th>
				            <th data-options="field:'lex.changeCause',editor:{
																                         type:'text'
																                     },width : 200,">变化原因</th>
				        </tr>
							</thead>
			</table>
	<div id="marriageChangeInfoTool" style="height: auto">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-add',plain:true" onclick="marriageChangeInfo.append()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="marriageChangeInfo.remove()">删除</a> <a href="javascript:void(0)"
			class="easyui-linkbutton"
			data-options="iconCls:'icon-save',plain:true" onclick="marriageChangeInfo.accept()">保存</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="marriageChangeInfo.reject()">撤销</a>
	</div>
