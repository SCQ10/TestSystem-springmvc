package com.test.bean;

public class Admin {
	
	private Integer id;//管理员编号
	private String name;//管理员用户名
	private String password;//密码
	public String code;
	public Admin() {

	}
	public Admin(Integer id, String name, String password, String code) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.code = code;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
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
	@Override
	public String toString() {
		return "Admin [id=" + id + ", name=" + name + ", password=" + password
				+ "]";
	}
	
}
