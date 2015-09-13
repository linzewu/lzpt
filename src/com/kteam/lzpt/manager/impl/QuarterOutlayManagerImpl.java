package com.kteam.lzpt.manager.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.kteam.lzpt.entity.QuarterOutlay;
import com.kteam.lzpt.entity.TrainExperience;
import com.kteam.lzpt.manager.IQuarterOutlayManager;
import com.sun.org.apache.xml.internal.security.encryption.Transforms;

public class QuarterOutlayManagerImpl extends HibernateDaoSupport implements IQuarterOutlayManager {

	/**
	 * 添加季度经费
	 * @param qo
	 */
	public void addQuarterOutlay(QuarterOutlay qo) {

		this.getHibernateTemplate().save(qo);
		
	}

	/**
	 * 删除季度经费
	 * @param id
	 */
	public void deleteQuarterOutlay(String id) {

		this.getHibernateTemplate().delete(this.getHibernateTemplate().get(QuarterOutlay.class, id));
		
	}

	/**
	 * 修改季度经费
	 * @param qo
	 */
	public void modifyQuarterOutlay(QuarterOutlay qo) {
		
		this.getHibernateTemplate().update(qo);
		
	}
	
	/**
	 * 根据id查询季度经费
	 * @param id
	 * @return
	 */
	public QuarterOutlay getQuarterOutlayById(String id)
	{
		QuarterOutlay qo = this.getHibernateTemplate().get(QuarterOutlay.class, id);
		return qo;
	}

	/**
	 * 查询季度经费列表
	 * @param qo
	 * @param pageSize
	 * @param pageNumber
	 * @return
	 */
	public List<QuarterOutlay> getQuarterOutlays(QuarterOutlay qo,
			final int pageSize, final int pageNumber,final String uname) {
		List<QuarterOutlay> list = new ArrayList<QuarterOutlay>();
		final String strsql = " FROM QuarterOutlay qo where 1 = 1";
		
		final Map<String,Object> paramMap=new HashMap<String,Object>();
		StringBuffer sb = new StringBuffer("");
//		if (null != uname && !"".equals(uname))
//		{
//			sb.append(" and qo.createUser = :createUser");
//			paramMap.put("createUser", uname);
//		}
		if (null != qo)
		{
			if ( qo.getQoyear() > 0)
			{
				sb.append(" and qo.qoyear = :qoyear");
				paramMap.put("qoyear", qo.getQoyear());
			}
			if (qo.getQoquarter() > 0)
			{
				sb.append(" and qo.qoquarter = :qoquarter");
				paramMap.put("qoquarter", qo.getQoquarter());
			}
			if (null != qo.getWa())
			{
				if (null != qo.getWa().getId() && !("".equals(qo.getWa().getId())))
				{
					sb.append(" and qo.wa.id = :wid");
					paramMap.put("wid", qo.getWa().getId());
				}
			}
		}
		sb.append(" order by qoyear asc , qoquarter asc , qo.wa.order asc ");
		final String sql = strsql + sb.toString();
		
		list = this.getHibernateTemplate().execute(new HibernateCallback<List<QuarterOutlay>>(){

			@Override
			public List<QuarterOutlay> doInHibernate(Session session)
					throws HibernateException, SQLException {
				List<QuarterOutlay> li = null;
				Query query = session.createQuery(sql);
				for (String key:paramMap.keySet())
				{
					query.setParameter(key, paramMap.get(key));
				}
				
				li = query.setFirstResult(pageSize * pageNumber - pageSize )
				.setMaxResults(pageSize).list();
				
				return li;
			}
			
		});
		
		return list;
	}

	/**
	 * 查询季度经费记录数
	 * @param qo
	 * @return
	 */
	public int getQuarterOutlayCount(QuarterOutlay qo,final String uname) {
		int count = 0;
		String strsql = "select count(*) from QuarterOutlay qo where 1 = 1";
		final Map<String,Object> paramMap=new HashMap<String,Object>();
		StringBuffer sb = new StringBuffer("");
		if (null != uname && !"".equals(uname))
		{
			sb.append(" and qo.createUser = :createUser");
			paramMap.put("createUser", uname);
		}
		if (null != qo)
		{
			if (qo.getQoyear() > 0)
			{
				sb.append(" and qo.qoyear = :qoyear");
				paramMap.put("qoyear", qo.getQoyear());
			}
			if (qo.getQoquarter() > 0)
			{
				sb.append(" and qo.qoquarter = :qoquarter");
				paramMap.put("qoquarter", qo.getQoquarter());
			}
			if (null != qo.getWa())
			{
				if (null != qo.getWa().getId() && !("".equals(qo.getWa().getId())))
				{
					sb.append(" and qo.wa.id = :wid");
					paramMap.put("wid", qo.getWa().getId());
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

	@Override
	public List getQuarterOutlaysCheck(QuarterOutlay qo,String uname) {
		List list = new ArrayList();
		StringBuffer sb = new StringBuffer("select tub.c_gwjdys,tub.c_ygcgys,tub.c_gwycys,tmq1.c_qoyear,twa.c_wname c_wname, ");
		
		for(int i=1;i<=4;i++){
			sb.append("sum(case tmq1.c_qoquarter when "+i+" then tmq1.c_trafficMon+tmq1.c_stayMon+tmq1.c_foodMon+tmq1.c_otherBusiness else 0 end) c_trafficMon"+i+",");
			sb.append("sum(case tmq1.c_qoquarter when "+i+" then tmq2.c_trafficMon+tmq2.c_stayMon+tmq2.c_foodMon+tmq2.c_otherBusiness else 0 end) c_trafficMon"+i+"_Prior,");
			sb.append("sum(case tmq1.c_qoquarter when "+i+" then tmq1.c_trainMon+tmq1.c_bidMon+tmq1.c_otherAbroadMon else 0 end) c_trainMon"+i+",");
			sb.append("sum(case tmq1.c_qoquarter when "+i+" then tmq2.c_trainMon+tmq2.c_bidMon+tmq2.c_otherAbroadMon else 0 end) c_trainMon"+i+"_Prior,");
			sb.append("sum(case tmq1.c_qoquarter when "+i+" then tmq1.c_buyCarMon+tmq1.c_fixCarMon else 0 end) c_buyCarMon"+i+",");
			sb.append("sum(case tmq1.c_qoquarter when "+i+" then tmq2.c_buyCarMon+tmq2.c_fixCarMon else 0 end) c_buyCarMon"+i+"_Prior");
			if(i!=4){
				sb.append(",");
			}
		}
		sb.append(" from tm_quarteroutlay tmq1 left join tm_quarteroutlay tmq2 on tmq1.c_qoyear-1=tmq2.c_qoyear and tmq1.c_qoquarter=tmq2.c_qoquarter and tmq1.t_waid=tmq2.t_waid left join tm_workarchive twa on tmq1.t_waid = twa.c_id ");
		
		sb.append(" left join tm_unityearbudget tub on  tmq1.t_waid = tub.c_unitId and tmq1.c_qoyear=tub.c_year ");
		
		sb.append("where 1=1 ");
		
		final Map<String,Object> paramMap=new HashMap<String,Object>();
		
//		if (null != uname && !"".equals(uname))
//		{
//			sb.append(" and tmq1.c_addUser = :createUser");
//			paramMap.put("createUser", uname);
//		}
		
		if (null != qo)
		{
			if (qo.getQoyear() > 0)
			{
				sb.append(" and tmq1.c_qoyear = :qoyear");
				paramMap.put("qoyear", qo.getQoyear());
			}
			
			if (null != qo.getWa())
			{
				if (null != qo.getWa().getId() && !("".equals(qo.getWa().getId())))
				{
					sb.append(" and tmq1.t_waid = :wid");
					paramMap.put("wid", qo.getWa().getId());
				}
			}
		}
		sb.append(" group by tmq1.t_waid,tmq1.c_qoyear  ");
		sb.append(" order by twa.c_order asc ");
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

	/**
	 * 判断季度经费是否存在
	 * @param qo
	 * @param uname
	 * @return
	 */
	public int isQuarterExist(QuarterOutlay qo, String uname) {
		int count = 0;
		String strsql = "select count(*) from QuarterOutlay qo where 1 = 1";
		final Map<String,Object> paramMap=new HashMap<String,Object>();
		StringBuffer sb = new StringBuffer("");
		if (null != uname && !"".equals(uname))
		{
			sb.append(" and qo.createUser = :createUser");
			paramMap.put("createUser", uname);
		}
		if (null != qo)
		{
			if (qo.getQoyear() > 0)
			{
				sb.append(" and qo.qoyear = :qoyear");
				paramMap.put("qoyear", qo.getQoyear());
			}
			if (qo.getQoquarter() > 0)
			{
				sb.append(" and qo.qoquarter = :qoquarter");
				paramMap.put("qoquarter", qo.getQoquarter());
			}
			if (null != qo.getWa())
			{
				if (null != qo.getWa().getId() && !("".equals(qo.getWa().getId())))
				{
					sb.append(" and qo.wa.id = :wid");
					paramMap.put("wid", qo.getWa().getId());
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

}
