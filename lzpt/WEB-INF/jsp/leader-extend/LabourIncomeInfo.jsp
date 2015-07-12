<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <input name="isInit"  value="false" hidden="true" tableId="labourIncomeInfo">
<table id="labourIncomeInfo"  data-options="
													                iconCls: 'icon-edit',
													                url:'cadreArchive!getLeaderInfoExtend.action?lex.actionType=labourIncomeInfo&lex.leaderInfoId=${ca.id}',
													                singleSelect: true,
													                toolbar: '#labourIncomeInfoTool',
													                onClickRow: labourIncomeInfo.onClickRow,
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
				            <th data-options="field:'lex.lectures',editor:{
																                         type:'numberbox',options:{
																                         required:true,
																                          precision:2,
																                         max:9999999999}
																                     },width : 100">讲学(元/每年)</th>
							<th data-options="field:'lex.writing',editor:{
																                         type:'numberbox',options:{
																                          precision:2,
																                         max:9999999999}
																                     },width : 100">写作(元/每年)</th>
							<th data-options="field:'lex.consult',editor:{
																                         type:'numberbox',options:{
																                          precision:2,
																                         max:9999999999}
																                     },width : 100">咨询(元/每年)</th>
							<th data-options="field:'lex.copyEdit',editor:{
																                         type:'numberbox',options:{
																                          precision:2,
																                         max:9999999999}
																                     },width : 100">审稿(元/每年)</th>
							<th data-options="field:'lex.painting',editor:{
																                         type:'numberbox',options:{
																                          precision:2,
																                         max:9999999999}
																                     },width : 100">书画(元/每年)</th>
							<th data-options="field:'lex.other',editor:{
																                         type:'numberbox',options:{
																                          precision:2,
																                         max:9999999999}
																                     },width : 100">其他(元/每年)</th>									                     									                     											                     									                     
				        </tr>
							</thead>
			</table>
	<div id="labourIncomeInfoTool" style="height: auto">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-add',plain:true" onclick="labourIncomeInfo.append()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="labourIncomeInfo.remove()">删除</a> <a href="javascript:void(0)"
			class="easyui-linkbutton"
			data-options="iconCls:'icon-save',plain:true" onclick="labourIncomeInfo.accept()">保存</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="labourIncomeInfo.reject()">撤销</a>
	</div>
