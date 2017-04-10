package com.test.action;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.bean.Admin;
import com.test.service.AdminService;

@Controller
public class AdminAction {
	
	@Autowired
	private AdminService adminService;
	
	/**
	 * 验证管理员名是否存在
	 */
	@ResponseBody
	@RequestMapping("/admin-validateName")
	public String validateName(@RequestParam(value="name",required=false) String name){
		System.out.println("name:"+name);
		if(adminService.nameIsValidated(name)){
			return "1";
		}else{
			return "0";
		}
	}
	/**
	 * 验证管理员密码和name是否匹配
	 */
	@ResponseBody
	@RequestMapping("/admin-validatePassword")
	public String validatePassword(@RequestParam(value="name",required=false)String name,@RequestParam(value="password",required=false)String password,HttpSession session){
		if(!adminService.passwordIsRight(name, password)){
			Admin admin=adminService.get(name);
			session.setAttribute("admin", admin);
			return "1";
		}else{
			return "0";
		}
	
	}
	/**
	 * 管理员登录,跳转到index界面
	 */
	@RequestMapping("/admin-login")
	public String login(){
		return "index";
	}
	/**
	 * 退出登录
	 */
	@RequestMapping("/admin-exit")
	public String exit(HttpSession session){
		session.removeAttribute("admin");
		session.invalidate();
		return "login(back)";
	}
	/**
	 * checkSession
	 */
	@ResponseBody
	@RequestMapping("/admin-check")
	public String checkSession(){
		return "1";
	}
	/**
	 * 请登录
	 */
	@RequestMapping("/admin-main")
	public String relogin(){
		return "login(back)";
	}
}
