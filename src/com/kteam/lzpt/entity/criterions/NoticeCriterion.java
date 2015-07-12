package com.kteam.lzpt.entity.criterions;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Restrictions;

public class NoticeCriterion extends CriterionAbstract {

	public List<Criterion> getCriterions(Map param) {
		List<Criterion> criterions=new ArrayList<Criterion>();
		criterions.add(Restrictions.eq("isAvail", "Y"));
		return criterions;
	}

	public ProjectionList getProjections(Map param) {
		// TODO Auto-generated method stub
		return null;
	}

}
