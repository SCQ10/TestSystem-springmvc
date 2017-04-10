package com.test.bean;

public class PaperExam {
	
	private Integer id;//试卷编号
	private int timeLimit;//考试时间
	private int questionCount;//题目数量
	private String subject;//考试科目
	private int totalScore;//考试总分
	public PaperExam(){
		
	}

	public PaperExam(Integer id, int timeLimit, int questionCount,
			String subject, int totalScore) {
		this.id = id;
		this.timeLimit = timeLimit;
		this.questionCount = questionCount;
		this.subject = subject;
		this.totalScore = totalScore;
	}

	@Override
	public String toString() {
		return this.subject;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public int getTimeLimit() {
		return timeLimit;
	}
	public void setTimeLimit(int timeLimit) {
		this.timeLimit = timeLimit;
	}
	public int getQuestionCount() {
		return questionCount;
	}
	public void setQuestionCount(int questionCount) {
		this.questionCount = questionCount;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(int totalScore) {
		this.totalScore = totalScore;
	}
}
