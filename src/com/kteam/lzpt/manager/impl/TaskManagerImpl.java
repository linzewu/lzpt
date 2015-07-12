package com.kteam.lzpt.manager.impl;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.kteam.lzpt.entity.Task;
import com.kteam.lzpt.entity.TaskProcess;
import com.kteam.lzpt.manager.ITaskManager;

public class TaskManagerImpl extends HibernateDaoSupport implements
		ITaskManager {

	@Override
	public void addTask(Task task) {
		this.getHibernateTemplate().save(task);
	}

	@Override
	public void modifyTask(Task task) {
		this.getHibernateTemplate().update(task);
	}

	@Override
	public void deleteTask(String id) {
		this.getHibernateTemplate().delete(
				this.getHibernateTemplate().get(Task.class, id));
	}

	@Override
	public Task getTaskById(String taskId) {

		Task task = this.getHibernateTemplate().get(Task.class, taskId);

		return task;
	}

	@Override
	public List<Task> getTaskByTemplate(final Task task, final int pageSize,
			final int pageNumber) {

		List<Task> tasks = this.getHibernateTemplate().execute(
				new HibernateCallback<List<Task>>() {

					@Override
					public List<Task> doInHibernate(Session session)
							throws HibernateException, SQLException {

						String sql = "";

						if (task.isOver()) {
							sql = "From Task t where t.workItem.id=:workItemId and t.status=2 order by t.status asc t.updateTime desc ";
						} else {
							sql = "From Task t where t.workItem.id=:workItemId  order by  t.updateTime desc ";
						}

						Query query = session
								.createQuery(sql)
								.setFirstResult((pageNumber - 1) * pageSize)
								.setMaxResults(pageSize)
								.setParameter("workItemId",
										task.getWorkItem().getId());

						@SuppressWarnings("unchecked")
						List<Task> tasks = query.list();
						return tasks;
					}
				});
		return tasks;
	}

	@Override
	public Integer getTaskTotal(final Task task) {

		final String sql = "select count(*) from Task t where t.workItem.id=:workItemId";

		Integer total = this.getHibernateTemplate().execute(
				new HibernateCallback<Integer>() {

					@Override
					public Integer doInHibernate(Session session)
							throws HibernateException, SQLException {

						Long total = (Long) session
								.createQuery(sql)
								.setParameter("workItemId",
										task.getWorkItem().getId())
								.uniqueResult();

						return total.intValue();
					}
				});

		return total;
	}

	@Override
	public List<Task> getTaskProcessByUnitId(final String unitId,
			final int processState) {

		final String sql = "select t from Task t  left join t.tasksProcess tp where tp.unit.id=:unitId and t.status!=0 and tp.processState=:processState";

		List<Task> tasks = this.getHibernateTemplate().execute(
				new HibernateCallback<List<Task>>() {

					@Override
					public List<Task> doInHibernate(Session session)
							throws HibernateException, SQLException {

						@SuppressWarnings("unchecked")
						List<Task> tasks = session.createQuery(sql)
								.setParameter("unitId", unitId)
								.setParameter("processState", processState)
								.list();

						return tasks;
					}

				});
		return tasks;
	}

	@Override
	public void modifyTaskProcess(TaskProcess taskProcess) {
		this.getHibernateTemplate().update(taskProcess);
	}

	@Override
	public TaskProcess getUnitTaskProcessByTaskId(final String unitId,
			final String taskId) {

		TaskProcess tp = this.getHibernateTemplate().execute(
				new HibernateCallback<TaskProcess>() {

					@Override
					public TaskProcess doInHibernate(Session session)
							throws HibernateException, SQLException {

						TaskProcess tp = (TaskProcess) session
								.createQuery(
										"From TaskProcess tp where tp.unit.id=:uid and tp.task.id=:taskId")
								.setParameter("uid", unitId)
								.setParameter("taskId", taskId).uniqueResult();

						return tp;
					}

				});

		return tp;
	}

	@Override
	public List<TaskProcess> getTaskProcessByWorkItem(final String workItemId,
			final int processState) {

		final String sql = "From TaskProcess tp where tp.processState=:processState and tp.task.workItem.id=:workItemId order by tp.task.workItem.id,tp.processDate desc";

		List<TaskProcess> tp = this.getHibernateTemplate().execute(
				new HibernateCallback<List<TaskProcess>>() {

					@Override
					public List<TaskProcess> doInHibernate(Session session)
							throws HibernateException, SQLException {

						@SuppressWarnings("unchecked")
						List<TaskProcess> tasks = session.createQuery(sql)
								.setParameter("workItemId", workItemId)
								.setParameter("processState", processState)
								.list();

						return tasks;
					}

				});
		return tp;

	}

	@Override
	public TaskProcess getTaskProcessByid(String id) {

		TaskProcess tp = this.getHibernateTemplate()
				.load(TaskProcess.class, id);

		return tp;
	}

	@Override
	public List<Object> getUnitFileByKey(final String unitId) {

		List<Object> files = this.getHibernateTemplate().execute(
				new HibernateCallback<List<Object>>() {

					@Override
					public List<Object> doInHibernate(Session session)
							throws HibernateException, SQLException {
						String sql = "Select tp.processfilesJson,tp.processDate From TaskProcess tp where tp.unit.id=:unitId";
						
						sql+=" order by  processDate desc";

						List<Object> files = session.createQuery(sql)
								.setParameter("unitId", unitId).list();

						return files;
					}

				});

		return files;
	}

	@Override
	public List<Object> getUnitFileByKey(final String unitId,
			final Date startTime, final Date endTime) {
		List<Object> files = this.getHibernateTemplate().execute(
				new HibernateCallback<List<Object>>() {

					@Override
					public List<Object> doInHibernate(Session session)
							throws HibernateException, SQLException {

						String sql = "Select tp.processfilesJson,tp.processDate From TaskProcess tp where tp.unit.id=:unitId";

						if (startTime != null) {
							sql += " and tp.processDate>=:startTime";
						}

						if (endTime != null) {
							sql += " and tp.processDate<=:endTime";
						}
						
						sql+=" order by  processDate desc";

						Query query = session.createQuery(sql);

						query.setParameter("unitId", unitId);

						if (startTime != null) {
							query.setParameter("startTime", startTime);
						}
						if (endTime != null) {
							query.setParameter("endTime", endTime);
						}

						List<Object> files = query.list();

						return files;
					}

				});

		return files;
	}

	@Override
	public List<Task> getOverdueTaskByTime(int day, final int type)
			throws ParseException {

		Calendar calendar = Calendar.getInstance();
		Date now = new Date();
		calendar.setTime(now);

		calendar.add(Calendar.DAY_OF_MONTH, 1);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		String strDay = sdf.format(calendar.getTime());

		Date date = sdf.parse(strDay);

		calendar.setTime(date);

		calendar.add(Calendar.DAY_OF_MONTH, day);

		final Date overdueDate = calendar.getTime();

		List<Task> tasks = this.getHibernateTemplate().execute(
				new HibernateCallback<List<Task>>() {

					@Override
					public List<Task> doInHibernate(Session session)
							throws HibernateException, SQLException {
						String sql;
						if (type == ITaskManager.ENDDATE_TYPE) {
							sql = "From Task task where task.endDate<=:overdate and task.endDate>:date and task.status=1";
						} else {
							sql = "From Task task where task.lastDate<=:overdate and task.lastDate>:date and task.status=1";
						}

						Query query = session.createQuery(sql)
								.setParameter("overdate", overdueDate)
								.setParameter("date", new Date());

						return query.list();
					}
				});

		return tasks;
	}

	@Override
	public List<TaskProcess> getTaskProcess(final int processState,
			final int pageSize, final int pageNumber) {

		final String sql = "From TaskProcess tp where tp.processState>=:processState order by tp.task.workItem.id,tp.updateTime desc";

		List<TaskProcess> tp = this.getHibernateTemplate().execute(
				new HibernateCallback<List<TaskProcess>>() {

					@Override
					public List<TaskProcess> doInHibernate(Session session)
							throws HibernateException, SQLException {

						@SuppressWarnings("unchecked")
						List<TaskProcess> tasks = session.createQuery(sql)
								.setParameter("processState", processState)
								.setFetchSize(pageSize)
								.setMaxResults(pageNumber).list();

						return tasks;
					}

				});
		return tp;

	}

	@Override
	public List<TaskProcess> getTaskProcessByState(final int processState) {
		final String sql = "From TaskProcess tp where tp.processState=:processState order by tp.task.workItem.id,tp.updateTime desc";

		List<TaskProcess> tp = this.getHibernateTemplate().execute(
				new HibernateCallback<List<TaskProcess>>() {

					@Override
					public List<TaskProcess> doInHibernate(Session session)
							throws HibernateException, SQLException {

						@SuppressWarnings("unchecked")
						List<TaskProcess> tasks = session.createQuery(sql)
								.setParameter("processState", processState)
								.list();

						return tasks;
					}

				});
		return tp;
	}

	public List getYearCheck(int year) {
		List list = new ArrayList();
		String strSql = "select cw.c_wname c_wname,avg(tp.c_systemScore) csc,avg(tp.c_score) cs, avg(tp.c_systemScore) * 0.4 + avg(c_score) * 0.6 csp from tm_taskprocess tp,tm_task tt,tm_workarchive cw  where tp.c_processState = 2 and tt.c_status >= 1 and tp.task_id = tt.c_id and cw.c_id= tp.unit_id ";
		if (year > 0) {
			strSql = strSql + " and YEAR(tt.c_endDate) = " + year;
		}

		final String sql = strSql + " group by c_wname";
		list = this.getHibernateTemplate().execute(
				new HibernateCallback<List>() {

					@Override
					public List doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session.createSQLQuery(sql)
								.setResultTransformer(
										Transformers.ALIAS_TO_ENTITY_MAP);
						List li = query.list();
						return li;
					}

				});
		return list;
	}

	public List getYearOfWorkItemAvg(final int year) {
		List list = new ArrayList();
		final String strSql = "SELECT t0.wname,sum(t0.dflzjs) dflzjs,sum(t0.ajcc) ajcc,sum(t0.jfhzfjcgz) jfhzfjcgz,sum(t0.xjhzhgz) xjhzhgz FROM (SELECT cw.c_wname wname,AVG(CASE w.c_name WHEN '党风廉政建设' THEN tp.c_score ELSE 0 END) 'dflzjs',AVG(CASE w.c_name WHEN '案件查处' THEN tp.c_score ELSE 0 END) 'ajcc',AVG(CASE w.c_name WHEN '纠风和执法监察工作' THEN tp.c_score ELSE 0 END) 'jfhzfjcgz',AVG(CASE w.c_name WHEN '宣教和综合工作' THEN tp.c_score ELSE 0 END) 'xjhzhgz' FROM tm_taskprocess tp , tm_task tt,tm_workarchive cw,tm_workitem w  where tp.task_id = tt.c_id AND cw.c_id= tp.unit_id AND w.c_id=tt.workItem_id  AND YEAR(tt.c_endDate)=:year GROUP BY tp.unit_id,w.c_name) t0 group by wname";
		list = this.getHibernateTemplate().execute(
				new HibernateCallback<List>() {
					@Override
					public List doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session.createSQLQuery(strSql)
								.setResultTransformer(
										Transformers.ALIAS_TO_ENTITY_MAP);
						query.setParameter("year", year);
						List li = query.list();
						return li;
					}

				});
		return list;
	}

}
