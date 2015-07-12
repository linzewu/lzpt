package com.kteam.lzpt.web.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.json.annotations.JSON;
import org.springframework.stereotype.Controller;

import com.kteam.lzpt.entity.Project;
import com.kteam.lzpt.entity.ProjectType;
import com.kteam.lzpt.manager.IProjectManager;
import com.opensymphony.xwork2.Action;

@Controller("projectAction")
public class ProjectAaction {
	
	@Resource(name="projectManager")
	private IProjectManager  projectManager;
	
	private ProjectType pt;
	
	private Project pro;
	
	private Map jsonMap;
	
	@JSON(serialize=false)
	public ProjectType getPt() {
		return pt;
	}

	public void setPt(ProjectType pt) {
		this.pt = pt;
	}
	


	public Project getPro() {
		return pro;
	}

	public void setPro(Project pro) {
		this.pro = pro;
	}

	public Map getJsonMap() {
		return jsonMap;
	}

	public void setJsonMap(Map jsonMap) {
		this.jsonMap = jsonMap;
	}

	public String getProjectType(){
		List<ProjectType> pts = projectManager.getProjectType(pt.getGroup());
		jsonMap=new HashMap();
		jsonMap.put("total", pts.size());
		jsonMap.put("rows", pts);
		return Action.SUCCESS;
	}
	
	public String getProjects(){
		List<Project> projects = projectManager.getProjec(pro);
		jsonMap=new HashMap();
		jsonMap.put("total", projects.size());
		jsonMap.put("rows", projects);
		return Action.SUCCESS;
	}

}
