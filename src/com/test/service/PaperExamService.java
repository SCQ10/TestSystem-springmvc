package com.test.service;

import java.util.List;

import com.test.bean.PaperExam;
import com.test.dao.PaperExamDao;

public class PaperExamService {
	
	private PaperExamDao paperExamDao;
	public void setPaperExamDao(PaperExamDao paperExamDao) {
		this.paperExamDao = paperExamDao;
	}
	public boolean addPaperExam(PaperExam paperExam){
		paperExamDao.addPaperExam(paperExam);
		return paperExamDao.getPaperExam(paperExam.getSubject())!=null;
	}
	public List<PaperExam> getAll(){
		return paperExamDao.getAll();
	}
	public int deletePaperExam(Integer id){
		return paperExamDao.deletePaperExam(id);
	}
	public PaperExam get(String subject){
		return paperExamDao.getPaperExam(subject);
	}
	public PaperExam get(Integer id){
		return paperExamDao.getPaperExam(id);
	}
	public void updatePaperExam(PaperExam paperExam) {
		paperExamDao.updatePaperExam(paperExam);
	}
	public PaperExam getPaperExam(String subject){
		return paperExamDao.get(subject);
	}
}
