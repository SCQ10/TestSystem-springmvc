package com.test.service;

import com.test.bean.Admin;
import com.test.dao.AdminDao;

public class AdminService {
	
	private AdminDao adminDao;
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
	public boolean nameIsValidated(String name){
		return adminDao.getAdminByName(name)==null;
	}
	public boolean passwordIsRight(String name, String password) {
		return adminDao.checkAll(name,password)==null;
	}
	public Admin get(String name) {
		return adminDao.getAdminByName(name);
	}
}
