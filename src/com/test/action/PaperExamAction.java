package com.test.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.bean.PaperExam;
import com.test.service.PaperExamService;

@Controller
public class PaperExamAction {
	
	@Autowired
	PaperExamService paperExamService;
	/**
	 * 获取所有paperExam跳转到前台
	 */
	@RequestMapping("/paperExam-manage")
	public String getPaperExam(HttpSession session){
		List<PaperExam> paperExams=paperExamService.getAll();
		session.setAttribute("paperExams", paperExams);
		session.setAttribute("mark", 1);
		return "show";
	}
	/**
	 * 删除paperExam
	 */
	@RequestMapping("/paperExam-delete")
	public String deleteUser(@RequestParam(value="id",required=false)Integer id){
		paperExamService.deletePaperExam(id);
		return "redirect:/paperExam-manage";
	}
	/**
	 * 跳转到添加页面
	 */
	@RequestMapping("/paperExam-add")
	public String common(HttpSession session){
		session.setAttribute("type", 1);
		return "add";
	}
	/**
	 * 添加一条paperExam
	 */
	@RequestMapping("/paperExam-addPaperExam")
	public String addPaperExam(@RequestParam(value="subject",required=false)String subject,@RequestParam(value="timeLimit",required=false)int timeLimit,@RequestParam(value="questionCount",required=false)int questionCount,@RequestParam(value="totalScore",required=false)int totalScore){
		PaperExam paperExam=new PaperExam();
		paperExam.setSubject(subject);
		paperExam.setQuestionCount(questionCount);
		paperExam.setTimeLimit(timeLimit);
		paperExam.setTotalScore(totalScore);
		paperExamService.addPaperExam(paperExam);
		return "redirect:/paperExam-manage";
	}
	/**
	 * 获取到要修改的paperExam,跳转到修改界面
	 */
	@RequestMapping("/paperExam-update")
	public String update(@RequestParam(value="id",required=false)Integer id,HttpSession session){
		PaperExam paperExam=paperExamService.get(id);
		session.setAttribute("paperExam", paperExam);
		session.setAttribute("logo", 1);
		return "update";
	}
	/**
	 * 更新paperExam信息
	 */
	@RequestMapping("/paperExam-updatePaperExam")
	public String updatePaperExam(@RequestParam(value="id",required=false)Integer id,@RequestParam(value="subject",required=false)String subject,@RequestParam(value="timeLimit",required=false)int timeLimit,@RequestParam(value="questionCount",required=false)int questionCount,@RequestParam(value="totalScore",required=false)int totalScore){
		PaperExam paperExam=new PaperExam();
		paperExam.setId(id);
		paperExam.setSubject(subject);
		paperExam.setQuestionCount(questionCount);
		paperExam.setTimeLimit(timeLimit);
		paperExam.setTotalScore(totalScore);
		paperExamService.updatePaperExam(paperExam);
		return "redirect:/paperExam-manage";
	}
	
}
