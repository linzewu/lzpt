package com.kteam.lzpt.manager.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.kteam.lzpt.entity.User;
import com.kteam.lzpt.manager.IUserManager;

public class UserManagerImpl extends HibernateDaoSupport implements
		IUserManager {

	@Override
	public void addUser(User user) {

		this.getHibernateTemplate().save(user);
	}

	@Override
	public void modifyUser(User user) {

		this.getHibernateTemplate().update(user);

	}

	@Override
	public void deleteUser(String id) {

		this.getHibernateTemplate().delete(id);

	}

	@Override
	public List<User> getUsers() {

		String sql = "From User user";

		List<User> users = this.getHibernateTemplate().find(sql);

		return users;
	}

	@Override
	public List<User> getUsersByUser(final User user, final int pageSize,
			final int pageNumber) {
		final Map<String, Object> paramMap = new HashMap<String, Object>();
		String whereSql = " where 1=1 ";
		if (null != user) {
			if (null != user.getName() && !("".equals(user.getName()))) {
				whereSql = whereSql + " and user.name like :uname";
				paramMap.put("uname", "%" + user.getName() + "%");
			}

		}
		final String sql = "From User user" + whereSql;

		List<?> list = this.getHibernateTemplate().execute(
				new HibernateCallback<List<?>>() {

					@Override
					public List<?> doInHibernate(Session session)
							throws HibernateException, SQLException {

						List<?> users = null;
						Query query = session.createQuery(sql);

						for (String param : paramMap.keySet()) {
							query.setParameter(param, paramMap.get(param));
						}
						users = query
								.setFirstResult((pageNumber - 1) * pageSize)
								.setMaxResults(pageSize).list();

						return users;
					}

				});
		return (List<User>) list;
	}

	@Override
	public User getUserById(String id) {

		User user = this.getHibernateTemplate().load(User.class, id);

		return user;
	}

	public String getPasswodById(String id) {

		User user = this.getHibernateTemplate().load(User.class, id);

		String password = user.getPassword();

		this.getSession().clear();

		return password;

	}

	@Override
	public int getUsersTotal(User user) {

		final Map<String, Object> paramMap = new HashMap<String, Object>();
		String whereSql = " where 1=1 ";
		if (null != user) {
			if (null != user.getName() && !("".equals(user.getName()))) {
				whereSql = whereSql + " and user.name like :uname";
				paramMap.put("uname", "%" + user.getName() + "%");
			}

		}

		final String sql = "SELECT COUNT(*) FROM User user" + whereSql;

		Integer total = this.getHibernateTemplate().execute(
				new HibernateCallback<Integer>() {

					@Override
					public Integer doInHibernate(Session session)
							throws HibernateException, SQLException {

						Long total = null;
						Query query = session.createQuery(sql);
						for (String param : paramMap.keySet()) {
							query.setParameter(param, paramMap.get(param));
						}
						total = (Long) query.uniqueResult();

						return total.intValue();
					}

				});

		return total;
	}

	/**
	 * 验证用户名的唯一性
	 * 
	 * @param user
	 *            用户对象
	 * @return int 记录数
	 * @throws Exception
	 */
	public int validateUserName(String userName) {
		int count = (Integer) this
				.getHibernateTemplate()
				.findByNamedParam("From User where userName = :username",
						"username", userName).size();
		return count;
	}

	public String getPasswordByUserName(final String userName) {

		final String sql = "from User u where  u.userName =:username";
		User user = this.getHibernateTemplate().execute(
				new HibernateCallback<User>() {

					@Override
					public User doInHibernate(Session session)
							throws HibernateException, SQLException {

						User user = (User) session.createQuery(sql)
								.setParameter("username", userName)
								.uniqueResult();

						return user;
					}
				});
		return user.getPassword();
	}

	public int updatePasswordByPassword(final String userName,
			final String password) {

		final String sql = "update tm_user set c_password=:password where c_userName=:userName";

		Integer i = this.getHibernateTemplate().execute(new HibernateCallback<Integer>() {

			@Override
			public Integer doInHibernate(Session session)
					throws HibernateException, SQLException {

				Integer i = session.createSQLQuery(sql)
						.setParameter("userName",userName)
						.setParameter("password", password)
						.executeUpdate();

				return i;
			}
		});
		
		
		return i;
	}

	/**
	 * 用户登录验证
	 * 
	 * @param user
	 *            用户对象
	 * @return user 用户对象
	 * @throws Exception
	 */

	public User login(User user) {
		User users = null;
		List list = this
				.getHibernateTemplate()
				.findByNamedParam(
						" From User where userName = :username and password = :password",
						new String[] { "username", "password" },
						new Object[] { user.getUserName(), user.getPassword() });
		if (null != list && list.size() > 0) {
			users = (User) list.iterator().next();
		}

		return users;
	}

}
