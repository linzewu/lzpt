package com.kteam.lzpt.manager.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.kteam.lzpt.entity.WorkArchive;
import com.kteam.lzpt.entity.WorkImportantMatters;
import com.kteam.lzpt.entity.WorkSummary;
import com.kteam.lzpt.manager.IWorkArchiveManager;

public class WorkArchiveManagerImpl extends HibernateDaoSupport implements
		IWorkArchiveManager {

	@Override
	public void addWorkArchive(WorkArchive wa) {
		this.getHibernateTemplate().save(wa);

	}

	@Override
	public List<WorkArchive> queryWorkArchive(final WorkArchive wa,final int pageSize,
			final int pageNumber) {
		final Map<String,Object> paramMap=new HashMap<String,Object>();
		String whereSql = "";
		if (null != wa)
        {
        	if (null != wa.getWname() && !("".equals(wa.getWname())))
        	{
        		whereSql = whereSql + " where workArchive.wname like :wname";
        		paramMap.put("wname", "%"+wa.getWname()+"%");
        	}
        }
        final String sql="From WorkArchive workArchive" + whereSql;        
		
		List<?> list= this.getHibernateTemplate().execute(new HibernateCallback<List<?>>() {

			@Override
			public List<?> doInHibernate(Session session)
					throws HibernateException, SQLException {
				
				List<?> workArchive = null;
				Query query = session.createQuery(sql);
				for(String param:paramMap.keySet()){
					query.setParameter(param, paramMap.get(param));
				}
				workArchive = query.setFirstResult((pageNumber-1)*pageSize)
					.setMaxResults(pageSize)
					.list();
				
				return workArchive;
			}
			
		});
		return (List<WorkArchive>)list;
	}
	
	

	@Override
	public int getWorkArchivesTotal(WorkArchive wa) {
		final Map<String,Object> paramMap=new HashMap<String,Object>();
		String whereSql = "";
		if (null != wa)
        {
        	if (null != wa.getWname() && !("".equals(wa.getWname())))
        	{
        		whereSql = whereSql + " where workArchive.wname like :wname";
        		paramMap.put("wname", "%"+wa.getWname()+"%");
        	}
        }
		
        final String sql="SELECT COUNT(*) FROM WorkArchive workArchive" + whereSql;
		
		Integer total = this.getHibernateTemplate().execute(new HibernateCallback<Integer>() {

			@Override
			public Integer doInHibernate(Session session) throws HibernateException,
					SQLException {
				
				Long total = null;
				Query query = session.createQuery(sql);
				
				for(String param:paramMap.keySet()){
					query.setParameter(param, paramMap.get(param));
				}
				total = (Long) query.uniqueResult();
				return total.intValue();
			}
			
		});
		
		return total;
	}

	@Override
	public void deleteWorkArchives(String id) {
		this.getHibernateTemplate().delete(this.getHibernateTemplate().get(WorkArchive.class, id));
		
	}

	@Override
	public WorkArchive getWorkArchiveById(String id) {
		// TODO Auto-generated method stub
		WorkArchive wa = (WorkArchive)this.getSession().get(WorkArchive.class, id);
		return wa;
	}

	@Override
	public void updateWorkArchive(WorkArchive wa) {
		this.getHibernateTemplate().update(wa);
		
	}

	@Override
	public Map<String, Object> getWimAndWs(String id) {
		Map<String, Object> map = new HashMap<String,Object>();
		Session session = this.getSession();
		WorkArchive wa = (WorkArchive)session.get(WorkArchive.class, id);//(WorkArchive)this.getHibernateTemplate().get(WorkArchive.class, id);
		wa.getWimList().size();
		wa.getWsList().size();
		List<WorkImportantMatters> wimL = wa.getWimList();
		List<WorkSummary> wsL = wa.getWsList();
		WorkImportantMatters wim = null;
		WorkSummary ws  = null;
		for (int i=0;i<wimL.size();i++)
		{
			wim = wimL.get(i);
		}
		for (int i=0;i<wsL.size();i++)
		{
			ws = wsL.get(i);
		}
		map.put("wimL", wimL);
		map.put("wsL", wsL);
		
		session.close();
		session.clear();
		return map;
	}
	
	@Override
	public List<WorkArchive> getWorkArchives() {
		
		List<WorkArchive> workArchive = this.getHibernateTemplate().find("FROM WorkArchive workArchive");
		
		return workArchive;
	}

	@Override
	public List<WorkArchive> getSimpleUnits() {
		
		List<WorkArchive> workArchive = this.getHibernateTemplate().find("Select new WorkArchive(id,wname) from WorkArchive");
		
		return workArchive;
	}

}
