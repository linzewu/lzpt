package com.kteam.lzpt.entity.sqls;

import java.util.Map;

public class ValidateUnitYearBudget extends SQLAbstract {

	@Override
	public String getSQL(Map param) {
		String  sql="select CASE WHEN count(*)=0 THEN 'true' ELSE 'false' END AS isok  FROM tm_unityearbudget where c_unitId=:unitId  and c_year=:year";
		String id=(String)param.get("id");
		if(id!=null){
			sql+=" and c_id!=:id";
		}
		return sql;
	}

	@Override
	public String getCountSQL(Map param) {
		return null;
	}

	
}
