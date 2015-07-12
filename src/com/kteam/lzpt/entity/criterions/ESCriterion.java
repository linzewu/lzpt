package com.kteam.lzpt.entity.criterions;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;

/**
 * EvaluationSupervision 监督员评价查询条件
 * @author Administrator
 *
 */
public class ESCriterion extends CriterionAbstract {

	@Override
	public List<Criterion> getCriterions(Map param) {
		
		String year = (String)param.get("year");
		String strMonth = (String)param.get("month");
		String strUnit=(String)param.get("unit");
		String account=(String)param.get("evaluateAccount");
		
		List<Criterion> criterions=new ArrayList<Criterion>();
		
		if(year!=null&&!"".equals(year.trim())){
			criterions.add(Restrictions.eq("year", year));
		}
		if(strMonth!=null&&!"".equals(strMonth.trim())){
			Integer month= Integer.valueOf((String)param.get("month"));
			criterions.add(Restrictions.eq("month", month));
		}
		if(strUnit!=null&&!"".equals(strUnit.trim())){
			Integer unit= Integer.valueOf(strUnit);
			criterions.add(Restrictions.eq("unit", unit));
		}
		if(account!=null&&!"".equals(account.trim())){
			criterions.add(Restrictions.eq("evaluateAccount", account));
		}
		
		return criterions;
	}

	@Override
	public ProjectionList getProjections(Map param) {
		
		String report = (String)param.get("esReport");
		
		if("0".equals(report)){
			ProjectionList projectionList= Projections.projectionList().add(Property.forName("score").avg().as("score"))
			.add(Property.forName("year").group().as("year"))
			.add(Property.forName("unit").group().as("unit"));
			return projectionList;
		}
		
		return null;
	}

}
