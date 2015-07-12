package com.kteam.lzpt.entity.criterions;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.ProjectionList;

public abstract class CriterionAbstract {
	
	public abstract List<Criterion> getCriterions(Map param);
	
	public abstract ProjectionList getProjections(Map param);

}
