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
	    	var formData=$("#"+formName).serializeObject();
	    	var editorConifg=pconfig[formName];
	    	if(editorConifg){
	    	 	var config = editorConifg['edit'];
	    	 	if(config){
	    	 		config=config.split(",")
	    	 		$.each(config,function(i,n){
	    	 			var editor =  CKEDITOR.instances[n];
	    		    	formData[n]=editor.document.getBody().getHtml();
	    	 		});
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
					var editor =  CKEDITOR.instances[edit];
					
					var ehtml= $("#"+n.piname).find("[name="+edit+"]").val();
					
					if(editor.document){
						editor.document.getBody().setHtml(ehtml);
					}
				}
				
				
				
			}
			
		});
	});
	
}
