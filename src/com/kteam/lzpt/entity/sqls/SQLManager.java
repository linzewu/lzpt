package com.kteam.lzpt.entity.sqls;

import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class SQLManager {

	protected static Log log = LogFactory.getLog(SQLManager.class);

	private static SQLManager criterionManager;

	private SQLManager() {
	}

	public static SQLManager getInstance() {
		if (criterionManager == null) {
			criterionManager = new SQLManager();
		}
		return criterionManager;
	}

	private String packName = this.getClass().getPackage().getName();

	public String getSQLByQueryType(String queryType, Map param)
			throws InstantiationException, IllegalAccessException,
			ClassNotFoundException {

		String className = formaterActionType(queryType);
		SQLAbstract sa = null;

		sa = (SQLAbstract) this.getClass().getClassLoader()
				.loadClass(packName + "." + className).newInstance();
		return sa.getSQL(param);
	}

	public String getSQLCountByQueryType(String queryType, Map param)
			throws InstantiationException, IllegalAccessException,
			ClassNotFoundException {

		String className = formaterActionType(queryType);
		SQLAbstract sa = null;
		sa = (SQLAbstract) this.getClass().getClassLoader()
				.loadClass(packName + "." + className).newInstance();

		return sa.getCountSQL(param);
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
