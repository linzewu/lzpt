package com.kteam.lzpt.manager.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.digester.SetRootRule;
import org.apache.struts2.ServletActionContext;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.kteam.lzpt.entity.Evaluate;
import com.kteam.lzpt.entity.WorkArchive;
import com.kteam.lzpt.manager.IEvaluateManager;

public class EvaluateManagerImpl extends HibernateDaoSupport implements IEvaluateManager {

	@Override
	public void addEvaluates(List<Evaluate> es) {
		
		for(Evaluate e:es){
			this.getHibernateTemplate().save(e);
		}
		
	}

	@Override
	public void deleteEvaluate(List<Evaluate> es) {
		
		for(Evaluate e:es){
			this.getHibernateTemplate().delete(e);
		}

	}

	@Override
	public List<Evaluate> getEvaluates(final String year,final String unit) {
		
		List<Evaluate> es = this.getHibernateTemplate().execute(new HibernateCallback<List<Evaluate>>() {

			@Override
			public List<Evaluate> doInHibernate(Session session)
					throws HibernateException, SQLException {
				
				String sql="From Evaluate e where e.year=:year and e.unit=:unit";
				
				Query query = session.createQuery(sql)
					.setParameter("year",year).setParameter("unit", unit);
				return query.list();
			}
			
		});
		
		return es;
	}

	@Override
	public List<Evaluate> getEvaluatesByYear(final String year) {
		
		
		StringBuffer strSql=new StringBuffer("SELECT e.c_win 'win',");
		
		List<WorkArchive> units =(List<WorkArchive>)ServletActionContext.getServletContext().getAttribute("units_list");
		
		for(WorkArchive unit: units){
			
			strSql.append("SUM(CASE e.c_unit WHEN '"+unit.getWname()+"' THEN e.c_evaluate ELSE 0 END) '"+unit.getWname()+"' ,");
		}
		
		strSql=new StringBuffer(strSql.substring(0,strSql.length()-1));
		
		strSql.append("FROM tm_evaluate e WHERE e.c_year=:year GROUP BY e.c_win");
		
		final String sql=strSql.toString();
		
		System.out.println(sql);
		
		List<Evaluate> es = this.getHibernateTemplate().execute(new HibernateCallback<List<Evaluate>>() {
			@Override
			public List<Evaluate> doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createSQLQuery(sql)
						.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP)
					.setParameter("year",year);
				return query.list();
			}
		});
		
		return es;
	}

}
