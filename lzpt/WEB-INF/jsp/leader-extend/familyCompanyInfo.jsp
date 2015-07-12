<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <input name="isInit"  value="false" hidden="true"  tableId="familyCompanyInfo">
<table id="familyCompanyInfo"   data-options="
													                iconCls: 'icon-edit',
													                url:'cadreArchive!getLeaderInfoExtend.action?lex.actionType=familyCompanyInfo&lex.leaderInfoId=${ca.id}',
													                singleSelect: true,
													                toolbar: '#familyCompanyInfoTool',
													                onClickRow: familyCompanyInfo.onClickRow,
													                fitColumns:true">
				  <thead>
				        <tr>
				        	<th data-options="field:'lex.appellation',editor:{
																                         type:'validatebox',options:{required:true}
																                     },width : 100,">称谓</th>
							<th data-options="field:'lex.name',editor:{
																                        type:'validatebox',options:{required:true}
																                     },width : 100,">姓名</th>
							<th data-options="field:'lex.companyName',editor:{
																                         type:'validatebox',options:{required:true}
																                     },width : 100,">企业名称</th>
							<th data-options="field:'lex.scope',editor:{
																                         type:'validatebox'
																                     },width : 200,">经营范围</th>
							<th data-options="field:'lex.registerCapital',editor:{
																                         type:'numberbox',options:{
																                          precision:4,
																                         max:9999999999}
																                     },width : 100">注册资本（资金）万元</th>									                     									                     							                     							
				        	<th data-options="field:'lex.capital',editor:{
																                         type:'numberbox',options:{
																                          precision:4,
																                         max:9999999999}
																                     },width : 100">出资金额（万元）</th>
							<th data-options="field:'lex.capitalScale',editor:{
																                         type:'numberbox',options:{
																                          precision:2,
																                         max:100,
																                         min:0}
																                     },width : 100">出资比例%</th>
				        </tr>
							</thead>
			</table>
	<div id="familyCompanyInfoTool" style="height: auto">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-add',plain:true" onclick="familyCompanyInfo.append()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="familyCompanyInfo.remove()">删除</a> <a href="javascript:void(0)"
			class="easyui-linkbutton"
			data-options="iconCls:'icon-save',plain:true" onclick="familyCompanyInfo.accept()">保存</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="familyCompanyInfo.reject()">撤销</a>
	</div>
