package com.kteam.lzpt.entity.sqls;

import java.util.Map;

public class TaskProcessScoreQuery extends SQLAbstract {

	@Override
	public String getSQL(Map param) {
		
		String year=(String)param.get("year");
		String unit=(String)param.get("unit");
		
		String whereSql="";
		
		if(year!=null){
			whereSql+=" and year(t.c_startDate)=:year";
		}
		
		if(unit!=null){
			whereSql+=" and tp.unit_id=:unit";
		}
		
		String sql="SELECT year(t.c_startDate) as year, tp.unit_id as unit,t.workItem_id as type,t.c_title as title,concat(date_format(t.c_startDate,'%Y-%m-%d'),'到',date_format(t.c_endDate,'%Y-%m-%d')) as dt , date_format(t.c_lastDate,'%Y-%m-%d') as lastDate  ,date_format(tp.c_processDate,'%Y-%m-%d') as processDate ,tp.c_systemScore as systemScore FROM tm_taskprocess as tp LEFT JOIN tm_task t ON t.c_id=tp.task_id where 1=1  "+whereSql;
		
		return sql;
	}

	@Override
	public String getCountSQL(Map param) {
		String year=(String)param.get("year");
		String unit=(String)param.get("unit");
		
		String whereSql="";
		
		if(year!=null){
			whereSql+=" and year(t.c_startDate)=:year";
		}
		
		if(unit!=null){
			whereSql+=" and tp.unit_id=:unit";
		}
		
		String sql="SELECT  count(*) FROM tm_taskprocess as tp LEFT JOIN tm_task t ON t.c_id=tp.task_id where 1=1  "+whereSql;
		
		return sql;
	}

}
