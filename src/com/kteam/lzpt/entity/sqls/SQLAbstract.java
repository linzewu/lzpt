package com.kteam.lzpt.entity.sqls;

import java.util.Map;

public abstract class SQLAbstract {
	
	public abstract String getSQL(Map param);
	
	public abstract String getCountSQL(Map param);

}
