<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<input name="isInit"  value="false" hidden="true" tableId="goAbroadSituation">
<table id="goAbroadSituation"   data-options="
																	url:'cadreArchive!getLeaderInfoExtend.action?lex.actionType=goAbroadSituation&lex.leaderInfoId=${ca.id}',
													                iconCls: 'icon-edit',
													                singleSelect: true,
													                toolbar: '#goAbroadSituationTool',
													                onClickRow: goAbroadSituation.onClickRow,
													                fitColumns:true">
				  <thead>
				        <tr>
				            <th data-options="field:'lex.startDate',editor:{
																						 type:'datebox',options:{required:true}
																                     },
																                     width : 100
																                   ">开始时间</th>
				            <th data-options="field:'lex.endDate',editor:{
																                       type:'datebox',options:{required:true}
																                     },width : 100,">结束时间</th>
				            <th data-options="field:'lex.toCountry',editor:{
																                         type:'text',options:{required:true}
																                     },width : 200,">所到国家（地区）</th>
						   <th data-options="field:'lex.reason',editor:{
															                         type:'text'
															                     },width : 100,">出国（境）事由</th>	
						   <th data-options="field:'lex.approveOrganization',editor:{
														                         type:'text'
														                     },width : 100,">审批机构</th>	
						   <th data-options="field:'lex.entrustOrganization',editor:{
														                         type:'text'
														                     },width : 100,">委托代办机构</th>								                     
				        </tr>
							</thead>
			</table>
			
	<div id="goAbroadSituationTool"  style="height: auto">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-add',plain:true" onclick="goAbroadSituation.append()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="goAbroadSituation.remove()">删除</a> <a href="javascript:void(0)"
			class="easyui-linkbutton"
			data-options="iconCls:'icon-save',plain:true" onclick="goAbroadSituation.accept()">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="goAbroadSituation.reject()">撤销</a>
	</div>
    