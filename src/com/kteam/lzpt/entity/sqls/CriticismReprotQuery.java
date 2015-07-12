package com.kteam.lzpt.entity.sqls;

import java.util.Map;

public class CriticismReprotQuery extends SQLAbstract {

	@Override
	public String getSQL(Map param) {
	String whereSql="";
	
	String year=(String)param.get("year");
	String month=(String)param.get("month");
	String unit=(String)param.get("unit");
	
	if(year!=null){
		whereSql+=" and year=:year";
	}
	
	if(month!=null){
		whereSql+=" and month=:month";
	}
	
	if(unit!=null){
		whereSql+=" and unit=:unit";
	}
	
	
	
	String sql="SELECT COUNT(*) as countNum,unit,year,month FROM (SELECT year(c_startTime) as year,MONTH(c_startTime) as month,c_unit as unit from tm_criticism) t where 1=1 "+
			whereSql+" GROUP BY t.unit,t.year,t.month";
	
		
		return sql;
	}

	@Override
	public String getCountSQL(Map param) {
		// TODO Auto-generated method stub
		return null;
	}

}
