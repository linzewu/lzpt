//提供扩展表的功能对象
function leaderExtendManager(){
	this.editIndex=undefined;
	this.onClickRow=function(index,id,actionType) {
		if (this.editIndex != index) {
			if (this.endEditing(id,actionType)) {
				$("#"+id).datagrid('selectRow', index).datagrid(
						'beginEdit', index);
				this.editIndex = index;
			} else {
				$('#'+id).datagrid('selectRow', this.editIndex);
			}
		}
	};
	
	this.endEditing= function(id,actionType) {
			if (this.editIndex == undefined) {
				return true;
			}
			if ($('#'+id).datagrid('validateRow', this.editIndex)) {
				$('#'+id).datagrid('endEdit', this.editIndex);
				var rowData = $('#'+id).datagrid('getRows')[this.editIndex];
				if (rowData['lex.leaderInfoId'] == null) {
					rowData['lex.leaderInfoId'] = $("#caId").val();
				}
				rowData['lex.actionType'] = actionType;
				console.log(rowData);
				var dataId = saveData(rowData);
				if(dataId!=null){
					rowData['lex.id'] = dataId;
					this.editIndex = undefined;
					return true;
				}else{
					$.messager.alert("提示","保存出错，请联系管理员","error");
					$('#'+id).datagrid('selectRow', this.editIndex)
					.datagrid('beginEdit', this.editIndex);
					return false;
				}
			} else {
				return false;
			}
		};
		
		this.append = function(id,actionType) {
			console.log(id+"\t"+actionType);
			if (this.endEditing(id,actionType)) {
				$('#'+id).datagrid('appendRow', {});
				this.editIndex = $('#'+id).datagrid('getRows').length - 1;
				$('#'+id).datagrid('selectRow', this.editIndex)
						.datagrid('beginEdit', this.editIndex);
			}
		};
		
		this.remove = function(id,actionType) {
			if (this.editIndex == undefined) {
				return
			}
			var rowData = $('#'+id).datagrid('getRows')[this.editIndex];
			if(rowData['lex.id']!=null&&rowData['lex.id']!=undefined&&rowData['lex.id']!=""){
				var  data = deleteData(actionType,rowData['lex.id']);
				if(data.state!=200){
					$.messager.alert("删除出错",data.errorInfo,"error")
				}
			}
			$('#'+id).datagrid('cancelEdit', this.editIndex)
					.datagrid('deleteRow', this.editIndex);
			this.editIndex = undefined;
		};
		
		this.accept = function(id,actionType) {
			if (this.endEditing(id,actionType)) {
				$('#'+id).datagrid('acceptChanges');
			}
		};
		this.reject = function(id) {
			
			$('#'+id).datagrid('rejectChanges');
			this.editIndex = undefined;
		}
}
// 保存数据的方法
function saveData(data) {
	var responseText = $.ajax({
		type: "POST",
		url : "cadreArchive!saveLeaderExtend.action",
		async : false,
		data : data
	}).responseText;
	
	var rdata = $.parseJSON(responseText);
	if(rdata.state==200){
		return rdata.sid;
	}
	return null;
}
// 删除数据的方法
function deleteData(actionType,id) {
	console.log(actionType+"\t"+id);
	var data={'lex.actionType':actionType,'lex.id':id};
	var text= $.ajax({
		type: "POST",
		url : "cadreArchive!deleteLeaderExtend.action",
		async : false,
		data : data
	}).responseText;
	
	return $.parseJSON(text);
}

function leaderReport1TabSelect(title,index){
	tabOnSelect("leaderReport1",title,index);
}
function leaderReport2TabSelect(title,index){
	tabOnSelect("leaderReport2",title,index);
}
function exprienceTabSelect(title,index){
	tabOnSelect("worktrainexperien",title,index);
}

function tabOnSelect(id,title,index){
	var panel = $('#'+id).tabs('getTab',index);
	var initData=panel.find("input[name=isInit]");
	var isInit=initData.val();
	if(isInit=='false'){
		var tableIds = initData.attr('tableId');
		var ids = tableIds.split(",");
		for(var i in ids){
			 $("#"+ids[i]).datagrid();
		}
		initData.val('true');
	}
}


// 1、婚姻变化情况
var marriageChangeInfoObj =  new leaderExtendManager();
var marriageChangeInfo = {
	id:'marriageChangeInfo',
	item : datacode.marriageChage,
	onClickRow : function(index) {
		marriageChangeInfoObj.onClickRow(index, marriageChangeInfo.id,marriageChangeInfo.id);
	},
	append : function() {
		marriageChangeInfoObj.append(this.id, this.id);
	},
	remove : function() {
		marriageChangeInfoObj.remove(this.id, this.id);
	},
	accept : function() {
		marriageChangeInfoObj.accept(this.id, this.id)
	},
	reject : function() {
		marriageChangeInfoObj.reject(this.id);
	},
	formaterChage : function(value, row) {
		for ( var i in marriageChangeInfo.item) {
			if (marriageChangeInfo.item[i].value == value) {
				return marriageChangeInfo.item[i].label;
			}
		}
		return value;
	}
};
//2、本人持有因私出境证件情况
var goAbroadCredentialsObj =  new leaderExtendManager();
var goAbroadCredentials = {
	id:'goAbroadCredentials',
	item : datacode.goAbroadCredentials,
	onClickRow : function(index) {
		goAbroadCredentialsObj.onClickRow(index, goAbroadCredentials.id,goAbroadCredentials.id);
	},
	append : function() {
		goAbroadCredentialsObj.append(this.id, this.id);
	},
	remove : function() {
		goAbroadCredentialsObj.remove(this.id, this.id);
	},
	accept : function() {
		goAbroadCredentialsObj.accept(this.id, this.id)
	},
	reject : function() {
		goAbroadCredentialsObj.reject(this.id);
	},
	formaterChage : function(value, row) {
		for ( var i in goAbroadCredentials.item) {
			if (goAbroadCredentials.item[i].value == value) {
				return goAbroadCredentials.item[i].label;
			}
		}
		return value;
	}
};

// 3、本人因私出境情况
var goAbroadSituationObj =  new leaderExtendManager();
var goAbroadSituation = {
	id:'goAbroadSituation',
	actionType:'goAbroadSituation',
	onClickRow : function(index) {
		goAbroadSituationObj.onClickRow(index,goAbroadSituation.id,goAbroadSituation.actionType);
	},
	append : function() {
		goAbroadSituationObj.append(this.id,this.actionType);
	},
	remove : function() {
		goAbroadSituationObj.remove(this.id,this.actionType);
	},
	accept : function() {
		goAbroadSituationObj.accept(this.id,this.actionType);
	},
	reject : function() {
		goAbroadSituationObj.reject(this.id);
	}
};

//4、子女与外国人、无国籍人通婚情况
var childrenMarryForeignerObj =  new leaderExtendManager();
var childrenMarryForeigner = {
	id:'childrenMarryForeigner',
	actionType:'childrenMarryForeigner',
	onClickRow : function(index) {
		childrenMarryForeignerObj.onClickRow(index,childrenMarryForeigner.id,childrenMarryForeigner.actionType);
	},
	append : function() {
		childrenMarryForeignerObj.append(this.id,this.actionType);
	},
	remove : function() {
		childrenMarryForeignerObj.remove(this.id,this.actionType);
	},
	accept : function() {
		childrenMarryForeignerObj.accept(this.id,this.actionType);
	},
	reject : function() {
		childrenMarryForeignerObj.reject(this.id);
	}
};

//5、子女与港澳以及台湾居民通婚情况
var childrenMarryHongkongObj =  new leaderExtendManager();
var childrenMarryHongkong = {
	id:'childrenMarryHongkong',
	actionType:'childrenMarryHongkong',
	onClickRow : function(index) {
		childrenMarryHongkongObj.onClickRow(index,childrenMarryHongkong.id,childrenMarryHongkong.actionType);
	},
	append : function() {
		childrenMarryHongkongObj.append(this.id,this.actionType);
	},
	remove : function() {
		childrenMarryHongkongObj.remove(this.id,this.actionType);
	},
	accept : function() {
		childrenMarryHongkongObj.accept(this.id,this.actionType);
	},
	reject : function() {
		childrenMarryHongkongObj.reject(this.id);
	}
};

//6、子女及配偶国（境）外的情况
var familyMigrateInfoObj =  new leaderExtendManager();
var familyMigrateInfo = {
	id:'familyMigrateInfo',
	item : datacode.familyMigrateInfo,
	onClickRow : function(index) {
		familyMigrateInfoObj.onClickRow(index, familyMigrateInfo.id,familyMigrateInfo.id);
	},
	append : function() {
		familyMigrateInfoObj.append(this.id, this.id);
	},
	remove : function() {
		familyMigrateInfoObj.remove(this.id, this.id);
	},
	accept : function() {
		familyMigrateInfoObj.accept(this.id, this.id)
	},
	reject : function() {
		familyMigrateInfoObj.reject(this.id);
	},
	formaterChage : function(value, row) {
		for ( var i in familyMigrateInfo.item) {
			if (familyMigrateInfo.item[i].value == value) {
				return familyMigrateInfo.item[i].label;
			}
		}
		return value;
	}
};


//7、子女及配就业情况
var familyJobInfoObj =  new leaderExtendManager();
var familyJobInfo = {
	id:'familyJobInfo',
	item : datacode.familyJobInfo,
	onClickRow : function(index) {
		familyJobInfoObj.onClickRow(index, familyJobInfo.id,familyJobInfo.id);
	},
	append : function() {
		familyJobInfoObj.append(this.id, this.id);
	},
	remove : function() {
		familyJobInfoObj.remove(this.id, this.id);
	},
	accept : function() {
		familyJobInfoObj.accept(this.id, this.id)
	},
	reject : function() {
		familyJobInfoObj.reject(this.id);
	},
	formaterChage : function(value, row) {
		if(value==0||value==""){
			return '';
		}
		var formaterValue = familyJobInfo.getTreeVlaue(value, familyJobInfo.item);
		console.log(value+"\t"+formaterValue);
		if(formaterValue!=null&&formaterValue!=undefined){
			return formaterValue;
		}
		return value;
	},
	getTreeVlaue:function(value,data){
		for ( var i in data) {
			if (data[i].id == value) {
				return data[i]['text'];
			}
			if(data[i].children!=null&&data[i].children!=undefined){
				var strData = this.getTreeVlaue(value, data[i].children);
				if(strData!=null&&strData!=undefined){
					return strData;
				}
			}
		}
	}
};

//8、子女及配偶被司法机关追究刑事责任情况
var familyCriminalResponsibilityInfoObj =  new leaderExtendManager();
var familyCriminalResponsibilityInfo = {
	id:'familyCriminalResponsibilityInfo',
	item : datacode.processPhase,
	onClickRow : function(index) {
		familyCriminalResponsibilityInfoObj.onClickRow(index, familyCriminalResponsibilityInfo.id,familyCriminalResponsibilityInfo.id);
	},
	append : function() {
		familyCriminalResponsibilityInfoObj.append(this.id, this.id);
	},
	remove : function() {
		familyCriminalResponsibilityInfoObj.remove(this.id, this.id);
	},
	accept : function() {
		familyCriminalResponsibilityInfoObj.accept(this.id, this.id)
	},
	reject : function() {
		familyCriminalResponsibilityInfoObj.reject(this.id);
	},
	formaterChage : function(value, row) {
		for ( var i in familyCriminalResponsibilityInfo.item) {
			if (familyCriminalResponsibilityInfo.item[i].value == value) {
				return familyCriminalResponsibilityInfo.item[i].label;
			}
		}
		return value;
	}
};

//工作经历
var workexprienceObj =  new leaderExtendManager();
var workexprience = {
	id:'workexprience',
	actionType:'workexprience',
	onClickRow : function(index) {
		workexprienceObj.onClickRow(index,workexprience.id,workexprience.actionType);
	},
	append : function() {
		workexprienceObj.append(this.id,this.actionType);
	},
	remove : function() {
		workexprienceObj.remove(this.id,this.actionType);
	},
	accept : function() {
		workexprienceObj.accept(this.id,this.actionType);
	},
	reject : function() {
		workexprienceObj.reject(this.id);
	}
};

//培训经历
var trainexperienObj =  new leaderExtendManager();
var trainexperien = {
	id:'trainexperien',
	actionType:'trainexperien',
	onClickRow : function(index) {
		trainexperienObj.onClickRow(index,trainexperien.id,trainexperien.actionType);
	},
	append : function() {
		trainexperienObj.append(this.id,this.actionType);
	},
	remove : function() {
		trainexperienObj.remove(this.id,this.actionType);
	},
	accept : function() {
		trainexperienObj.accept(this.id,this.actionType);
	},
	reject : function() {
		trainexperienObj.reject(this.id);
	}
};

//1、本人津贴及各类奖金、津贴、补贴等
var salaryAndBonusInfoObj =  new leaderExtendManager();
var salaryAndBonusInfo = {
	id:'salaryAndBonusInfo',
	onClickRow : function(index) {
		salaryAndBonusInfoObj.onClickRow(index,salaryAndBonusInfo.id,salaryAndBonusInfo.id);
	},
	append : function() {
		salaryAndBonusInfoObj.append(this.id,this.id);
	},
	remove : function() {
		salaryAndBonusInfoObj.remove(this.id,this.id);
	},
	accept : function() {
		salaryAndBonusInfoObj.accept(this.id,this.id);
	},
	reject : function() {
		salaryAndBonusInfoObj.reject(this.id);
	}
};

//2、本人从事讲学、写作、咨询、审稿、劳务等所得
var labourIncomeInfoObj =  new leaderExtendManager();
var labourIncomeInfo = {
	id:'labourIncomeInfo',
	onClickRow : function(index) {
		labourIncomeInfoObj.onClickRow(index,labourIncomeInfo.id,labourIncomeInfo.id);
	},
	append : function() {
		labourIncomeInfoObj.append(this.id,this.id);
	},
	remove : function() {
		labourIncomeInfoObj.remove(this.id,this.id);
	},
	accept : function() {
		labourIncomeInfoObj.accept(this.id,this.id);
	},
	reject : function() {
		labourIncomeInfoObj.reject(this.id);
	}
};

//3、本人、配偶及子女的房产情况
var familyHousePropertyInfoObj =  new leaderExtendManager();
var familyHousePropertyInfo = {
	id:'familyHousePropertyInfo',
	houseWhereabouts : datacode.houseWhereabouts,
	houseSource : datacode.houseSource,
	propertyType : datacode.propertyType,
	onClickRow : function(index) {
		familyHousePropertyInfoObj.onClickRow(index, familyHousePropertyInfo.id,familyHousePropertyInfo.id);
	},
	append : function() {
		familyHousePropertyInfoObj.append(this.id, this.id);
	},
	remove : function() {
		familyHousePropertyInfoObj.remove(this.id, this.id);
	},
	accept : function() {
		familyHousePropertyInfoObj.accept(this.id, this.id)
	},
	reject : function() {
		familyHousePropertyInfoObj.reject(this.id);
	},
	formaterPropertyType : function(value, row) {
		for ( var i in familyHousePropertyInfo.propertyType) {
			if (familyHousePropertyInfo.propertyType[i].value == value) {
				return familyHousePropertyInfo.propertyType[i].label;
			}
		}
		return value;
	},
	formaterHouseWhereabouts : function(value, row) {
		for ( var i in familyHousePropertyInfo.houseWhereabouts) {
			if (familyHousePropertyInfo.houseWhereabouts[i].value == value) {
				return familyHousePropertyInfo.houseWhereabouts[i].label;
			}
		}
		return value;
	},
	formaterHouseSource : function(value, row) {
		for ( var i in familyHousePropertyInfo.houseSource) {
			if (familyHousePropertyInfo.houseSource[i].value == value) {
				return familyHousePropertyInfo.houseSource[i].label;
			}
		}
		return value;
	}
};

//4、本人、配偶、共同生活的子女投资理财情况
var sharesObj =  new leaderExtendManager();
var shares = {
	id:'shares',
	onClickRow : function(index) {
		sharesObj.onClickRow(index,shares.id,shares.id);
	},
	append : function() {
		sharesObj.append(this.id,this.id);
	},
	remove : function() {
		sharesObj.remove(this.id,this.id);
	},
	accept : function() {
		sharesObj.accept(this.id,this.id);
	},
	reject : function() {
		sharesObj.reject(this.id);
	}
};
//基金
var foundationObj =  new leaderExtendManager();
var foundation = {
	id:'foundation',
	onClickRow : function(index) {
		foundationObj.onClickRow(index,foundation.id,foundation.id);
	},
	append : function() {
		foundationObj.append(this.id,this.id);
	},
	remove : function() {
		foundationObj.remove(this.id,this.id);
	},
	accept : function() {
		foundationObj.accept(this.id,this.id);
	},
	reject : function() {
		foundationObj.reject(this.id);
	}
};

//期货
var futuresObj =  new leaderExtendManager();
var futures = {
	id:'futures',
	onClickRow : function(index) {
		futuresObj.onClickRow(index,futures.id,futures.id);
	},
	append : function() {
		futuresObj.append(this.id,this.id);
	},
	remove : function() {
		futuresObj.remove(this.id,this.id);
	},
	accept : function() {
		futuresObj.accept(this.id,this.id);
	},
	reject : function() {
		futuresObj.reject(this.id);
	}
};

//5、配偶及子女的投资非上市公司、企业情况
var familyCompanyInfoObj =  new leaderExtendManager();
var familyCompanyInfo = {
	id:'familyCompanyInfo',
	onClickRow : function(index) {
		familyCompanyInfoObj.onClickRow(index,familyCompanyInfo.id,familyCompanyInfo.id);
	},
	append : function() {
		familyCompanyInfoObj.append(this.id,this.id);
	},
	remove : function() {
		familyCompanyInfoObj.remove(this.id,this.id);
	},
	accept : function() {
		familyCompanyInfoObj.accept(this.id,this.id);
	},
	reject : function() {
		familyCompanyInfoObj.reject(this.id);
	}
};

//6、配偶及子女注册个体工商户、个人独资企业或合作企业情况
var familyRegisterEnterpriseInfoObj =  new leaderExtendManager();
var familyRegisterEnterpriseInfo = {
	id:'familyRegisterEnterpriseInfo',
	item : datacode.enterpriseType,
	onClickRow : function(index) {
		familyRegisterEnterpriseInfoObj.onClickRow(index,familyRegisterEnterpriseInfo.id,familyRegisterEnterpriseInfo.id);
	},
	append : function() {
		familyRegisterEnterpriseInfoObj.append(this.id,this.id);
	},
	remove : function() {
		familyRegisterEnterpriseInfoObj.remove(this.id,this.id);
	},
	accept : function() {
		familyRegisterEnterpriseInfoObj.accept(this.id,this.id);
	},
	reject : function() {
		familyRegisterEnterpriseInfoObj.reject(this.id);
	},
	formaterChage : function(value, row) {
		for ( var i in familyRegisterEnterpriseInfo.item) {
			if (familyRegisterEnterpriseInfo.item[i].value == value) {
				return familyRegisterEnterpriseInfo.item[i].label;
			}
		}
		return value;
	}
};