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

import com.kteam.lzpt.entity.KeyWordsConfig;
import com.kteam.lzpt.manager.IKeyWordsConfigManager;

public class KeyWordsConfigManagerImpl extends HibernateDaoSupport implements IKeyWordsConfigManager {

	@Override
	public void addKeyWord(KeyWordsConfig kw) {
		this.getHibernateTemplate().save(kw);
		
	}

	@Override
	public void updateKeyWord(KeyWordsConfig kw) {
		this.getHibernateTemplate().update(kw);
		
	}

	@Override
	public void deleteKeyWord(String id) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(this.getHibernateTemplate().get(KeyWordsConfig.class, id));
	}
	
	public KeyWordsConfig getKeyWordById(String id) {
		// TODO Auto-generated method stub
		KeyWordsConfig kw = (KeyWordsConfig) this.getSession().get(KeyWordsConfig.class, id);
		return kw;
	}

	@Override
	public List<KeyWordsConfig> queryKeyWordsConfig(KeyWordsConfig kw,
			final int pageSize, final int pageNumber) {
		final Map<String,Object> paramMap=new HashMap<String,Object>();
		String whereSql = " where 1=1 ";
		if (null != kw)
        {
        	if (null != kw.getKeyWords() && !("".equals(kw.getKeyWords())))
        	{
        		whereSql = whereSql + " and kw.keyWords like :keyWords";
        		paramMap.put("keyWords", "%"+kw.getKeyWords()+"%");
        	}
        	
        }
		
		final String strSql = " FROM KeyWordsConfig kw " + whereSql;

		List<?> list = this.getHibernateTemplate().execute(new HibernateCallback<List<?>>(){

			@Override
			public List<?> doInHibernate(Session session)
					throws HibernateException, SQLException {
						List<?> keyWords = null;
						Query query = session.createQuery(strSql);
						for(String param:paramMap.keySet()){
							query.setParameter(param, paramMap.get(param));
						}
						keyWords = query.setFirstResult(
										pageNumber * pageSize - pageSize)
								.setMaxResults(pageSize).list();
						
				return keyWords;
			}
			
		});
		return (List<KeyWordsConfig>) list;
	}

	@Override
	public int getKeyWordsConfigTotal(KeyWordsConfig kw) {
		final Map<String,Object> paramMap=new HashMap<String,Object>();
		String whereSql = " where 1=1 ";
		if (null != kw)
        {
        	if (null != kw.getKeyWords() && !("".equals(kw.getKeyWords())))
        	{
        		whereSql = whereSql + " and kw.keyWords like :keyWords";
        		paramMap.put("keyWords", "%"+kw.getKeyWords()+"%");
        	}
        	
        }
		final String strSql = "select count(*) from KeyWordsConfig kw " + whereSql;
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

}
