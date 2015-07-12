package com.kteam.lzpt.entity.criterions;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Restrictions;

public class ComplainCriterion extends CriterionAbstract {

	public List<Criterion> getCriterions(Map param) {
		
		String state=(String) param.get("state");
		List<Criterion> criterions=new ArrayList<Criterion>();
		
		if(state!=null&&!"".equals(state.trim())){
			String[] states = state.split(",");
			Integer[] is=new Integer[states.length];
			int i=0;
			for(String s:states){
				is[i]=Integer.parseInt(s);
				i++;
			}
			criterions.add(Restrictions.in("state",  is));
		}
		
		return criterions;
	}

	@Override
	public ProjectionList getProjections(Map param) {
		return null;
	}

}
