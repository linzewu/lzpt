package com.kteam.lzpt.manager;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.ProjectionList;

public interface IBaseManager {
	
	public String addBaseEntity(Object object);
	
	public void updateBaseEntity(Object object);
	
	public void deleteBaseEntity(Object object);
	
	public List<Object> getBaseEntityList(Class<?> c,List<Criterion> criterions,ProjectionList projections, Map pageMap);
	
	public List<Object> getBaseMapList(Class<?> c,List<Criterion> criterions,ProjectionList projections, Map pageMap);
	
	public Object getBaseEntity(Class<?> entityClass,String id);
	
	public Integer  getBaseEntityCount(Class<?> c, List<Criterion> criterions,ProjectionList  projections );
	
	public Object  getBaseUniqueResult(Class<?> c, List<Criterion> criterions, ProjectionList  projections);
	
//	public List<Object> getBaseEntityListOfSql( String sql, Map paramMap,  Map pageMap);
	
	public List<Object> getBaseListOfSql(String sql,Map be,Map pageMap);
	
	public Integer getBaseCountOfSql(String sql,Map be);
	
	public Object  getUniqueQueryResult(String sql,Map be);
	
}
