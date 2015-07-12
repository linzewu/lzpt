<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <input name="isInit"  value="false" hidden="true" tableId="salaryAndBonusInfo">
<table id="salaryAndBonusInfo"  data-options="
													                iconCls: 'icon-edit',
													                url:'cadreArchive!getLeaderInfoExtend.action?lex.actionType=salaryAndBonusInfo&lex.leaderInfoId=${ca.id}',
													                singleSelect: true,
													                toolbar: '#salaryAndBonusInfoTool',
													                onClickRow: salaryAndBonusInfo.onClickRow,
													                fitColumns:true">
				  <thead>
				        <tr>
				        	<th data-options="field:'lex.year',editor:{
																                         type:'numberbox',options:{
																                         required:true,
																                         min:1900,
																                         max:2099}
																                     },width : 100">年份</th>
				            <th data-options="field:'lex.total',editor:{
																                         type:'numberbox',options:{
																                         required:true,
																                         precision:2,
																                         max:99999999999}
																                     },width : 100,">合计(元/每年)</th>
				            <th data-options="field:'lex.salary',editor:{
																                         type:'numberbox',options:{
																                         required:true,
																                          precision:2,
																                         max:9999999999}
																                     },width : 100">工资(元/每年)</th>
							<th data-options="field:'lex.bonus',editor:{
																                         type:'numberbox',options:{
																                          precision:2,
																                         max:9999999999}
																                     },width : 100">奖金(元/每年)</th>
							<th data-options="field:'lex.other',editor:{
																                         type:'numberbox',options:{
																                          precision:2,
																                         max:9999999999}
																                     },width : 100">其他(元/每年)</th>											                     									                     
				        </tr>
							</thead>
			</table>
	<div id="salaryAndBonusInfoTool" style="height: auto">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-add',plain:true" onclick="salaryAndBonusInfo.append()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="salaryAndBonusInfo.remove()">删除</a> <a href="javascript:void(0)"
			class="easyui-linkbutton"
			data-options="iconCls:'icon-save',plain:true" onclick="salaryAndBonusInfo.accept()">保存</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="salaryAndBonusInfo.reject()">撤销</a>
	</div>
