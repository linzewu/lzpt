package com.kteam.lzpt.manager.impl;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.kteam.lzpt.entity.CadreArchive;
import com.kteam.lzpt.entity.User;
import com.kteam.lzpt.manager.ICadreArchiveManager;

public class CadreArchiveManagerImpl extends HibernateDaoSupport implements
		ICadreArchiveManager {

	@Override
	public String  addCadreArchive(CadreArchive ca) {
		
		String id=null;
		Serializable  ser = this.getHibernateTemplate().save(ca);
		if(ser!=null){
			id=ser.toString();
		}
		return  id;

	}

	@Override
	public void updateCadreArchive(CadreArchive ca) {
		this.getHibernateTemplate().update(ca);

	}

	@Override
	public void deleteCadreArchive(String id) {
		this.getHibernateTemplate().delete(this.getHibernateTemplate().get(CadreArchive.class, id));

	}

	@Override
	public List<CadreArchive> queryCadreArchive(final CadreArchive ca,final int pageSize,
			final int pageNumber) {
		final Map<String,Object> paramMap=new HashMap<String,Object>();
		String whereSql = " where 1=1 ";
		
		User user = (User)ServletActionContext.getRequest().getSession().getAttribute("user");
		
		if(user.getDefaultRole().getRoleName().equals("纪委"))
		{
			if (null != ca)
	        {
	        	if (null != ca.getCname() && !("".equals(ca.getCname())))
	        	{
	        		whereSql = whereSql + " and ca.cname like :cname";
	        		paramMap.put("cname", "%"+ca.getCname()+"%");
	        	}
	        	
	        	if (null != ca.getWaid() && !("".equals(ca.getWaid())))
	        	{
	        		whereSql = whereSql + " and ca.wa.id = :wid";
	        		paramMap.put("wid", ca.getWaid());
	        	}
	        }
		}else{
			
			whereSql = whereSql + " and ca.wa.id = :wid";
    		paramMap.put("wid", user.getUnitId());
			if (null != ca)
	        {
	        	if (null != ca.getCname() && !("".equals(ca.getCname())))
	        	{
	        		whereSql = whereSql + " and ca.cname like :cname";
	        		paramMap.put("cname", "%"+ca.getCname()+"%");
	        	}
	        	
	        }
		}
		
		
		final String strSql = " FROM CadreArchive ca " + whereSql;

		List<?> list = this.getHibernateTemplate().execute(new HibernateCallback<List<?>>(){

			@Override
			public List<?> doInHibernate(Session session)
					throws HibernateException, SQLException {
						List<?> cadreArchive = null;
						Query query = session.createQuery(strSql);
						for(String param:paramMap.keySet()){
							query.setParameter(param, paramMap.get(param));
						}
						cadreArchive = query.setFirstResult(
										pageNumber * pageSize - pageSize)
								.setMaxResults( pageSize).list();
				return cadreArchive;
			}
			
		});
		return (List<CadreArchive>) list;
	}

	@Override
	public int getCadreArchiveTotal(CadreArchive ca) {
		final Map<String,Object> paramMap=new HashMap<String,Object>();
		String whereSql = " where 1=1 ";
		
		User user = (User)ServletActionContext.getRequest().getSession().getAttribute("user");
		if(!user.getDefaultRole().getRoleName().equals("纪委"))
		{
			whereSql = whereSql + " and ca.wa.id = :wid";
    		paramMap.put("wid", user.getUnitId());
		}
		
		if (null != ca)
        {
        	if (null != ca.getCname() && !("".equals(ca.getCname())))
        	{
        		whereSql = whereSql + " and ca.cname like :cname";
        		paramMap.put("cname", "%"+ca.getCname()+"%");
        	}
        	if (null != ca.getWaid() && !("".equals(ca.getWaid())))
        	{
        		whereSql = whereSql + " and ca.wa.id = :wid";
        		paramMap.put("wid", ca.getWaid());
        	}
        }
		
		final String strSql = "select count(*) from CadreArchive ca " + whereSql;
		Integer count = this.getHibernateTemplate().execute(new HibernateCallback<Integer>(){

			@Override
			public Integer doInHibernate(Session session)
					throws HibernateException, SQLException {
				Long cou = null;
				Query query = session.createQuery(strSql);
				for(String param:paramMap.keySet()){
					query.setParameter(param, paramMap.get(param));
				}
				cou = (Long) query.uniqueResult();
				return cou.intValue();
			}
			
		});
		
		return count;
	}
	
	@Override
	public CadreArchive getCadreArchiveById(String id) {
		CadreArchive ca = (CadreArchive)this.getSession().get(CadreArchive.class, id);
		return ca;
	}
	
	public List<CadreArchive> getCadreArchiveByWCID(final String wcid)
	{
		
		final String strSql = " FROM CadreArchive ca where ca.wa.id = :wcid";
		List<?> list = this.getHibernateTemplate().execute(new HibernateCallback<List<?>>(){

			@Override
			public List<?> doInHibernate(Session session)
					throws HibernateException, SQLException {
						List<?> cadreArchive = session
								.createQuery(strSql)
								.setString("wcid", wcid).list();
				return cadreArchive;
			}
		});
		return (List<CadreArchive>) list;
	}

	@Override
	public String addLeaderExtend(Object o) {
		
		Serializable seri = this.getHibernateTemplate().save(o);
		if(seri!=null){
			return seri.toString();
		}
		return null;
	}

	@Override
	public void updateLeaderExtend(Object o) {
		this.getHibernateTemplate().update(o);
	}

	@Override
	public List<Object> getLeaderExtendInfo(final String sql) {
		
		List data= this.getHibernateTemplate().execute(new HibernateCallback<List<?>>() {
			@Override
			public List<?> doInHibernate(Session session)
					throws HibernateException, SQLException {
				List<?> data = session
						.createQuery(sql).list();
				return data;
			}
		});
		return data;
	}

	@Override
	public void deleteLeaderExtend(Object o) {
		this.getHibernateTemplate().delete(o);
		
	}

}
