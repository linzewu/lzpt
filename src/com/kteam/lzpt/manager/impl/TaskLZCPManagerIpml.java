package com.kteam.lzpt.manager.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.kteam.lzpt.entity.LeaderLZCP;
import com.kteam.lzpt.entity.TaskLZCP;
import com.kteam.lzpt.entity.TaskLZCPResult;
import com.kteam.lzpt.manager.ITaskLZCPManager;

public class TaskLZCPManagerIpml extends HibernateDaoSupport implements ITaskLZCPManager {

	@Override
	public void addTaskLZCP(TaskLZCP tasklzcp) {
		
		this.getHibernateTemplate().save(tasklzcp);

	}

	@Override
	public void deleteTaskLZCP(String id) {
		
		TaskLZCP taskLZCP = this.getHibernateTemplate().get(TaskLZCP.class, id);
		this.getHibernateTemplate().delete(taskLZCP);

	}

	@Override
	public void modify(TaskLZCP tasklzcp) {
		
		this.getHibernateTemplate().update(tasklzcp);

	}

	@Override
	public List<TaskLZCP> getTaskLZCP(TaskLZCP taskLZCP, final int pageSize,
			final int pageNo) {
		
		List<TaskLZCP> ts = this.getHibernateTemplate().execute(new HibernateCallback<List<TaskLZCP>>(){

			@Override
			public List<TaskLZCP> doInHibernate(Session session)
					throws HibernateException, SQLException {
				
				String sql="From TaskLZCP";
				
				@SuppressWarnings("unchecked")
				List<TaskLZCP> ts = session.createQuery(sql).setFirstResult((pageNo - 1) * pageSize)
										.setMaxResults(pageSize).list();
				return ts;
			}
		});
		
		return ts;
	}

	@Override
	public int getTaskLZCPTotal(TaskLZCP taskLZCP) {
		
		return this.getHibernateTemplate().execute(new HibernateCallback<Integer>() {

			@Override
			public Integer doInHibernate(Session session)
					throws HibernateException, SQLException {
				
				String sql="select count(*) from TaskLZCP";
				
				Query query = session.createQuery(sql);
				
				Long res = (Long)query.uniqueResult();
				
				return res.intValue();
			}
			
		});
		
	}

	@Override
	public TaskLZCP getTaskLZCPById(String id) {
		
		return this.getHibernateTemplate().load(TaskLZCP.class,id);
	}

	@Override
	public void addTaskLZCPResult(TaskLZCPResult tlr) {
		this.getHibernateTemplate().save(tlr);
	}

	@Override
	public List<TaskLZCPResult> getTaskLZCPResultsByUnit(final String unitId,final int state) {
		
		List<TaskLZCPResult> tlrs = this.getHibernateTemplate().execute(new HibernateCallback<List<TaskLZCPResult>>() {

			@Override
			public List<TaskLZCPResult> doInHibernate(Session session)
					throws HibernateException, SQLException {
				
				String sql="From TaskLZCPResult tlr where tlr.unit.id=:unitId";
				
				Query query = session.createQuery(sql);
				
				query.setParameter("unitId",unitId);
				
				@SuppressWarnings("unchecked")
				List<TaskLZCPResult> tlrs = query.list();
				
				return tlrs;
			}
		});
		
		return tlrs;
	}

	@Override
	public TaskLZCPResult getTaskLZCPResultById(String id) {
		
		return this.getHibernateTemplate().load(TaskLZCPResult.class, id);
	}

	@Override
	public void modifyTaskLZCPResult(TaskLZCPResult tlr) {
		
		this.getHibernateTemplate().update(tlr);
		
	}

	@Override
	public void addLeaderLZCP(LeaderLZCP leaderLZCP) {
		this.getHibernateTemplate().save(leaderLZCP);
		
	}

	@Override
	public void modifyLeaderLZCP(LeaderLZCP leaderLZCP) {
		
		this.getHibernateTemplate().update(leaderLZCP);
		
	}

	@Override
	public List<LeaderLZCP> getLeaderLZCPByYear(final String year) {
		
		List<LeaderLZCP> list = this.getHibernateTemplate().execute(new HibernateCallback<List<LeaderLZCP>>() {

			@Override
			public List<LeaderLZCP> doInHibernate(Session session)
					throws HibernateException, SQLException {
				
				String sql="From LeaderLZCP l where l.tlr.taskLZCP.date=:year";
				
				@SuppressWarnings("unchecked")
				List<LeaderLZCP> list = session.createQuery(sql).setParameter("year",year).list();
				
				return list;
			}
			
		});
		
		return list;
	}

}
