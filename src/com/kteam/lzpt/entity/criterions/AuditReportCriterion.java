package com.kteam.lzpt.entity.criterions;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Restrictions;

public class AuditReportCriterion extends CriterionAbstract {

	public List<Criterion> getCriterions(Map param) {
		
		Integer auditType=Integer.parseInt((String)param.get("auditType"));
		String unitName=(String) param.get("unitName");
		String userName=(String) param.get("userName");
		List<Criterion> criterions=new ArrayList<Criterion>();		
		if(auditType!=null){
			criterions.add(Restrictions.eq("auditType", auditType));
		}
		
		if(unitName!=null&&!"".equals(unitName.trim())){
			criterions.add(Restrictions.like("unitName", "%"+unitName+"%"));
		}
		
		if(userName!=null&&!"".equals(userName.trim())){
			criterions.add(Restrictions.like("userName", "%"+userName+"%"));
		}
		
		return criterions;
	}

	@Override
	public ProjectionList getProjections(Map param) {
		return null;
	}

}
