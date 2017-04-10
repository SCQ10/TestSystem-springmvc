package com.test.bean;

import java.util.Date;

public class User {
	private Integer id;
	private String name;
	private String password;
	private String phone;
	private boolean flag;
	private Date regDate;
	public User(){
		
	}
	
	public User(Integer id, String name, String password, String phone,
			boolean flag ,Date regDate) {
		this.id = id;
		this.name = name;
		this.password = password;
		this.phone = phone;
		this.flag = flag;
		this.regDate=regDate;
	}

	@Override
	public String toString() {
		return this.name;
	}

	public boolean equals(Object obj){
		if(obj == null){
			return false;
		}
		if(obj == this){
			return true;
		}
		if(obj instanceof User){
			User user = (User) obj;
			return this.id == user.id;
		}
		return false;
	}
	public int hashCode(){
		return id;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
}
