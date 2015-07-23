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
import com.kteam.lzpt.entity.ProjectConsole;
import com.kteam.lzpt.entity.ProjectItem;
import com.kteam.lzpt.entity.ProjectType;
import com.kteam.lzpt.entity.Role;
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
	
	private ProjectConsole pc;
	
	private Map jsonMap;
	
	
	
	
	public ProjectConsole getPc() {
		return pc;
	}

	public void setPc(ProjectConsole pc) {
		this.pc = pc;
	}

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
		

		HttpSession session=ServletActionContext.getRequest().getSession();
		
		User user =(User) session.getAttribute("user");
		
		Role role = user.getDefaultRole();
		
		if("乡镇单位管理员".equals(role.getRoleName())){
			pro.setUnit(user.getUnitId());
		}
		
		List<Project> projects = projectManager.getProjec(pro);
		jsonMap=new HashMap();
		jsonMap.put("total", projects.size());
		jsonMap.put("rows", projects);
		return Action.SUCCESS;
	}
	
	public String saveProjectItem(){
		
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
		
		if(pro.getId()!=null){
			pro=this.getProjectManager().getProject(pro.getId());
		}
		
		if(pi.getId()==null){
			pro.setScore((pro.getScore()==null?0:pro.getScore()) + pi.getScore());
		}
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
	
	public String delProject(){
		
		projectManager.deleteproject(pro);
		jsonMap=new HashMap();
		jsonMap.put(Action.SUCCESS,true);
		
		return Action.SUCCESS;
	}
	
	public String getYearReport(){
		
		List<Project> report = projectManager.getYearReport(pro);
		
		jsonMap=new HashMap();
		jsonMap.put("total", report.size());
		jsonMap.put("rows", report);
		
		return Action.SUCCESS;
	}
	
	public String getAllProjectType(){
		
		List<ProjectType> pts = projectManager.getProjectTypeAll();
		jsonMap=new HashMap();
		jsonMap.put("data", pts);
		return Action.SUCCESS;
	}
	
	public String saveProjectConsole(){
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user =  (User)session.getAttribute("user");
		
		this.projectManager.saveProjectConsole(pc, user);
		jsonMap=new HashMap();
		jsonMap.put(Action.SUCCESS,true);
		return Action.SUCCESS;
	}
	
	
	public String getConsoleList(){
		List consoleList = this.projectManager.getProjectConsole();
		jsonMap=new HashMap();
		jsonMap.put("total", consoleList.size());
		jsonMap.put("rows", consoleList);
		return Action.SUCCESS;
	}
	

}
