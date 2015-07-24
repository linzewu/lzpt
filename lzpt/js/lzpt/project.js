function loadEidt(inssancesName){
	var instance = CKEDITOR.instances[inssancesName]; 
	if (instance) { CKEDITOR.remove(instance); }	

	CKEDITOR.replace(inssancesName,
		{
       toolbar : 'Basic',
       height: '160px' ,
        width: '850px' 
   });
}

function formBind(formName){
	$('#'+formName).form({
	    url:'/lzpt/project!saveProjectItem.action',
	    onSubmit: function(){
	    	$('#'+formName).find("input[name='pro.projectType']").val(projectTypeId);
	    	$('#'+formName).find("input[name='pro.id']").val(pid);
	    	
	    	if(!$("#"+formName).form("validate")){
	    		return false;
	    	}
	    	
	    	var formData=$("#"+formName).serializeObject();
	    	
	    	var config=pconfig[formName];
	    	//获取editor 的值
	    	if(config){
	    	 	var editorConifg  = config['edit'];
	    	 	if(editorConifg){
	    	 		editorConifg=editorConifg.split(",")
	    	 		$.each(editorConifg,function(i,n){
	    	 			var editor =  CKEDITOR.instances[n];
	    		    	formData[n]=editor.document.getBody().getHtml();
	    	 		});
	    	 	}
	    	 	
		    	//获取grid value
	    	 	var gridConfig=config['grid']
	    	 	
	    	 	if(gridConfig){
	    	 		gridConfig=gridConfig.split(",");
	    	 		$.each(gridConfig,function(i,n){
	    	 			var griddata = $("#"+n).datagrid("getRows");
	    	 			formData[n]=JSON.stringify(griddata);
	    	 		})
	    	 	}
	    	 	
	    	 	var scoreConfig=config['score'];
	    	 	
	    	 	if(scoreConfig){
	    	 		var score=getScore(scoreConfig);
	    	 		formData['pi.score']=score;
	    	 		$("#"+formName).find("input[name='pi.score']").val(score);
	    	 	}
	    	 	
	    	}
	    	
	    	var strData = JSON.stringify(formData);
	    	console.log(strData);
	    	$('#'+formName).find("input[name='pi.data']").val(strData);
	    },
	    success:function(data){
	    	var json=$.parseJSON(data);
	    	 if (json["success"]){
	    		 pid = json.data.projectId;
	    		 var tab = $('#proTab').tabs('getSelected');
	    	     tab.panel('refresh');
	    	     $("#projectList").datagrid("reload");
	    	     $.messager.alert("提示","保存成功");
	         }
	    }
	});
}

function getScore(sconfig){
	
	var score=0;
	
	var type= sconfig['type'];
	
	if(sconfig['callback']){
		score=callback.call();
		
	}else if(type=="count"){
		var grid = sconfig['grid'];
		if(grid){
			var count = $("#"+grid).datagrid("getRows").length;
			score=sconfig['score']*count;
		}
	}else if(type=="colunm"){
		var grid = sconfig['grid'];
		var colunm=sconfig['colunm'];
		var array=sconfig['data'];
		var rows = $("#"+grid).datagrid("getRows");
		$.each(rows,function(index,row){
			var itemScore=0;
			$.each(array,function(i,item){
				if(row[colunm]==item.value){
					itemScore=item.score;
					return false;
				}
			});
			score+=itemScore;
		});
	}
	return score;
}

function  loadProjectInfo(){
	
	 var url='/lzpt/project!getProjectItem.action';
	
	$.getJSON(url,{"pi.projectId":pid},function(json){
		var data=json.data;
		
		$.each(data,function(i,n){
			var formdata=$.parseJSON(n.data)
			
			$("#"+n.piname).form("load",formdata);
			
			$("#"+n.piname).find("input[name='pi.id']").val(n.id);
			
			if(pconfig){
				var config = pconfig[n.piname];
				
				var uploadfile=config['uploadfile'];
				
				var edit=config['edit'];
				
				var grid=config['grid'];
				
				if(uploadfile){
					var ufjVla = $("#"+uploadfile+"Json").val();
					if(ufjVla.length>5){
						ufjVla=ufjVla.substring(5,ufjVla.length);
					}
					var jsonData=null;
					if(""!=ufjVla){
						jsonData = $.parseJSON(ufjVla);
					}else{
						jsonData=[];
					}
					$.each(jsonData,function(j,k){
						createUploadDiv2(uploadfile,k,true)
					});
				}
				
				if(edit){
					edit=edit.split(",")
					console.log(edit)
					$.each(edit,function(index,eid){
						var editor =  CKEDITOR.instances[eid];
						
						var ehtml= $("#"+n.piname).find("[name="+eid+"]").val();
						if(editor.document){
							editor.document.getBody().setHtml(ehtml);
						}
					});
					
					
				}
				
				if(grid){
					
					var griddata=$.parseJSON($("#"+n.piname).find("input[name='"+grid+"']").val());
					console.log(griddata);
					$("#"+grid).datagrid("loadData",griddata);
				}
			}
			
		});
	});
}

var gridMap={};

var eindex = 'editIndex';
function endEditing(gid){
	
	 if(!gridMap[gid]){
		 gridMap[gid]={};
	 }
	
	var editIndex=gridMap[gid][eindex];
    if (editIndex == undefined){return true}
    if ($('#'+gid).datagrid('validateRow', editIndex)){
        $('#'+gid).datagrid('endEdit', editIndex);
        gridMap[gid][eindex] = undefined;
        
        return true;
    } else {
        return false;
    }
}
function onClickCell(index, field){
    if (editIndex != index){
        if (endEditing()){
            $('#dg').datagrid('selectRow', index)
                    .datagrid('beginEdit', index);
            var ed = $('#dg').datagrid('getEditor', {index:index,field:field});
            ($(ed.target).data('textbox') ? $(ed.target).textbox('textbox') : $(ed.target)).focus();
            editIndex = index;
        } else {
            $('#dg').datagrid('selectRow', editIndex);
        }
    }
}
function append(gid){
	 if (endEditing(gid)){
		   $('#'+gid).datagrid('appendRow',{});
		   var editIndex=$('#'+gid).datagrid('getRows').length-1;
		   gridMap[gid][eindex] = editIndex;
		   $('#'+gid).datagrid('selectRow', editIndex)
		            .datagrid('beginEdit', editIndex);
	 }
}
function removeit(gid){
	
	if(!gridMap[gid]){
		 gridMap[gid]={};
	}
	var editIndex= gridMap[gid][eindex];
	
    if (editIndex == undefined){
    	
    	var rowIndex =  $('#'+gid).datagrid("getRowIndex",$('#'+gid).datagrid("getSelected"));
    	
    	console.log(rowIndex)
    	 $('#'+gid).datagrid('deleteRow', rowIndex);
    	
    	return
    }
    $('#'+gid).datagrid('cancelEdit', editIndex)
            .datagrid('deleteRow', editIndex);
    gridMap[gid][eindex] = undefined;
}
function accept(gid){
    if (endEditing(gid)){
        $('#'+gid).datagrid('acceptChanges');
    }
}
function reject(gid){
    $('#'+gid).datagrid('rejectChanges');
    if(!gridMap[gid]){
    	gridMap[gid][eindex] = undefined;
    }
    
}

function unitFormatter(value,row,index){
	var wname;
	$.each(units,function(i,n){
		if(n.id==value){
			wname=n.wname;
			return false;
		}
	});
	return wname;
}

function isCheckFormatter(value){
	if(value==0){
		return "未审阅";
	}
	if(value==1){
		return "已审阅";
	}
}


var projectTypes;

$.post("/lzpt/project!getAllProjectType.action",function(data){
	
	projectTypes=data.data;
});


function formatterProject(projectType){
	var name;
	$.each(projectTypes,function(i,n){
		if(n.id==projectType){
			name=n.name;
			return false;
		}
	});
	
	return name;
	
	
}
