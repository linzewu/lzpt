package com.kteam.lzpt.manager.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Service;

import com.kteam.lzpt.entity.Project;
import com.kteam.lzpt.entity.ProjectConsole;
import com.kteam.lzpt.entity.ProjectItem;
import com.kteam.lzpt.entity.ProjectType;
import com.kteam.lzpt.entity.User;
import com.kteam.lzpt.entity.WorkArchive;
import com.kteam.lzpt.manager.IProjectManager;

@Service("projectManager")
public class ProjectManagerImpl implements IProjectManager {

	@Resource(name = "hibernateTemplate")
	private HibernateTemplate hibernateTemplate;

	@Override
	public List<ProjectType> getProjectType(int group) {
		List<ProjectType> pts = hibernateTemplate.findByNamedParam("from ProjectType where group=:group",
				new String[] { "group" }, new Object[] { group });
		return pts;
	}

	@Override
	public List<Project> getProjec(Project project) {

		StringBuffer sb = new StringBuffer("from Project where state=0");

		List<String> paramNames = new ArrayList<String>();
		List values = new ArrayList();

		if (project != null) {
			if (project.getProjectType() != null) {
				sb.append(" and projectType=:projectType");
				paramNames.add("projectType");
				values.add(project.getProjectType());
			}

			if (project.getYear() != null) {
				sb.append(" and year=:year");
				paramNames.add("year");
				values.add(project.getYear());
			}

			if (project.getUnit() != null) {
				sb.append(" and unit=:unit");
				paramNames.add("unit");
				values.add(project.getUnit());
			}

		}

		List list = hibernateTemplate.findByNamedParam(sb.toString(), paramNames.toArray(new String[paramNames.size()]),
				values.toArray());
		return list;
	}

	@Override
	public ProjectItem savePojectItem(ProjectItem projectItem) {

		return this.hibernateTemplate.merge(projectItem);

	}

	@Override
	public Project savePoject(Project project) {

		return this.hibernateTemplate.merge(project);
	}

	@Override
	public List<ProjectItem> getProjectItem(Integer pid) {

		List<ProjectItem> pi = this.hibernateTemplate.findByNamedParam("From ProjectItem where projectId=:pid",
				new String[] { "pid" }, new Object[] { pid });

		return pi;
	}

	@Override
	public void deleteproject(Project project) {

		List<ProjectItem> pis = this.getProjectItem(project.getId());

		this.hibernateTemplate.deleteAll(pis);

		this.hibernateTemplate.delete(project);

	}

	@Override
	public Project getProject(Integer id) {

		return this.hibernateTemplate.get(Project.class, id);
	}

	@Override
	public List<Project> getYearReport(Project project) {

		StringBuffer sb = new StringBuffer("SELECT new Project(year,unit,sum(score))  FROM Project where state=0");

		List<String> paramNames = new ArrayList<String>();
		List values = new ArrayList();

		if (project != null) {
			if (project.getYear() != null) {
				sb.append(" and year=:year");
				paramNames.add("year");
				values.add(project.getYear());
			}

			if (project.getUnit() != null) {
				sb.append(" and unit=:unit");
				paramNames.add("unit");
				values.add(project.getUnit());
			}
		}

		sb.append(" group by year,unit");

		List list = hibernateTemplate.findByNamedParam(sb.toString(), paramNames.toArray(new String[paramNames.size()]),
				values.toArray());
		return list;
	}

	@Override
	public List<ProjectType> getProjectTypeAll() {

		String sql = "From ProjectType";

		List<ProjectType> pts = hibernateTemplate.find(sql);

		return pts;
	}

	@Override
	public void saveProjectConsole(final ProjectConsole pc, final User user) {
		this.hibernateTemplate.merge(pc);
		if (pc.getState() == pc.STATE_OPEN) {
			List<WorkArchive> was = this.hibernateTemplate.find("Select new WorkArchive(id,wname) From WorkArchive");

			for (WorkArchive wa : was) {

				List<ProjectType> pts = this.hibernateTemplate.find("From ProjectType");

				for (ProjectType pt : pts) {
					
					List<Project> projests = this.hibernateTemplate.findByNamedParam(
							"From Project where year=:year and unit=:unit and projectType=:projectType",
							new String[] { "year", "unit", "projectType" },
							new Object[] { pc.getYear(), wa.getId(), pt.getId() });
					
					Project project=null;
					
					if(projests!=null&&projests.size()>0){
						project = (Project) projests.get(0);
					}
					
					if (project == null) {
						project = new Project();
						project.setCreateTime(new Date());
						project.setCreateUser(user.getUserName());
						project.setProjectType(pt.getId());
						project.setScore(pt.getDefaultScore());

						project.setState(ProjectConsole.STATE_OPEN);
						project.setYear(pc.getYear());
						project.setUnit(wa.getId());
						project.setIsCheck(0);
					} else {
						project.setState(ProjectConsole.STATE_OPEN);
					}
					this.hibernateTemplate.merge(project);
				}
			}
		} else {
			Integer i = this.hibernateTemplate.execute(new HibernateCallback<Integer>() {
				@Override
				public Integer doInHibernate(Session session) throws HibernateException, SQLException {
					String sql = "update Project set state=:state where year=:year";
					return session.createQuery(sql).setInteger("state", ProjectConsole.STATE_CLOSE)
							.setString("year", pc.getYear()).executeUpdate();
				}
			});

		}

	}

	@Override
	public List<ProjectConsole> getProjectConsole() {
		
		List<ProjectConsole> pcs = this.hibernateTemplate.find("From ProjectConsole ");
		
		return pcs;
	}

}
