package com.test.bean;

import java.util.Date;

public class HistoryExam {

	private Integer id;//试卷编号
	private PaperExam paperExam;//试卷信息
	private User user;//用户信息
	private int score;//考试得分
	private Date startTime;//开始时间
	private Date endTime;//结束时间
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public PaperExam getPaperExam() {
		return paperExam;
	}
	public void setPaperExam(PaperExam paperExam) {
		this.paperExam = paperExam;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	@Override
	public String toString() {
		return "HistoryExam [id=" + id + ", paperExam=" + paperExam + ", user="
				+ user + ", score=" + score + ", startTime=" + startTime
				+ ", endTime=" + endTime + "]";
	}
	public HistoryExam(Integer id, PaperExam paperExam, User user, int score,
			Date startTime, Date endTime, String spendTime) {
		this.id = id;
		this.paperExam = paperExam;
		this.user = user;
		this.score = score;
		this.startTime = startTime;
		this.endTime = endTime;
	}
	public HistoryExam() {

	}
	
}
