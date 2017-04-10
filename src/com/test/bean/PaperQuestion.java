package com.test.bean;

import java.util.ArrayList;
import java.util.List;

public class PaperQuestion {
	
	private Question question;//题目
	private int questionIndex;//试题编号
	private List<Integer> userAnswer = new ArrayList<Integer>();//用户答案
	public PaperQuestion() {

	}
	public PaperQuestion(Question question, int questionIndex,
			List<Integer> userAnswer) {
		super();
		this.question = question;
		this.questionIndex = questionIndex;
		this.userAnswer = userAnswer;
	}
	public String toString(){
		return question.toString().replace(question.getId()+"", questionIndex+"");
	}
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}
	public int getQuestionIndex() {
		return questionIndex;
	}
	public void setQuestionIndex(int questionIndex) {
		this.questionIndex = questionIndex;
	}
	public List<Integer> getUserAnswer() {
		return userAnswer;
	}
	public void setUserAnswer(List<Integer> userAnswer) {
		this.userAnswer = userAnswer;
	}
	
}
