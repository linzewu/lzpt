package com.kteam.lzpt.entity.sqls;

import java.util.Map;

public class TaskProcessReportQuery extends SQLAbstract {

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
		
		String sql="SELECT YEAR(t.c_startDate) as year,unit_id as unit ,workItem_id as type ,AVG(c_systemScore) avgScore FROM tm_taskprocess as tp LEFT JOIN tm_task t ON t.c_id=tp.task_id left join tm_workarchive twa on twa.c_id=tp.unit_id where 1=1 "+whereSql+"  GROUP BY YEAR(t.c_startDate),unit_id,workItem_id order by YEAR(t.c_startDate) asc,twa.c_order asc  ";
		
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
		String sql=" select count(*) from (SELECT YEAR(t.c_startDate) as year,unit_id as unit ,workItem_id as type ,AVG(c_systemScore) avgScore FROM tm_taskprocess as tp LEFT JOIN tm_task t ON t.c_id=tp.task_id  where 1=1 "+whereSql+"  GROUP BY YEAR(t.c_startDate),unit_id,workItem_id )  as t ";
		return sql;
	}

}
