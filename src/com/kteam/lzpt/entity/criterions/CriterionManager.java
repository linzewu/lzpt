package com.kteam.lzpt.entity.criterions;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.ProjectionList;

public class CriterionManager {
	
	protected static Log log = LogFactory.getLog(CriterionManager.class);
	
	private static CriterionManager criterionManager;
	
	private  CriterionManager(){}
	
	public static CriterionManager getInstance(){
		if(criterionManager==null){
			criterionManager=new CriterionManager();
		}
		return criterionManager;
	}
	

	private String packName = this.getClass().getPackage().getName();

	public List<Criterion> getCriterionsByActionType(String queryType,Map param){

		String className = formaterActionType(queryType);

		CriterionAbstract ca=null;
		try {
			ca = (CriterionAbstract)this.getClass().getClassLoader()
					.loadClass(packName + "." + className).newInstance();
		} catch (Exception e) {
			log.error("无法根据quryType获取Criterions",e);
			return null;
		}
		return ca.getCriterions(param);
	}
	
	public ProjectionList getProjectionsByActionType(String queryType,Map param) {

		String className = formaterActionType(queryType);

		CriterionAbstract ca=null;
		try {
			ca = (CriterionAbstract)this.getClass().getClassLoader()
					.loadClass(packName + "." + className).newInstance();
		} catch (Exception e) {
			log.error("无法根据quryType获取CriterionAbstract",e);
		} 
		
		return ca.getProjections(param);
	}
	
	

	private String formaterActionType(String actionType) {
		if (actionType != null && !"".equals(actionType.trim())) {
			String first = actionType.substring(0, 1).toUpperCase();
			if (actionType.length() == 1) {
				actionType = first;
			} else {
				String last = actionType.substring(1, actionType.length());
				actionType = first + last;
			}
		}
		return actionType;
	}

}
