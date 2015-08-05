package com.kteam.lzpt.manager.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.kteam.lzpt.entity.QuarterOutlay;
import com.kteam.lzpt.entity.YearOutlay;
import com.kteam.lzpt.manager.IYearOutlayManager;

public class YearOutlayManagerImpl extends HibernateDaoSupport implements
		IYearOutlayManager {

	/**
	 * 添加年度经费
	 * @param yo
	 */
	public void addYearOutlay(YearOutlay yo) {
		
		this.getHibernateTemplate().save(yo);
		
	}

	/**
	 * 删除年度经费
	 * @param id
	 */
	public void deleteYearOutlay(String id) {
		
		this.getHibernateTemplate().delete(this.getHibernateTemplate().get(YearOutlay.class, id));
		
	}

	/**
	 * 修改年度经费
	 * @param yo
	 */
	public void modifyYearOutlay(YearOutlay yo) {
		
		this.getHibernateTemplate().update(yo);
		
	}

	/**
	 * 根据id查询年度经费
	 * @param id
	 * @return
	 */
	public YearOutlay getYearOutlayById(String id) {
		
		YearOutlay yo = this.getHibernateTemplate().get(YearOutlay.class, id);
		return yo;
	}

	/**
	 * 查询年度经费列表
	 * @param yo
	 * @param pageSize
	 * @param pageNumber
	 * @return
	 */
	public List<YearOutlay> getYearOutlays(YearOutlay yo, final int pageSize,
			final int pageNumber, String uname) {
		List<YearOutlay> list = new ArrayList<YearOutlay>();
		final String strsql = " FROM YearOutlay yo where 1 = 1";
		
		final Map<String,Object> paramMap=new HashMap<String,Object>();
		StringBuffer sb = new StringBuffer("");
		if (null != uname && !"".equals(uname))
		{
			sb.append(" and yo.createUser = :createUser");
			paramMap.put("createUser", uname);
		}
		if (null != yo)
		{
			if ( yo.getYoyear() > 0)
			{
				sb.append(" and yo.yoyear = :yoyear");
				paramMap.put("yoyear", yo.getYoyear());
			}
			
			if (null != yo.getWa())
			{
				if (null != yo.getWa().getId() && !("".equals(yo.getWa().getId())))
				{
					sb.append(" and yo.wa.id = :wid");
					paramMap.put("wid", yo.getWa().getId());
				}
			}
		}
		final String sql = strsql + sb.toString();
		
		list = this.getHibernateTemplate().execute(new HibernateCallback<List<YearOutlay>>(){

			@Override
			public List<YearOutlay> doInHibernate(Session session)
					throws HibernateException, SQLException {
				List<YearOutlay> li = null;
				Query query = session.createQuery(sql);
				for (String key:paramMap.keySet())
				{
					query.setParameter(key, paramMap.get(key));
				}
				li = query.setFirstResult(pageSize * pageNumber - pageSize )
				.setMaxResults(pageNumber).list();
				
				return li;
			}
			
		});
		
		return list;
	}

	/**
	 * 查询年度经费记录数
	 * @param yo
	 * @return
	 */
	public int getYearOutlayCount(YearOutlay yo, String uname) {
		int count = 0;
		String strsql = "select count(*) from YearOutlay yo where 1 = 1";
		final Map<String,Object> paramMap=new HashMap<String,Object>();
		StringBuffer sb = new StringBuffer("");
		if (null != uname && !"".equals(uname))
		{
			sb.append(" and yo.createUser = :createUser");
			paramMap.put("createUser", uname);
		}
		if (null != yo)
		{
			if (yo.getYoyear() > 0)
			{
				sb.append(" and yo.yoyear = :yoyear");
				paramMap.put("yoyear", yo.getYoyear());
			}
			
			if (null != yo.getWa())
			{
				if (null != yo.getWa().getId() && !("".equals(yo.getWa().getId())))
				{
					sb.append(" and yo.wa.id = :wid");
					paramMap.put("wid", yo.getWa().getId());
				}
			}
		}
		final String sql = strsql + sb.toString();
		count = this.getHibernateTemplate().execute(new HibernateCallback<Integer>(){

			@Override
			public Integer doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(sql);
				for (String key:paramMap.keySet())
				{
					query.setParameter(key, paramMap.get(key));
				}
				Long lo = (Long) query.uniqueResult();
				return lo.intValue();
			}
			
		});
		return count;
	}
	
	/**
	 * 年度经费对比
	 * @param year1
	 * @param year2
	 * @param waid
	 * @param uname
	 * @return
	 */
	public List getYearOutlayCompare(int year1,int year2,String waid,String uname)
	{
		List list = new ArrayList();
		StringBuffer sb = new StringBuffer("");
		final Map<String,Object> paramMap=new HashMap<String,Object>();
		sb.append("select c_wname,sum(case tq.c_qoyear when "+year1+" then c_trainMon else 0 end) + ")
		.append("sum(case tq.c_qoyear when "+year1+" then c_bidMon else 0 end) +")
		.append("sum(case tq.c_qoyear when "+year1+" then c_otherAbroadMon else 0 end) b1,")
		.append("sum(case tq.c_qoyear when "+year1+" then c_buyCarMon else 0 end) + ")
		.append("sum(case tq.c_qoyear when "+year1+" then c_fixCarMon else 0 end) b2,  ")
		.append("sum(case tq.c_qoyear when "+year1+" then c_trafficMon else 0 end) + ")
		.append("sum(case tq.c_qoyear when "+year1+" then c_stayMon else 0 end) +")
		.append("sum(case tq.c_qoyear when "+year1+" then c_foodMon else 0 end) +")
		.append("sum(case tq.c_qoyear when "+year1+" then c_otherBusiness else 0 end) b3,")
	
		.append("sum(case tq.c_qoyear when "+year2+" then c_trainMon else 0 end) + ")
		.append("sum(case tq.c_qoyear when "+year2+" then c_bidMon else 0 end) +")
		.append("sum(case tq.c_qoyear when "+year2+" then c_otherAbroadMon else 0 end) b4,")
		.append("sum(case tq.c_qoyear when "+year2+" then c_buyCarMon else 0 end) + ")
		.append("sum(case tq.c_qoyear when "+year2+" then c_fixCarMon else 0 end) b5, ") 
		.append("sum(case tq.c_qoyear when "+year2+" then c_trafficMon else 0 end) + ")
		.append("sum(case tq.c_qoyear when "+year2+" then c_stayMon else 0 end) +")
		.append("sum(case tq.c_qoyear when "+year2+" then c_foodMon else 0 end) +")
		.append("sum(case tq.c_qoyear when "+year2+" then c_otherBusiness else 0 end)b6")
	
		.append(" from tm_quarteroutlay  tq left join tm_workarchive twa on tq.t_waid = twa.c_id")
		//.append(" LEFT JOIN tm_quarteroutlay tq on ty.c_yoyear= tq.c_qoyear and ty.t_waid = tq.t_waid")
		.append(" where (tq.c_qoyear = "+year1+" or tq.c_qoyear = "+year2+")");
		
//		if (null != uname && !"".equals(uname))
//		{
//			sb.append(" and ty.c_addUser = :createUser");
//			paramMap.put("createUser", uname);
//		}
		if (null != waid && !"".equals(waid))
		{
			sb.append(" and tq.t_waid = :waid ");
			paramMap.put("waid", waid);
		}
		sb.append(" group by tq.t_waid");
		sb.append(" order by twa.c_order ");
		final String sql = sb.toString();
		
		list = this.getHibernateTemplate().execute(new HibernateCallback<List>(){

			@Override
			public List doInHibernate(Session session) throws HibernateException,
					SQLException {
				List li = null;
				Query query = session.createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
				for (String key:paramMap.keySet())
				{
					query.setParameter(key, paramMap.get(key));
				}
				li = query.list();
				
				return li;
			}
			
		});
		return list;
	}
	
//	select c_wname,sum(case tq.c_qoyear when 2012 then c_trainMon else 0 end) + 
//	sum(case tq.c_qoyear when 2012 then c_bidMon else 0 end) +
//	sum(case tq.c_qoyear when 2012 then c_otherAbroadMon else 0 end) b1,
//	sum(case tq.c_qoyear when 2012 then c_buyCarMon else 0 end) + 
//	sum(case tq.c_qoyear when 2012 then c_fixCarMon else 0 end) b2,  
//	sum(case tq.c_qoyear when 2012 then c_trafficMon else 0 end) + 
//	sum(case tq.c_qoyear when 2012 then c_stayMon else 0 end) +
//	sum(case tq.c_qoyear when 2012 then c_foodMon else 0 end) +
//	sum(case tq.c_qoyear when 2012 then c_otherBusiness else 0 end) b3,
//
//	sum(case tq.c_qoyear when 2013 then c_trainMon else 0 end) + 
//	sum(case tq.c_qoyear when 2013 then c_bidMon else 0 end) +
//	sum(case tq.c_qoyear when 2013 then c_otherAbroadMon else 0 end) b4,
//	sum(case tq.c_qoyear when 2013 then c_buyCarMon else 0 end) + 
//	sum(case tq.c_qoyear when 2013 then c_fixCarMon else 0 end) b5,  
//	sum(case tq.c_qoyear when 2013 then c_trafficMon else 0 end) + 
//	sum(case tq.c_qoyear when 2013 then c_stayMon else 0 end) +
//	sum(case tq.c_qoyear when 2013 then c_foodMon else 0 end) +
//	sum(case tq.c_qoyear when 2013 then c_otherBusiness else 0 end)b6
//
//	  from tm_yearoutlay  ty left join tm_workarchive twa on ty.t_waid = twa.c_id
//	LEFT JOIN tm_quarteroutlay tq on ty.c_yoyear= tq.c_qoyear and ty.t_waid = tq.t_waid
//	 group by ty.t_waid;

}
