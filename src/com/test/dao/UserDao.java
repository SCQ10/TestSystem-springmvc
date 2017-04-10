package com.test.dao;

import java.util.List;

import org.hibernate.Query;

import com.test.bean.User;

public class UserDao extends BaseDao{
	public User getUserByName(String name){
		String hql="FROM User e WHERE e.name=?";
		Query query=getSession().createQuery(hql).setString(0,name);
		return (User) query.uniqueResult();
	}

	public User checkAll(String name, String password) {
		String hql="FROM User e WHERE e.name=? and e.password=?";
		Query query=getSession().createQuery(hql).setString(0, name).setString(1, password);
		return (User) query.uniqueResult();
	}
	
	public void addUser(User user){
		getSession().save(user);
	}
	
	public List<User> getAll(){
		String hql="FROM User";
		return getSession().createQuery(hql).list();
	}
	
	public int deleteUser(Integer id){
		String hql="DELETE User u WHERE u.id=?";
		int a=getSession().createQuery(hql).setInteger(0, id).executeUpdate();
		return a;
	}
	
	public void updateUser(User user){
		getSession().update(user);
	}
	
}	
