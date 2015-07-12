package com.kteam.lzpt.manager.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Service;

import com.kteam.lzpt.entity.Project;
import com.kteam.lzpt.entity.ProjectType;
import com.kteam.lzpt.manager.IProjectManager;

@Service("projectManager")
public class ProjectManagerImpl implements IProjectManager {
	
	@Resource(name="hibernateTemplate")
	private HibernateTemplate hibernateTemplate;

	@Override
	public List<ProjectType> getProjectType(int group) {
		List<ProjectType> pts = hibernateTemplate.findByNamedParam("from ProjectType where group=:group", new String[]{"group"}, new Object[]{group});
		return pts;
	}

	@Override
	public List<Project> getProjec(Project project) {
		
		StringBuffer sb=new StringBuffer("from Project where 1=1");
		
		List<String> paramNames=new ArrayList<String>();
		List values=new ArrayList();
		
		if(project!=null){
			if(project.getProjectType()!=null){
				sb.append(" and projectType=:projectType");
				paramNames.add("projectType");
				values.add(project.getProjectType());
			}
			
			if(project.getYear()!=null){
				sb.append(" and year=:year");
				paramNames.add("year");
				values.add(project.getYear());
			}
			
			if(project.getUnit()!=null){
				sb.append(" and unit=:unit");
				paramNames.add("unit");
				values.add(project.getUnit());
			}
			
		}
		
		List list=hibernateTemplate.findByNamedParam(sb.toString(), paramNames.toArray(new String[paramNames.size()]), values.toArray());
		return list;
	}

}