package com.kteam.lzpt.web.action;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.kteam.lzpt.entity.Project;
import com.kteam.lzpt.entity.ProjectItem;
import com.kteam.lzpt.entity.ProjectType;
import com.kteam.lzpt.entity.User;
import com.kteam.lzpt.manager.IProjectManager;
import com.opensymphony.xwork2.Action;

import net.sf.json.JSONObject;

@Controller("projectAction")
@Scope(value="prototype")
public class ProjectAaction {
	
	@Resource(name="projectManager")
	private IProjectManager  projectManager;
	
	private ProjectType pt;
	
	private Project pro;
	
	private ProjectItem pi;
	
	private Map jsonMap;
	
	
	public IProjectManager getProjectManager() {
		return projectManager;
	}

	public void setProjectManager(IProjectManager projectManager) {
		this.projectManager = projectManager;
	}

	public ProjectItem getPi() {
		return pi;
	}

	public void setPi(ProjectItem pi) {
		this.pi = pi;
	}

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
	
	public String saveProjectItem(){
		
		System.out.println(pro.getId());
		System.out.println(pi.getId());
		
		initProject();
		
		pro = projectManager.savePoject(pro);
		pi.setProjectId(pro.getId());
		pi = projectManager.savePojectItem(pi);
		
		jsonMap=new HashMap();
		jsonMap.put("data", pi);
		jsonMap.put(Action.SUCCESS, true);
		
		return Action.SUCCESS;
	}
	
	private void initProject(){
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		
		User user =  (User)session.getAttribute("user");
		
		pro.setUnit(user.getUnitId());
		
		pro.setCreateTime(new Date());
		
		pro.setCreateUser(user.getUserName());
		
		pro.setIsCheck(0);
		
		if(pi.getData()!=null){
			JSONObject jo= JSONObject.fromObject(pi.getData());
			String date=(String)jo.get("date");
			if(date!=null&&date.length()>4){
				pro.setYear(date.substring(0,4));
			}
		}
		
	}
	
	public String getProjectItem(){
		
		List<ProjectItem> pis = projectManager.getProjectItem(pi.getProjectId());
		
		jsonMap=new HashMap();
		jsonMap.put("data", pis);
		
		return Action.SUCCESS;
	}
	

}
