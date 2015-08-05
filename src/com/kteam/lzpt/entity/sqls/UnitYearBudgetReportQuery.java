package com.kteam.lzpt.entity.sqls;

import java.util.Map;

public class UnitYearBudgetReportQuery extends SQLAbstract {

	@Override
	public String getSQL(Map param) {
		
		String whereSql="";
		
		String year=(String)param.get("year");
		String quarter=(String)param.get("quarter");
		String unitId=(String)param.get("unitId");
		
		if(year!=null){
			whereSql+=" and tq.c_qoyear=:year ";
		}
		
		if(quarter!=null){
			whereSql+=" and tq.c_qoquarter=:quarter ";
		}
		
		if(unitId!=null){
			whereSql+=" and tq.t_waid=:unitId ";
		}
		String sql="SELECT tq.*,tu.c_year,tu.c_money*0.25 as quarterTotal,tu.c_money from tm_quarteroutlay tq LEFT JOIN tm_unityearbudget tu on tq.c_qoyear=tu.c_year and tq.t_waid = tu.c_unitId  left join tm_workarchive wa on wa.c_id=tq.t_waid  where 1=1  "+whereSql +"  order by tq.c_qoyear desc,tq.c_qoquarter asc,wa.c_order asc";
		
		return sql;
	}

	@Override
	public String getCountSQL(Map param) {
		
	String whereSql="";
		
		String year=(String)param.get("year");
		String quarter=(String)param.get("quarter");
		String unitId=(String)param.get("unitId");
		
		if(year!=null){
			whereSql+=" and tq.c_qoyear=:year ";
		}
		
		if(quarter!=null){
			whereSql+=" and tq.c_qoquarter=:quarter ";
		}
		
		if(unitId!=null){
			whereSql+=" and tq.t_waid=:unitId ";
		}
		String sql="select count(*) from (SELECT tq.*,tu.c_year,tu.c_money*0.25 as quarterTotal,tu.c_money from tm_quarteroutlay tq LEFT JOIN tm_unityearbudget tu on tq.c_qoyear=tu.c_year and tq.t_waid = tu.c_unitId  where 1=1  "+whereSql +") as tt";
		
		return sql;
	}

}
