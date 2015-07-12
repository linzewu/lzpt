<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <input name="isInit"  value="false" hidden="true"  tableId="familyJobInfo">
<table id="familyJobInfo"   data-options="
													                iconCls: 'icon-edit',
													                url:'cadreArchive!getLeaderInfoExtend.action?lex.actionType=familyJobInfo&lex.leaderInfoId=${ca.id}',
													                singleSelect: true,
													                toolbar: '#familyJobInfoTool',
													                onClickRow: familyJobInfo.onClickRow,
													                fitColumns:true">
				  <thead>
				        <tr>
				        	<th data-options="field:'lex.appellation',editor:{
																                         type:'validatebox',options:{required:true}
																                     },width : 100,">称谓</th>
							<th data-options="field:'lex.name',editor:{
																                        type:'validatebox',options:{required:true}
																                     },width : 100,">姓名</th>
							<th data-options="field:'lex.idCard',editor:{
																                         type:'validatebox'
																                     },width : 100,">身份证</th>
							<th data-options="field:'lex.unit',editor:{
																                         type:'validatebox'
																                     },width : 100,">工作（学习）单位</th>
							<th data-options="field:'lex.duties',editor:{
																                         type:'validatebox'
																                     },width : 200,">现担职务</th>									                     									                     							                     							
				            <th data-options="field:'lex.unitType',editor:{
																						 options:{
																                                data:familyJobInfo.item,
																                                editable:false
																                            },
																                         type:'combotree'
																                     },
																                     width : 100,
																                     formatter:familyJobInfo.formaterChage">单位性质</th>
				        </tr>
							</thead>
			</table>
	<div id="familyJobInfoTool" style="height: auto">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-add',plain:true" onclick="familyJobInfo.append()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="familyJobInfo.remove()">删除</a> <a href="javascript:void(0)"
			class="easyui-linkbutton"
			data-options="iconCls:'icon-save',plain:true" onclick="familyJobInfo.accept()">保存</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="familyJobInfo.reject()">撤销</a>
	</div>
