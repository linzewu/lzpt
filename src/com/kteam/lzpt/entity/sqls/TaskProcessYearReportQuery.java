package com.kteam.lzpt.entity.sqls;

import java.util.Map;

public class TaskProcessYearReportQuery extends SQLAbstract {

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
		
		String sql="select t.*,tu.c_id as 'be.id',tu.c_score as 'be.score' from (SELECT YEAR(t.c_startDate) as 'be.year',unit_id as 'be.unitId' ,AVG(c_systemScore) avgScore FROM tm_taskprocess as tp LEFT JOIN tm_task t ON t.c_id=tp.task_id  where 1=1 "+whereSql+"  GROUP BY YEAR(t.c_startDate),unit_id) as t LEFT JOIN tm_unityearscore as tu ON t.`be.unitId`=tu.c_unitid and  t.`be.year`=tu.c_year";
		
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
		String sql=" select count(*) from (SELECT YEAR(t.c_startDate) as year,unit_id as unit  ,AVG(c_systemScore) avgScore FROM tm_taskprocess as tp LEFT JOIN tm_task t ON t.c_id=tp.task_id  where 1=1 "+whereSql+"  GROUP BY YEAR(t.c_startDate),unit_id )  as t ";
		return sql;
	}

}
