<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <input name="isInit"  value="false" hidden="true" tableId="familyHousePropertyInfo">
<table id="familyHousePropertyInfo" data-options="
													                iconCls: 'icon-edit',
													                url:'cadreArchive!getLeaderInfoExtend.action?lex.actionType=familyHousePropertyInfo&lex.leaderInfoId=${ca.id}',
													                singleSelect: true,
													                toolbar: '#familyHousePropertyInfoTool',
													                onClickRow: familyHousePropertyInfo.onClickRow,
													                fitColumns:true">
				  <thead>
				        <tr>
				        	<th data-options="field:'lex.propertyOwner',editor:{
																                         type:'validatebox',options:{required:true}
																                     },width : 80,">产权人</th>
							<th data-options="field:'lex.relation',editor:{
																                        type:'validatebox',options:{required:true}
																                     },width : 100,">与本人关系</th>
																                     
				           <th data-options="field:'lex.houseSource',editor:{
																						 options:{
																                                valueField:'value',
																                                textField:'label',
																                                data:familyHousePropertyInfo.houseSource,
																                                editable:false
																                            },
																                         type:'combobox'
																                     },
																                     width : 80,
																                     formatter:familyHousePropertyInfo.formaterHouseSource">房产来源</th>
							<th data-options="field:'lex.houseWhereabouts',editor:{
																						 options:{
																                                valueField:'value',
																                                textField:'label',
																                                data:familyHousePropertyInfo.houseWhereabouts,
																                                editable:false
																                            },
																                         type:'combobox'
																                     },
																                     width : 80,
																                     formatter:familyHousePropertyInfo.formaterHouseWhereabouts">房产去向</th>									                     
				            <th data-options="field:'lex.address',editor:{
																                      type:'validatebox',options:{required:true}
																                     },width : 250,">具体地址</th>
																                     
							<th data-options="field:'lex.area',editor:{
																                         type:'numberbox',options:{
																                          precision:2,
																                          min:0,
																                         max:9999999999}
																                     },width : 80">建筑面积（m²）</th>
							<th data-options="field:'lex.propertyType',editor:{
																						 options:{
																                                valueField:'value',
																                                textField:'label',
																                                data:familyHousePropertyInfo.propertyType,
																                                editable:false
																                            },
																                         type:'combobox'
																                     },
																                     width : 80,
																                     formatter:familyHousePropertyInfo.formaterPropertyType">产权性质</th>
																                     									                     
				            <th data-options="field:'lex.buyingTime',editor:{
																                       type:'validatebox'
																                     },width : 80,">购买时间(年月)</th>
				            <th data-options="field:'lex.money',editor:{
																                         type:'numberbox',options:{
																                          precision:4,
																                          min:0,
																                         max:9999999999}
																                     },width : 80">交易金额（万元）</th>
				        </tr>
							</thead>
			</table>
	<div id="familyHousePropertyInfoTool" style="height: auto">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-add',plain:true" onclick="familyHousePropertyInfo.append()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="familyHousePropertyInfo.remove()">删除</a> <a href="javascript:void(0)"
			class="easyui-linkbutton"
			data-options="iconCls:'icon-save',plain:true" onclick="familyHousePropertyInfo.accept()">保存</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="familyHousePropertyInfo.reject()">撤销</a>
	</div>
