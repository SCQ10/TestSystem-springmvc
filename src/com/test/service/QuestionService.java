package com.test.service;

import java.util.ArrayList;
import java.util.List;

import com.test.bean.PaperExam;
import com.test.bean.Question;
import com.test.dao.QuestionDao;

public class QuestionService {
	private QuestionDao questionDao;
	public void setQuestionDao(QuestionDao questionDao) {
		this.questionDao = questionDao;
	}
	public List<Question> getAllQuestion(){
		return questionDao.getAllQuestion();
	}
	public Question getQuestion(Integer id){
		return questionDao.getQuestion(id);
	}
	public int deleteQuestion(Integer id){
		return questionDao.deleteQuestion(id);
	}
	public void updateQuestion(Question question){
		questionDao.updateQuestion(question);
	}
	public void addQuestion(Question question){
		questionDao.addQuestion(question);
	}
	/**
	 * 从题库中取到题目并取题目转化为试卷的题目
	 */
	public List<Question> getPaperQuestions(Integer peid,PaperExam paperExam){
		List<Question> questions=questionDao.getPaperQuestion(peid);
		int length=questions.size();//得到questions的长度
		List<Question> paperQuestions=new ArrayList<>();
		for(int i=0;i<paperExam.getQuestionCount();i++){
			int index=(int) (Math.random()*(length-i));
			paperQuestions.add(questions.remove(index));
		}
		return paperQuestions;
	}
	public List<Question> getQuestionsBySubject(Integer peid){
		return questionDao.getPaperQuestion(peid);
	}
}
