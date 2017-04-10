package com.test.bean;

import java.util.ArrayList;
import java.util.List;

public class Question {
	private Integer id;//题目编号
	private PaperExam paperExam;//所属科目
	private String title;//题干
	private List<String> options = new ArrayList<>();//选项
	private List<Integer> answers = new ArrayList<>();//答案
	private int point;//本题分数
	private int type;//单多选
	//考题类型常量
	public static final int TYPE_SINGLE_SELECT = 0;
	public static final int TYPE_MULTI_SELECT = 1;
	public Question(){
		
	}
	public boolean equals(Object obj){
		if(obj == null){
			return false;
		}
		if(obj == this){
			return true;
		}
		if(obj instanceof Question){
			Question question = (Question) obj;
			return this.id == question.id;
		}
		return false;	
	}
	public int hashCode(){
		return id;
	}
	public String toString(){
		//打印对象文本信息
		StringBuffer sb = new StringBuffer();
		sb.append(id+"."+title + "\n");
		for(int i = 0;i<options.size();i++){
			sb.append((char)('A'+i)+"."+options.get(i)+"\n");
		}
		sb.append("\n");
		return sb.toString();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public List<String> getOptions() {
		return options;
	}
	public void setOptions(List<String> options) {
		this.options = options;
	}
	public List<Integer> getAnswers() {
		return answers;
	}
	public void setAnswers(List<Integer> answers) {
		this.answers = answers;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public PaperExam getPaperExam() {
		return paperExam;
	}
	public void setPaperExam(PaperExam paperExam) {
		this.paperExam = paperExam;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
}
