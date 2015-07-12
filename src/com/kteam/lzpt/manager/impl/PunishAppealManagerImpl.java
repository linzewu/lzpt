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
import com.kteam.lzpt.entity.PunishAppeal;
import com.kteam.lzpt.manager.IPunishAppealManager;

public class PunishAppealManagerImpl extends HibernateDaoSupport implements
		IPunishAppealManager {

	@Override
	public void addPunishAppeal(PunishAppeal pa) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(pa);
	}

	@Override
	public void modifyPunishAppeal(PunishAppeal pa) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(pa);
	}

	@Override
	public void deletePunishAppeal(String id) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(this.getHibernateTemplate().get(PunishAppeal.class, id));
	}

	@Override
	public List<PunishAppeal> queryPunishAppeal(PunishAppeal pa, final int pageSize,
			final int pageNumber) {
		final Map<String,Object> paramMap=new HashMap<String,Object>();
		String whereSql = " where 1=1 ";
		if (null != pa)
        {
        	if (null != pa.getPtitle() && !("".equals(pa.getPtitle())))
        	{
        		whereSql = whereSql + " and pa.ptitle like :ptitle";
        		paramMap.put("ptitle", "%"+pa.getPtitle()+"%");
        	}
        	
        }
		
		final String strSql = " FROM PunishAppeal pa " + whereSql;

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
		return (List<PunishAppeal>) list;
	}

	@Override
	public int getPunishAppealTotal(PunishAppeal pa) {
		final Map<String,Object> paramMap=new HashMap<String,Object>();
		String whereSql = " where 1=1 ";
		if (null != pa)
        {
        	if (null != pa.getPtitle() && !("".equals(pa.getPtitle())))
        	{
        		whereSql = whereSql + " and pa.ptitle like :ptitle";
        		paramMap.put("ptitle", "%"+pa.getPtitle()+"%");
        	}
        	
        }
		final String strSql = "select count(*) from PunishAppeal pa " + whereSql;
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
	public PunishAppeal getPunishAppealById(String id) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().get(PunishAppeal.class, id);
	}

}
