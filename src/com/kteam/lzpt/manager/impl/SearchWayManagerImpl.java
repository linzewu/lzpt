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

import com.kteam.lzpt.entity.CadreArchive;
import com.kteam.lzpt.entity.Role;
import com.kteam.lzpt.entity.SearchWay;
import com.kteam.lzpt.manager.SearchWayManager;

public class SearchWayManagerImpl extends HibernateDaoSupport implements
		SearchWayManager {
	
	@Override
	public void addSearchWay(SearchWay searchWay) {
		this.getHibernateTemplate().save(searchWay);

	}
	
	public void updateSearchWay(SearchWay searchWay) {
		this.getHibernateTemplate().update(searchWay);

	}
	
	@Override
	public List<SearchWay> querySearchWay(final SearchWay sw,final int pageSize,
			final int pageNumber) {
		final Map<String,Object> paramMap=new HashMap<String,Object>();
		String whereSql = " where 1=1 ";
		if (null != sw)
        {
        	if (null != sw.getSearchmode() && !("".equals(sw.getSearchmode())))
        	{
        		whereSql = whereSql + " and sw.searchmode like :searchmode";
        		paramMap.put("searchmode", "%"+sw.getSearchmode()+"%");
        	}
        	
        }
		
		final String strSql = " FROM SearchWay sw " + whereSql;

		List<?> list = this.getHibernateTemplate().execute(new HibernateCallback<List<?>>(){

			@Override
			public List<?> doInHibernate(Session session)
					throws HibernateException, SQLException {
						List<?> searchWay = null;
						Query query = session.createQuery(strSql);
						for(String param:paramMap.keySet()){
							query.setParameter(param, paramMap.get(param));
						}
						searchWay = query.setFirstResult(
										pageNumber * pageSize - pageSize)
								.setMaxResults(pageSize).list();
				return searchWay;
			}
			
		});
		return (List<SearchWay>) list;
	}
	
	@Override
	public int getSearchWayTotal(SearchWay sw) {
		final Map<String,Object> paramMap=new HashMap<String,Object>();
		String whereSql = " where 1=1 ";
		if (null != sw)
        {
        	if (null != sw.getSearchmode() && !("".equals(sw.getSearchmode())))
        	{
        		whereSql = whereSql + " and sw.searchmode like :searchmode";
        		paramMap.put("searchmode", "%"+sw.getSearchmode()+"%");
        	}
        	
        }
		final String strSql = "select count(*) from SearchWay sw " + whereSql;
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
	
	
	public List<SearchWay> querySearchWays()
	{
		List<SearchWay> list = this.getHibernateTemplate().find(" from SearchWay");
		return list;
	}
	
	public List<SearchWay> querySearchWaysById(String[] id)
	{
		if (null != id)
		{
			StringBuffer ids = new StringBuffer("");
			for (int i = 0;i < id.length; i++)
			{
				ids.append("'"+id[i].trim()+"',");
			}
			String sid = ids.toString();
			sid = sid.substring(0,sid.length()-1);
			List<SearchWay> list = this.getHibernateTemplate().find("from SearchWay sw where sw.id in ("+sid+")");
			return list;
		}
		else
		{
			return null;
		}
		
	}

}
