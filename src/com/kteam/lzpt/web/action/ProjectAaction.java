package com.kteam.lzpt.web.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
		
		
//		pro = projectManager.savePoject(pro);
		pi.setProjectId(pro.getId());
		pi = projectManager.savePojectItem(pi);
		
		setProjectScore();
		
		jsonMap=new HashMap();
		jsonMap.put("data", pi);
		jsonMap.put(Action.SUCCESS, true);
		
		return Action.SUCCESS;
	}
	
	private void setProjectScore(){
		
		pro=this.getProjectManager().getProject(pro.getId());
		
		pt=this.getProjectManager().getProjectTypeObject(pro.getProjectType());
		
		if(pro.getScoreInfo()==null||"".equals(pro.getScoreInfo().trim())){
			Map scoreInfoMap=new HashMap();
			scoreInfoMap.put(pi.getId().toString(), pi.getScore());
			String str = JSONObject.fromObject(scoreInfoMap).toString();
			pro.setScoreInfo(str);
			pro.setScore(pt.getDefaultScore()+pi.getScore());
		}else{
			String strInfo=pro.getScoreInfo();
			JSONObject jo = JSONObject.fromObject(strInfo);
			jo.put(pi.getId().toString(), pi.getScore());
			Set<String> set = jo.keySet();
			
			Float score=pt.getDefaultScore();
			
			for(String key:set){
				Double d=jo.getDouble(key);
				score+=d.floatValue();
			}
//			score=score<0f?0f:score;
			
			pro.setScore(score);
			
			pro.setScoreInfo(jo.toString());
		}
		pro.setIsCheck(0);
		
		if(pro.getScore()<0){
			pro.setScore(0f);
		}
		
		if(pro.getScore()>pt.getMaxScore()){
			pro.setScore(pt.getMaxScore());
		}
		
		this.projectManager.savePoject(pro);
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
