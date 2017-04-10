package com.test.dao;

import org.hibernate.Query;

import com.test.bean.Admin;


public class AdminDao extends BaseDao {
	
	public Admin getAdminByName(String name){
		String hql="FROM Admin a WHERE a.name=?";
		Query query=getSession().createQuery(hql).setString(0,name);
		return (Admin) query.uniqueResult();
	}

	public Admin checkAll(String name, String password) {
		String hql="FROM Admin a WHERE a.name=? and a.password=?";
		Query query=getSession().createQuery(hql).setString(0, name).setString(1, password);
		return (Admin) query.uniqueResult();
	}
	
}
