package com.test.service;

import java.util.List;

import com.test.bean.User;
import com.test.dao.UserDao;

public class UserService {
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	public boolean nameIsValidated(String name){
		return userDao.getUserByName(name)==null;
	}
	public boolean passwordIsRight(String name, String password) {
		return userDao.checkAll(name,password)==null;
	}
	public User get(String name) {
		return userDao.getUserByName(name);
	}
	public boolean addUser(User user){
		userDao.addUser(user);
		return userDao.getUserByName(user.getName())!=null;
	}
	public List<User> getAll(){
		return userDao.getAll();
	}
	public int deleteUser(Integer id){
		return userDao.deleteUser(id);
	}
	public void updateUser(User user){
		userDao.updateUser(user);
	}
	
}
