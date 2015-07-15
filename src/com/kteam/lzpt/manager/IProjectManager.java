package com.kteam.lzpt.manager;

import java.util.List;

import com.kteam.lzpt.entity.Project;
import com.kteam.lzpt.entity.ProjectItem;
import com.kteam.lzpt.entity.ProjectType;

public interface IProjectManager {
	
	public List<ProjectType> getProjectType(int group);
	
	public List<Project> getProjec(Project project);
	
	public ProjectItem savePojectItem(ProjectItem projectItem);
	
	public Project savePoject(Project Project);
	
	public List<ProjectItem> getProjectItem(Integer pid);

}
