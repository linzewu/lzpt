package com.kteam.lzpt.manager;

import java.util.List;

import com.kteam.lzpt.entity.User;

public interface IUserManager {
	
	public void addUser(User user);
	
	public void modifyUser(User user);
	
	public void deleteUser(String id);
	
	public int getUsersTotal(User user);
	
	//查询所有用户
	public List<User> getUsers();
	
	//分页查询带条件
	public List<User> getUsersByUser(User user,int pageSize,int pageNumber);
	
	//查询用户
	public User getUserById(String id);
	
	//验证用户名是否唯一
	public int validateUserName(String userName);
	
	//用户登陆
	public User login(User user);

}
