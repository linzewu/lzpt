<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <input name="isInit"  value="false" hidden="true" tableId="goAbroadCredentials">
<table id="goAbroadCredentials"  data-options="
													                iconCls: 'icon-edit',
													                url:'cadreArchive!getLeaderInfoExtend.action?lex.actionType=goAbroadCredentials&lex.leaderInfoId=${ca.id}',
													                singleSelect: true,
													                toolbar: '#goAbroadCredentialsTool',
													                onClickRow: goAbroadCredentials.onClickRow,
													                fitColumns:true">
				  <thead>
				        <tr>
				            <th data-options="field:'lex.credentialsName',editor:{
																						 options:{
																                                valueField:'value',
																                                textField:'label',
																                                data:goAbroadCredentials.item,
																                                required:true,
																                                editable:false
																                            },
																                         type:'combobox'
																                     },
																                     width : 100,
																                      formatter:goAbroadCredentials.formaterChage
																                   ">因私普通护照</th>
				            <th data-options="field:'lex.credentialsCard',editor:{
																                         type:'validatebox',options:{required:true}
																                     },width : 100">证件编号</th>
				            <th data-options="field:'lex.organizationName',editor:{
																                         type:'text'
																                     },width : 200,">发证机关</th>
						   <th data-options="field:'lex.startDate',editor:{
															                         type:'datebox'
															                     },width : 100,">发证时间</th>	
							<th data-options="field:'lex.endDate',editor:{
															                         type:'datebox'
															                     },width : 100,">有效时间</th>	
						   <th data-options="field:'lex.custodian',editor:{
														                         type:'text'
														                     },width : 100,">保管机构</th>								                     
				        </tr>
							</thead>
			</table>
			
	<div id="goAbroadCredentialsTool"  style="height: auto">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-add',plain:true" onclick="goAbroadCredentials.append()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="goAbroadCredentials.remove()">删除</a> <a href="javascript:void(0)"
			class="easyui-linkbutton"
			data-options="iconCls:'icon-save',plain:true" onclick="goAbroadCredentials.accept()">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="goAbroadCredentials.reject()">撤销</a>
	</div>
    