<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<input name="isInit"  value="false" hidden="true"  tableId="childrenMarryHongkong">
<table id="childrenMarryHongkong"  data-options="
																	url:'cadreArchive!getLeaderInfoExtend.action?lex.actionType=childrenMarryHongkong&lex.leaderInfoId=${ca.id}',
													                iconCls: 'icon-edit',
													                singleSelect: true,
													                toolbar: '#childrenMarryHongkongTool',
													                onClickRow: childrenMarryHongkong.onClickRow,
													                fitColumns:true">
				  <thead>
				        <tr>
				            <th rowspan="2" data-options="field:'lex.callName',editor:{
																						 type:'validatebox',options:{required:true}
																                     },
																                     width : 100
																                   ">称谓</th>
				            <th rowspan="2" data-options="field:'lex.userName',editor:{
																                       type:'validatebox',options:{required:true}
																                     },width : 100,">姓名</th>
				    		<th colspan="5">子女的配偶基本情况</th>
				    	</tr>
				    	<tr>
				            <th data-options="field:'lex.childrenPartnerName',editor:{
																                         type:'validatebox',options:{required:true}
																                     },width : 100,">姓名</th>
						   <th data-options="field:'lex.nationality',editor:{
															                         type:'text'
															                     },width : 200,">地区</th>	
						   <th data-options="field:'lex.workUnit',editor:{
														                         type:'text'
														                     },width : 200,">工作（学习）单位</th>	
						   <th data-options="field:'lex.business',editor:{
														                         type:'text'
														                     },width : 200,">职务</th>	
						   <th data-options="field:'lex.registerDate',editor:{
														                         type:'datebox'
														                     },width : 100,">登记时间</th>								                     
				        </tr>
							</thead>
			</table>
			
	<div id="childrenMarryHongkongTool"  style="height: auto">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-add',plain:true" onclick="childrenMarryHongkong.append()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="childrenMarryHongkong.remove()">删除</a> <a href="javascript:void(0)"
			class="easyui-linkbutton"
			data-options="iconCls:'icon-save',plain:true" onclick="childrenMarryHongkong.accept()">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="childrenMarryHongkong.reject()">撤销</a>
	</div>
    