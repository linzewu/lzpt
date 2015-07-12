package com.kteam.lzpt.entity.sqls;

import java.util.Map;

public class KicReportQuery extends SQLAbstract {

	@Override
	public String getSQL(Map param) {
		
		String level = (String)param.get("level");
		String year=(String)param.get("year");
		String whereSQL="";
		
		if(level!=null){
			String[] strs=level.split(",");
			whereSQL=" and c_level in (";
			int index=0;
			for(String str:strs){
				whereSQL+=str;
				if(index!=strs.length-1){
					whereSQL+=",";
				}
				index++;
			}
			whereSQL+=")";
		}
		
		if(year!=null){
			whereSQL+=" and YEAR(c_handInDate)="+year+" ";
		}
		
		String sql="SELECT c_year AS year,sum(c_handInMoney) AS moneyCount,COUNT(DISTINCT c_specialManageId) AS peopleCount FROM(SELECT YEAR(c_handInDate) AS c_year,c_handInMoney,c_specialManageId	FROM	tm_kickbacks AS t1 LEFT JOIN tm_specialmanage t2 ON t1.c_specialManageId = t2.c_id WHERE 1 = 1 "+
				whereSQL+" ) AS t GROUP BY c_year ";
		
		return sql;
	}

	@Override
	public String getCountSQL(Map param) {
		return null;
	}

}
