package com.kteam.lzpt.manager;

import java.util.List;

import com.kteam.lzpt.entity.Project;
import com.kteam.lzpt.entity.ProjectConsole;
import com.kteam.lzpt.entity.ProjectItem;
import com.kteam.lzpt.entity.ProjectType;
import com.kteam.lzpt.entity.User;

public interface IProjectManager {
	
	public List<ProjectType> getProjectType(int group);
	
	public ProjectType getProjectTypeObject(int id);
	
	public List<Project> getProjec(Project project);
	
	public ProjectItem savePojectItem(ProjectItem projectItem);
	
	public Project savePoject(Project Project);
	
	public List<ProjectItem> getProjectItem(Integer pid);
	
	public void deleteproject(Project project);
	
	public Project getProject(Integer id);
	
	public List<Project> getYearReport(Project pro);
	
	public List<ProjectType> getProjectTypeAll();
	
	public void saveProjectConsole(ProjectConsole pc,User user);
	
	public List<ProjectConsole> getProjectConsole();
	
	public List<Project> getUncheckProjectList(Integer maxResults,Project project);
}
