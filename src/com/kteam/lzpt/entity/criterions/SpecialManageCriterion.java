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

public class SpecialManageCriterion extends CriterionAbstract {

	@Override
	public List<Criterion> getCriterions(Map param) {
		
		HttpSession session =  ServletActionContext.getRequest().getSession();
		List<Criterion> criterions=new ArrayList<Criterion>();
		User user =(User)session.getAttribute("user");
		String roleName = user.getDefaultRole().getRoleName();
		
		if(!("纪委".equals(roleName)||"纪委工作人员".equals(roleName))){
			String unitId = user.getUnitId();
			if(unitId!=null){
				criterions.add(Restrictions.eq("unitId", unitId));
			}
		} 
		
		String name=(String)param.get("name");
		
		String unit=(String)param.get("unit");
		
		if(name!=null&&!"".equals(name)){
			criterions.add(Restrictions.like("name","%"+name+"%"));
		}
		
		if(unit!=null&&!"".equals(unit)){
			criterions.add(Restrictions.eq("unitId",unit));
		}
		
		return criterions;
	}

	@Override
	public ProjectionList getProjections(Map param) {
		// TODO Auto-generated method stub
		return null;
	}

}
