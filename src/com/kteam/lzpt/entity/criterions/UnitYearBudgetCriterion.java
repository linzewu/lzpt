package com.kteam.lzpt.entity.criterions;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Restrictions;

import com.kteam.lzpt.entity.User;

public class UnitYearBudgetCriterion extends CriterionAbstract {

	@Override
	public List<Criterion> getCriterions(Map param) {
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user=(User)session.getAttribute("user");
		String roleName = user.getDefaultRole().getRoleName();
		List<Criterion> cs=new ArrayList<Criterion>();
		
		if(!"纪委".equals(roleName)){
			cs.add(Restrictions.eq("unitId", user.getUnitId()));
		}
		
		String year=(String)param.get("year");
		String unitId=(String)param.get("unitId");
		
		if(year!=null){
			cs.add(Restrictions.eq("year", year));
		}
		if(unitId!=null){
			cs.add(Restrictions.eq("unitId", unitId));
		}
		return cs;
	}

	@Override
	public ProjectionList getProjections(Map param) {
		return null;
	}

}
