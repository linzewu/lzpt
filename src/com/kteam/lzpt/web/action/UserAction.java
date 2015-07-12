package com.kteam.lzpt.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Hibernate;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import com.kteam.lzpt.common.DateJsonValueProcessor;
import com.kteam.lzpt.common.MD5Encrypt;
import com.kteam.lzpt.entity.Role;
import com.kteam.lzpt.entity.User;
import com.kteam.lzpt.manager.IUserManager;
import com.kteam.lzpt.manager.impl.UserManagerImpl;

public class UserAction extends BaseAction {

	public static final String start = "******";

	// 用户管理
	private IUserManager userManager;

	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public IUserManager getUserManager() {
		return userManager;
	}

	public void setUserManager(IUserManager userManager) {
		this.userManager = userManager;
	}

	// 查询用户
	public void queryUsers() {

		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw;
			pw = response.getWriter();
			JsonConfig config = new JsonConfig();
			// 转换日期格式
			config.registerJsonValueProcessor(Date.class,
					new DateJsonValueProcessor());
			List<User> users = userManager.getUsersByUser(user, rows, page);

			// 默认查询出六个星号
			for (User user : users) {
				user.setPassword(UserAction.start);
			}

			Map<String, Object> jsonMap = new HashMap<String, Object>();

			jsonMap.put("total", userManager.getUsersTotal(user));
			jsonMap.put("rows", users);

			JSONObject jo = JSONObject.fromObject(jsonMap, config);

			pw.print(jo.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	/**
	 * 添加用户
	 */
	public void addUser() {
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = null;

		try {
			pw = response.getWriter();

			List<Role> roles = new ArrayList<Role>();

			if ((user.getRoleid() != null)) {
				String[] roleids = user.getRoleid().split(",");
				for (String id : roleids) {
					Role role = new Role();
					role.setId(id.trim());
					roles.add(role);

				}
			}

			String password = user.getPassword();

			password = MD5Encrypt.encodingMD5(password);

			user.setPassword(password);

			user.setCreateTime(new Date());
			user.setUpdateTime(new Date());
			user.setRoles(roles);
			this.getUserManager().addUser(user);
			pw.print("succeed");
		} catch (Exception e) {
			log.error("添加用户出错", e);
			if (pw != null) {
				pw.print("error");
			}
		}

	}

	/**
	 * 修改用户
	 */
	public void modifyUser() {
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = null;

		try {
			pw = response.getWriter();

			List<Role> roles = new ArrayList<Role>();

			if ((user.getRoleid() != null)) {
				String[] roleids = user.getRoleid().split(",");
				for (String id : roleids) {
					Role role = new Role();
					role.setId(id.trim());
					roles.add(role);
				}
			}

			String password = user.getPassword();

			if (!this.start.equals(password)) {
				String newPassword = MD5Encrypt.encodingMD5(password);
				user.setPassword(newPassword);
			} else {

				UserManagerImpl umi = (UserManagerImpl) this.getUserManager();

				String oldPassword = umi.getPasswodById(user.getId());

				user.setPassword(oldPassword);
			}

			user.setUpdateTime(new Date());
			user.setRoles(roles);
			this.getUserManager().modifyUser(user);
			pw.print("succeed");
		} catch (Exception e) {
			log.error("修改用户", e);
			if (pw != null) {
				pw.print("error");
			}
		}

	}

	/**
	 * 验证用户名的唯一性
	 */
	public void validateUser() {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		try {

			pw = response.getWriter();
			int count = userManager.validateUserName(user.getUserName());
			if (count > 0) {
				pw.print("false");
			} else {
				pw.print("true");
			}
		} catch (Exception e) {
			pw.print("false");
			log.error("validateUserName(): " + e.toString());

		} finally {
			pw.close();
		}
	}

	/**
	 * 登陆
	 * 
	 * @return
	 * @throws Exception
	 */
	public String login() throws Exception {
		if (user != null && user.getUserName() != null
				&& user.getPassword() != null&&checkNumber()) {

			// 加密
			try {
				String password = MD5Encrypt.encodingMD5(user.getPassword());

				user.setPassword(password);

			} catch (Exception e) {
				log.error("加密异常", e);
				throw e;
			}

			User loginUser = this.userManager.login(user);

			// 登录成功
			if (loginUser != null
					&& loginUser.getState() == User.STATE_ACTIVATING) {

				HttpServletRequest request = ServletActionContext.getRequest();

				HttpSession session = request.getSession();

				Hibernate.initialize(loginUser.getRoles());

				for (Role role : loginUser.getRoles()) {
					role.setMenus(null);
				}

				loginUser.setDefaultRole(loginUser.getRoles().get(0));

				session.setAttribute("user", loginUser);
				session.setAttribute("loginMessage", "");
				String gotoPage=(String)session.getAttribute("gotoPage");
				
				if(gotoPage!=null&&!"".equals(gotoPage)){
					ServletActionContext.getResponse().sendRedirect(gotoPage);
					return null;
				}

				return "loginSuccess";

			} else {
				
				ServletActionContext.getRequest().getSession().setAttribute("loginMessage", "l2");
				// 登录失败
				return "indexlogin";
			}
		} else {
			// 登录失败
			return "toLogin";
		}

	}
	
	private boolean checkNumber(){
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String rand = (String)session.getAttribute("rand");
		
		String reqRand = request.getParameter("rand");
		
		
		if(rand==null){
			session.setAttribute("loginMessage", "l1");
			return false;
		}
		
		if(rand.equals(reqRand)){
			session.setAttribute("loginMessage", "");
			return true;
		}else{
			session.setAttribute("loginMessage", "l1");
			return false;
		}
	}

	public String logout() {

		HttpServletRequest request = ServletActionContext.getRequest();

		HttpSession session = request.getSession();

		session.removeAttribute("user");
		session.invalidate();

		return "indexlogin";
	}

	public void validatePassword() throws Exception {

		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;

		try {
			pw = response.getWriter();

			HttpServletRequest request = ServletActionContext.getRequest();

			HttpSession session = request.getSession();

			User user = (User) session.getAttribute("user");

			if (user != null) {

				String myPassword = request.getParameter("password");

				if (myPassword != null) {

					myPassword = MD5Encrypt.encodingMD5(myPassword);

				}

				String userName = user.getUserName();

				UserManagerImpl umi = (UserManagerImpl) this.getUserManager();

				String password = umi.getPasswordByUserName(userName);
				
				
				if (password.equals(myPassword)) {
					pw.print("true");
				}
				else{
					pw.print("false");
				}
			}
			
		} catch (Exception e) {
			
			if(pw!=null){
				pw.close();
			}
		
			log.error("获取密码异常！", e);
			throw e;
		}
	}
	
	
	public void updatePassword() throws Exception{
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;

		try {
			pw = response.getWriter();

			HttpServletRequest request = ServletActionContext.getRequest();

			HttpSession session = request.getSession();

			User user = (User) session.getAttribute("user");

			if (user != null) {

				String myPassword = request.getParameter("newPassword");

				if (myPassword != null) {

					myPassword = MD5Encrypt.encodingMD5(myPassword);

				}

				String userName = user.getUserName();

				UserManagerImpl umi = (UserManagerImpl) this.getUserManager();

				Integer i = umi.updatePasswordByPassword(userName, myPassword);
				
				log.info("更新密码成功受影响行数"+i);
				
				if (i>0) {
					pw.print("success");
				}
				else{
					pw.print("failure");
				}
			}
			
		} catch (Exception e) {
			
			if(pw!=null){
				pw.close();
			}
		
			log.error("获取密码异常！", e);
			throw e;
		}
	}

}
