package com.test.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.bean.HistoryExam;
import com.test.service.HistoryExamService;

@Controller
public class HistoryExamAction {
	
	@Autowired
	HistoryExamService historyExamService;
	@RequestMapping("/historyExam-manage")
	public String getAllHistoryExam(HttpSession session){
		List<HistoryExam> historyExams=historyExamService.getAll();
		session.setAttribute("historyExams", historyExams);
		session.setAttribute("mark", 4);
		return "show";
	}
	@RequestMapping("/historyExam-delete")
	public String deleteHistoryExam(@RequestParam(value="id",required=false)Integer id,HttpSession session){
		historyExamService.deleteHistoryExam(id);
		return "redirect:/historyExam-manage";
	}
}
