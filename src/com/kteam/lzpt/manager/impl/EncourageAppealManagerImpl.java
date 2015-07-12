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

import com.kteam.lzpt.entity.EncourageAppeal;
import com.kteam.lzpt.entity.KeyWordsConfig;
import com.kteam.lzpt.manager.IEncourageAppealManager;

public class EncourageAppealManagerImpl extends HibernateDaoSupport implements
		IEncourageAppealManager {

	@Override
	public void addEncourageAppeal(EncourageAppeal ea) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(ea);
	}

	@Override
	public void modifyEncourageAppeal(EncourageAppeal ea) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(ea);
	}

	@Override
	public void deleteEncourageAppeal(String id) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(this.getHibernateTemplate().get(EncourageAppeal.class, id));
	}

	@Override
	public List<EncourageAppeal> queryEncourageAppeal(EncourageAppeal ea,
			final int pageSize, final int pageNumber) {
		final Map<String,Object> paramMap=new HashMap<String,Object>();
		String whereSql = " where 1=1 ";
		if (null != ea)
        {
        	if (null != ea.getEtitle() && !("".equals(ea.getEtitle())))
        	{
        		whereSql = whereSql + " and ea.etitle like :etitle";
        		paramMap.put("etitle", "%"+ea.getEtitle()+"%");
        	}
        	if (0 != ea.getState())
        	{
        		whereSql = whereSql + " and ea.state = :state";
        		paramMap.put("state", ea.getState());
        	}
        	whereSql = whereSql + " and ea.etype = :etype";
        	paramMap.put("etype", ea.getEtype());
        	
        }
		
		final String strSql = " FROM EncourageAppeal ea " + whereSql;

		List<?> list = this.getHibernateTemplate().execute(new HibernateCallback<List<?>>(){

			@Override
			public List<?> doInHibernate(Session session)
					throws HibernateException, SQLException {
						List<?> eas = null;
						Query query = session.createQuery(strSql);
						for(String param:paramMap.keySet()){
							query.setParameter(param, paramMap.get(param));
						}
						eas = query.setFirstResult(
										pageNumber * pageSize - pageSize)
								.setMaxResults(pageSize).list();
						
				return eas;
			}
			
		});
		return (List<EncourageAppeal>) list;
	}

	@Override
	public int getEncourageAppealTotal(EncourageAppeal ea) {
		final Map<String,Object> paramMap=new HashMap<String,Object>();
		String whereSql = " where 1=1 ";
		if (null != ea)
        {
        	if (null != ea.getEtitle() && !("".equals(ea.getEtitle())))
        	{
        		whereSql = whereSql + " and ea.etitle like :etitle";
        		paramMap.put("etitle", "%"+ea.getEtitle()+"%");
        	}
        	if (0 != ea.getState())
        	{
        		whereSql = whereSql + " and ea.state = :state";
        		paramMap.put("state", ea.getState());
        	}
        	whereSql = whereSql + " and ea.etype = :etype";
        	paramMap.put("etype", ea.getEtype());
        	
        }
		final String strSql = "select count(*) from EncourageAppeal ea " + whereSql;
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
	public EncourageAppeal getEncourageAppealById(String id) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().get(EncourageAppeal.class, id);
	}

}
