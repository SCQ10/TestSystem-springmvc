package com.test.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.bean.HistoryExam;
import com.test.bean.PaperExam;
import com.test.bean.PaperQuestion;
import com.test.bean.Question;
import com.test.bean.User;
import com.test.dao.UserDao;
import com.test.service.HistoryExamService;
import com.test.service.PaperExamService;
import com.test.service.QuestionService;
import com.test.service.UserService;

@Controller
public class UserAction{

	@Autowired
	private UserService userService;
	@Autowired
	private PaperExamService paperExamService;
	@Autowired
	private QuestionService questionService;
	@Autowired
	private HistoryExamService historyExamService;
	/**
	 * 检测用户名是否存在
	 */
	@RequestMapping("/user-validateName")
	public  @ResponseBody String validateName(@RequestParam(value="name",required=false) String name){
		if(userService.nameIsValidated(name)){
			return "1";
		}else{
			return "0";
		}
	}
	/**
	 * 检测用户名与密码是否匹配
	 */
	@RequestMapping("/user-validatePassword")
	public @ResponseBody String validatePassword(@RequestParam(value="name",required=false)String name,@RequestParam(value="password",required=false)String password,HttpSession session){
		System.out.println(name+":"+password+":"+userService.passwordIsRight(name, password));
			User user=null;
		if (!userService.passwordIsRight(name, password)) {
			user=userService.get(name);
			session.setAttribute("user", user);
			return "1";
		}
		return "0";
	}
	/**
	 * 用户登录,准备user和paperlist跳转到前台
	 */
	@RequestMapping("/user-login")
	public String login(HttpSession session,Map<String,Object> map){
		User user=(User) session.getAttribute("user");
		List<PaperExam> paperList=paperExamService.getAll();
		List<HistoryExam> historyExams=historyExamService.getHistoryExam(user.getId());
		List<HistoryExam> historyHighScore=historyExamService.getHighScore();
		session.setAttribute("historyHighScore", historyHighScore);
		session.setAttribute("historyExams", historyExams);
		session.setAttribute("paperList", paperList);
		session.setAttribute("user", user);
		if(!user.isFlag()) {
			map.put("flag", true);
		}else {
			map.put("flag", false);
		}
		return "main";
	}
	/**
	 * 跳转到考试界面
	 * 准备试卷
	 */
	@ResponseBody
	@RequestMapping("/user-startExam")
	public String startExam(@RequestParam(value="subject",required=false)String subject,HttpSession session){
		PaperExam paperExam=paperExamService.get(subject);
		List<Question> paperQuestions=questionService.getPaperQuestions(paperExam.getId(),paperExam);
		session.setAttribute("paperQuestions", paperQuestions);
		Date sDate=new Date();
		session.setAttribute("startDate", sDate);
		return "1";
	}
	/**
	 * 离开考试系统
	 */
	@RequestMapping("/user-exitSystem")
	public String exitSystem(HttpSession session){
		session.invalidate();
		return "login";
	}
	/**
	 * 新用户注册
	 */
	@ResponseBody
	@RequestMapping("/user-register")
	public String registUser(@RequestParam(value="name",required=false)String name,@RequestParam(value="password",required=false)String password,@RequestParam(value="phone",required=false)String phone,@RequestParam(value="time",required=false)Date regDate){
		User user=new User();
		user.setName(name);
		user.setPassword(password);
		user.setPhone(phone);
		user.setFlag(false);
		user.setRegDate(regDate);
		boolean mark=userService.addUser(user);
		if(mark){
			return "1";
		}
		return "0";
	}
	/**
	 * 跳转到用户管理界面
	 */
	@RequestMapping("/user-manage")
	public String getAllUser(HttpSession session){
		List<User> users=userService.getAll();
		session.setAttribute("users", users);
		session.setAttribute("mark", 2);
		return "show";
	}
	/**
	 * 删除用户
	 */
	@RequestMapping("/user-delete")
	public String deleteUser(@RequestParam(value="id",required=false)Integer id){
		userService.deleteUser(id);
		return "redirect:/user-manage";
	}
	/**
	 * 用户修改密码
	 */
	@RequestMapping("/user-updatePassword")
	public String updateUser(@RequestParam(value="password",required=false)String password,HttpSession session){
		User user=(User) session.getAttribute("user");
		user.setPassword(password);
		userService.updateUser(user);
		session.setAttribute("user", user);
		return "redirect:/user-login";
	}
	/**
	 * 保存用户答案
	 */
	@ResponseBody
	@RequestMapping("/user-checkAnswer")
	public String checkAnswer(@RequestParam(value="sld",required=false)int id,@RequestParam(value="userAnswer",required=false)int userAnswer,HttpSession session){
		@SuppressWarnings("unchecked")
		List<Question> list=(List<Question>) session.getAttribute("paperQuestions");
		List<Integer> rightAnswer=list.get(id-1).getAnswers();
		System.out.println(rightAnswer.contains(userAnswer));
		if(rightAnswer.contains(userAnswer)){
			if(id==1){
				session.setAttribute("correct", true);
			}
			session.setAttribute("correct", false);
			return "1";
		}else{
			return "0";
		}
	}
	/**
	 * 保存用户考试成绩
	 */
	@ResponseBody
	@RequestMapping("/user-saveExamRecord")
	public String saveExamRecord(@RequestParam(value="score",required=false)int score,@RequestParam(value="time",required=false)Date endTime,HttpSession session){
		System.out.println("haha");
		HistoryExam historyExam=new HistoryExam();
		User user=(User)session.getAttribute("user");
		Date startTime=(Date) session.getAttribute("startDate");
		List<Question> paperQuestions=(List<Question>) session.getAttribute("paperQuestions");
		PaperExam paperExam=paperQuestions.get(1).getPaperExam();
		int point=paperQuestions.get(1).getPoint();
		boolean a=(boolean) session.getAttribute("correct");
		if(a){
			score+=point;
		}
		if(score==0){
			score=1;
		}
		if(!user.isFlag()){
			user.setFlag(true);
		}
		historyExam.setEndTime(endTime);
		historyExam.setScore(score);
		historyExam.setUser(user);
		historyExam.setPaperExam(paperExam);
		historyExam.setStartTime(startTime);
		userService.updateUser(user);
		historyExamService.addExamRecord(historyExam);
		session.setAttribute("user", user);
		return "1";
	}
	/**
	 * 用户退出考试
	 */
	@ResponseBody
	@RequestMapping("/user-exitExam")
	public String exitExam(){
		return "1";
	}
	
}
