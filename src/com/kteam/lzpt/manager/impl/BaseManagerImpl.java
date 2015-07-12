package com.kteam.lzpt.manager.impl;

import java.io.Serializable;
import java.math.BigInteger;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.transform.Transformers;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.kteam.lzpt.manager.IBaseManager;

public class BaseManagerImpl extends HibernateDaoSupport implements
		IBaseManager {

	@Override
	public String addBaseEntity(Object object) {

		Serializable sid = this.getHibernateTemplate().save(object);
		if (sid != null) {
			return sid.toString();
		}
		return null;
	}

	@Override
	public void updateBaseEntity(Object object) {
		this.getHibernateTemplate().update(object);
	}

	@Override
	public void deleteBaseEntity(Object object) {
		this.getHibernateTemplate().delete(object);
	}

	@Override
	public List<Object> getBaseEntityList(final Class<?> c,
			final List<Criterion> criterions,final ProjectionList projections, final Map pageMap) {
		
		List<Object> baseEntityList = this.getHibernateTemplate().execute(
				new HibernateCallback<List<Object>>() {
					public List<Object> doInHibernate(Session session)
							throws HibernateException, SQLException {
						Criteria criteria = session.createCriteria(c,"be");
						if(criterions!=null){
							for (Criterion criterion : criterions) {
								criteria.add(criterion);
							}
						}
						if(projections!=null){
							criteria.setProjection(projections);
						}
						if (pageMap != null) {
							Integer pageNumber = (Integer) pageMap
									.get("pageNumber");
							Integer pageSize = (Integer) pageMap
									.get("pageSize");
							if (pageNumber != null && pageSize != null) {
								criteria.setFirstResult((pageNumber - 1)* pageSize);
								criteria.setMaxResults(pageSize);
							}
						}
						List list = criteria.list();
						return list;
					}
				});
		return baseEntityList;
	}
	
	@Override
	public List<Object> getBaseMapList(final Class<?> c,
			final List<Criterion> criterions,final ProjectionList projections, final Map pageMap) {
		List<Object> baseEntityList = this.getHibernateTemplate().execute(
				new HibernateCallback<List<Object>>() {
					public List<Object> doInHibernate(Session session)
							throws HibernateException, SQLException {
						Criteria criteria = session.createCriteria(c,"be");
						if(criterions!=null){
							for (Criterion criterion : criterions) {
								criteria.add(criterion);
							}
						}
						if(projections!=null){
							criteria.setProjection(projections);
						}
						if (pageMap != null) {
							Integer pageNumber = (Integer) pageMap
									.get("pageNumber");
							Integer pageSize = (Integer) pageMap
									.get("pageSize");
							if (pageNumber != null && pageSize != null) {
								criteria.setFirstResult((pageNumber - 1)* pageSize);
								criteria.setMaxResults(pageSize);
							}
						}
						criteria.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
						List list = criteria.list();
						return list;
					}
				});
		return baseEntityList;
	}
	
	
	
	public Object  getBaseUniqueResult(final Class<?> c,
			final List<Criterion> criterions,final ProjectionList projections) {

		Object  object = this.getHibernateTemplate().execute(
				new HibernateCallback<Object>() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Criteria criteria = session.createCriteria(c);
						if(criterions!=null){
							for (Criterion criterion : criterions) {
								criteria.add(criterion);
							}
						}
						if(projections!=null){
							criteria.setProjection(projections);
						}
						
						return  criteria.uniqueResult();
					}
				});
		return object;
	}
	
	
	
	public Integer  getBaseEntityCount(final Class<?> c,
			final List<Criterion> criterions,final ProjectionList projections) {

		Integer  baseEntityList = this.getHibernateTemplate().execute(
				new HibernateCallback<Integer>() {
					public Integer doInHibernate(Session session)
							throws HibernateException, SQLException {
						Criteria criteria = session.createCriteria(c);
						if(criterions!=null){
							for (Criterion criterion : criterions) {
								criteria.add(criterion);
							}
						}
						
						if(projections!=null){
							projections.add(Projections.rowCount());
							criteria.setProjection(projections);
						}else{
							criteria.setProjection(Projections.rowCount());
						}
					
						Long count= (Long) criteria.uniqueResult();
						return count.intValue();
					}
				});
		return baseEntityList;
	}

	@Override
	public Object getBaseEntity(Class<?> entityClass, String id) {
		Object object = this.getHibernateTemplate().get(entityClass, id);
		return object;
	}

	@Override
	public List<Object> getBaseListOfSql(final String sql,final Map be, final Map pageMap) {
		return this.getHibernateTemplate().execute(new HibernateCallback<List<Object>>() {
			@Override
			public List<Object> doInHibernate(Session session)
					throws HibernateException, SQLException {
				SQLQuery query = session.createSQLQuery(sql);
				
				if (pageMap != null) {
					Integer pageNumber = (Integer) pageMap
							.get("pageNumber");
					Integer pageSize = (Integer) pageMap
							.get("pageSize");
					if (pageNumber != null && pageSize != null) {
						query.setFirstResult((pageNumber - 1)* pageSize);
						query.setMaxResults(pageSize);
					}
				}
				String[] paramKeys = query.getNamedParameters();
				
				for(String key: paramKeys){
					query.setParameter(key,be.get(key));
				}
				
				query.setResultTransformer(
	                    Transformers.ALIAS_TO_ENTITY_MAP);
				return query.list();
			}
		});
	}

	@Override
	public Integer getBaseCountOfSql(final String sql,final Map be) {
		return this.getHibernateTemplate().execute(new HibernateCallback<Integer>() {
			@Override
			public Integer doInHibernate(Session session)
					throws HibernateException, SQLException {
				
				Query query = session.createSQLQuery(sql);
				String[] paramKeys = query.getNamedParameters();
				for(String key: paramKeys){
					query.setParameter(key,be.get(key));
				}
				BigInteger count = (BigInteger)query.uniqueResult();
				
				if(count!=null){
					return count.intValue();
				}
				return null;
			}
		});
	}

	@Override
	public Object getUniqueQueryResult(final String sql,final Map be) {
		
		return this.getHibernateTemplate().execute(new HibernateCallback<Object>() {
			@Override
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createSQLQuery(sql);
				String[] paramKeys = query.getNamedParameters();
				for(String key: paramKeys){
					query.setParameter(key,be.get(key));
				}
				Object o = (Object)query.uniqueResult();
				return o;
			}
		});
	}

}
