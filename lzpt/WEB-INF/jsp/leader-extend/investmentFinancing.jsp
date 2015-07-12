<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<input name="isInit" value="false" hidden="true" tableId="shares,foundation,futures">
<table id="shares"
	data-options="
																	url:'cadreArchive!getLeaderInfoExtend.action?lex.actionType=shares&lex.leaderInfoId=${ca.id}',
													                iconCls: 'icon-edit',
													                singleSelect: true,
													                toolbar: '#sharesTool',
													                onClickRow: shares.onClickRow,
													                fitColumns:true">
	<thead>
		<tr>
			<th rowspan="2"
				data-options="field:'lex.callName',editor:{
																						 type:'validatebox',options:{required:true}
																                     },
																                     width : 100
																                   ">称谓</th>
			<th rowspan="2"
				data-options="field:'lex.userName',editor:{
																                       type:'validatebox',options:{required:true}
																                     },width : 100,">姓名</th>
			<th colspan="3">股票</th>
		</tr>
		<tr>
			<th
				data-options="field:'lex.shareName',editor:{
														                         type:'text'
														                     },width : 200,">股票名称及代码</th>
			<th
				data-options="field:'lex.shareNumber',editor:{
														                         type:'text'
														                     },width : 200,">持股份额</th>
			<th
				data-options="field:'lex.capitalization',editor:{
														                         type:'numberbox',options:{
																                         precision:2,
																                         max:99999999999}
														                     },width : 300,">填报前-交易日股票总市值（元）</th>

		</tr>
	</thead>
</table>

<div id="sharesTool" style="height: auto">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		data-options="iconCls:'icon-add',plain:true" onclick="shares.append()">添加</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"
		data-options="iconCls:'icon-remove',plain:true"
		onclick="shares.remove()">删除</a> <a href="javascript:void(0)"
		class="easyui-linkbutton"
		data-options="iconCls:'icon-save',plain:true"
		onclick="shares.accept()">保存</a> <a href="javascript:void(0)"
		class="easyui-linkbutton"
		data-options="iconCls:'icon-undo',plain:true"
		onclick="shares.reject()">撤销</a>
</div>

<br />
<table id="foundation"
	data-options="
																	url:'cadreArchive!getLeaderInfoExtend.action?lex.actionType=foundation&lex.leaderInfoId=${ca.id}',
													                iconCls: 'icon-edit',
													                singleSelect: true,
													                toolbar: '#foundationTool',
													                onClickRow: foundation.onClickRow,
													                fitColumns:true">
	<thead>
		<tr>
			<th rowspan="2"
				data-options="field:'lex.callName',editor:{
																						 type:'validatebox',options:{required:true}
																                     },
																                     width : 100
																                   ">称谓</th>
			<th rowspan="2"
				data-options="field:'lex.userName',editor:{
																                       type:'validatebox',options:{required:true}
																                     },width : 100,">姓名</th>
			<th colspan="3">基金</th>
		</tr>
		<tr>
			<th
				data-options="field:'lex.foundationName',editor:{
														                         type:'text'
														                     },width : 200,">基金名称及代码</th>
			<th
				data-options="field:'lex.foundationNumber',editor:{
														                         type:'text'
														                     },width : 200,">基金份额</th>
			<th
				data-options="field:'lex.capitalization',editor:{
														                         type:'numberbox',options:{
																                         precision:2,
																                         max:99999999999}
														                     },width : 300,">填报前-交易日基金总市值（元）</th>

		</tr>
	</thead>
</table>

<div id="foundationTool" style="height: auto">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		data-options="iconCls:'icon-add',plain:true"
		onclick="foundation.append()">添加</a> <a href="javascript:void(0)"
		class="easyui-linkbutton"
		data-options="iconCls:'icon-remove',plain:true"
		onclick="foundation.remove()">删除</a> <a href="javascript:void(0)"
		class="easyui-linkbutton"
		data-options="iconCls:'icon-save',plain:true"
		onclick="foundation.accept()">保存</a> <a href="javascript:void(0)"
		class="easyui-linkbutton"
		data-options="iconCls:'icon-undo',plain:true"
		onclick="foundation.reject()">撤销</a>
</div>

<br />
<table id="futures"
	data-options="
																	url:'cadreArchive!getLeaderInfoExtend.action?lex.actionType=futures&lex.leaderInfoId=${ca.id}',
													                iconCls: 'icon-edit',
													                singleSelect: true,
													                toolbar: '#futuresTool',
													                onClickRow: futures.onClickRow,
													                fitColumns:true">
	<thead>
		<tr>
			<th rowspan="2"
				data-options="field:'lex.callName',editor:{
																						 type:'validatebox',options:{required:true}
																                     },
																                     width : 100
																                   ">称谓</th>
			<th rowspan="2"
				data-options="field:'lex.userName',editor:{
																                       type:'validatebox',options:{required:true}
																                     },width : 100,">姓名</th>
			<th colspan="4">期货</th>
		</tr>
		<tr>
			<th
				data-options="field:'lex.futuresType',editor:{
														                         type:'text'
														                     },width : 200,">期末持仓品种</th>
			<th
				data-options="field:'lex.futuresNumber',editor:{
														                         type:'numberbox',options:{
																                         precision:2,
																                         max:99999999999}
														                     },width : 200,">期末持仓数量（手）</th>
			<th
				data-options="field:'lex.futureUse',editor:{
														                         type:'numberbox',options:{
																                         precision:2,
																                         max:99999999999}
														                     },width : 200,">持仓占用保证金（元）</th>
			<th
				data-options="field:'lex.futureAvailable',editor:{
														                         type:'numberbox',options:{
																                         precision:2,
																                         max:99999999999}
														                     },width : 200,">可用资金（元）</th>

		</tr>
	</thead>
</table>

<div id="futuresTool" style="height: auto">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		data-options="iconCls:'icon-add',plain:true"
		onclick="futures.append()">添加</a> <a href="javascript:void(0)"
		class="easyui-linkbutton"
		data-options="iconCls:'icon-remove',plain:true"
		onclick="futures.remove()">删除</a> <a href="javascript:void(0)"
		class="easyui-linkbutton"
		data-options="iconCls:'icon-save',plain:true"
		onclick="futures.accept()">保存</a> <a href="javascript:void(0)"
		class="easyui-linkbutton"
		data-options="iconCls:'icon-undo',plain:true"
		onclick="futures.reject()">撤销</a>
</div>