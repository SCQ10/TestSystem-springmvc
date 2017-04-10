package com.test.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.bean.PaperExam;
import com.test.bean.Question;
import com.test.service.PaperExamService;
import com.test.service.QuestionService;

@Controller
public class QuestionAction {
	
	@Autowired
	private QuestionService questionService;
	@Autowired
	private PaperExamService paperExamService;
	/**
	 * 获取所有question跳转到前台
	 */
	@RequestMapping("/question-manage")
	public String getQuestion(HttpSession session){
		List<Question> questions=questionService.getAllQuestion();
		session.setAttribute("questions", questions);
		session.setAttribute("mark", 3);
		return "show";
	}
	/**
	 * 删除question
	 */
	@RequestMapping("/question-delete")
	public String deleteQuestion(@RequestParam(value="id",required=false)Integer id){
		questionService.deleteQuestion(id);
		return "redirect:/question-manage";
	}
	/**
	 * 获取需要修改的question并跳转到修改界面
	 */
	@RequestMapping("/question-update")
	public String update(@RequestParam(value="id",required=false)Integer id,HttpSession session){
		Question question=questionService.getQuestion(id);
		session.setAttribute("question", question);
		session.setAttribute("logo", 3);
		return "update";
	}
	/**
	 * 修改新闻
	 */
	@RequestMapping("/question-updateQuestion")
	public String updateQuestion(@RequestParam(value="title",required=false)String title,
			@RequestParam(value="ca",required=false)String ca,@RequestParam(value="cb",required=false)String cb,
			@RequestParam(value="cc",required=false)String cc,@RequestParam(value="cd",required=false)String cd,
			@RequestParam(value="answers",required=false)String answer,@RequestParam(value="type",required=false)int type,
			@RequestParam(value="point",required=false)int point,HttpSession session){
		Question question=(Question) session.getAttribute("question");
		List<String> options=new ArrayList<>();
		List<Integer> answers=new ArrayList<>();
		options.add(ca);
		options.add(cb);
		options.add(cc);
		options.add(cd);
		answer=answer.substring(1, answer.length()-1);
		System.out.println(answer);
		String [] data = answer.split(",");
		for(String msg : data){
			answers.add(Integer.parseInt(msg));
		}
		question.setAnswers(answers);
		question.setPoint(point);
		question.setOptions(options);
		question.setTitle(title);
		question.setType(type);
		questionService.updateQuestion(question);
		return "redirect:/question-manage";
	}
	/**
	 * 跳转到添加界面
	 */
	@RequestMapping("/question-add")
	public String add(HttpSession session){
		session.setAttribute("type", 3);
		return "add";
	}
	/**
	 * 添加question
	 */
	@RequestMapping("/question-addQuestion")
	public String addQuestion(@RequestParam(value="flag",required=false)Integer peid,@RequestParam(value="title",required=false)String title,
			@RequestParam(value="ca",required=false)String ca,@RequestParam(value="cb",required=false)String cb,
			@RequestParam(value="cc",required=false)String cc,@RequestParam(value="cd",required=false)String cd,
			@RequestParam(value="answers",required=false)String answer,@RequestParam(value="type",required=false)int type,
			@RequestParam(value="point",required=false)int point){
		Question question=new Question();
		List<String> options=new ArrayList<>();
		List<Integer> answers=new ArrayList<>();
		options.add(ca);
		options.add(cb);
		options.add(cc);
		options.add(cd);
		String [] data = answer.split(",");
		for(String msg : data){
			answers.add(Integer.parseInt(msg));
		}
		question.setAnswers(answers);
		question.setPaperExam(paperExamService.get(peid));
		question.setPoint(point);
		question.setOptions(options);
		question.setTitle(title);
		question.setType(type);
		questionService.addQuestion(question);
		return "redirect:/question-manage";
	}
	/**
	 * 查询考题
	 */
	@RequestMapping("/question-searchBySubject")
	public String searchBySubject(@RequestParam(value="sub",required=false)String subject,HttpSession session){
		//1.通过sub查询id
		PaperExam pe=paperExamService.getPaperExam(subject);
		//2.由id查询题目
		List<Question> questions=questionService.getQuestionsBySubject(pe.getId());
		session.setAttribute("questions", questions);
		return "show";
	}
	
}
