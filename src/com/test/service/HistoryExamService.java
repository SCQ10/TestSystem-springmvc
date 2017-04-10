package com.test.service;

import java.util.List;

import com.test.bean.HistoryExam;
import com.test.dao.HistoryExamDao;


public class HistoryExamService {
	
	private HistoryExamDao historyExamDao;
	public void setHistoryExamDao(HistoryExamDao historyExamDao) {
		this.historyExamDao = historyExamDao;
	}
	public List<HistoryExam> getAll(){
		return historyExamDao.getAll();
	}
	public int deleteHistoryExam(Integer id){
		return historyExamDao.deleteHistoryExam(id);
	}
	public List<HistoryExam> getHistoryExam(Integer id){
		return historyExamDao.getUserHistoryScore(id);
	}
	public List<HistoryExam> getHighScore(){
		List<HistoryExam> list=historyExamDao.getAll();
		for(int i=0;i<list.size();i++){
			if((list.get(i).getScore()<90)){
				list.remove(i);
			}
		}
		return list;
	}
	public void addExamRecord(HistoryExam historyExam) {
		historyExamDao.addExamRecord(historyExam);
	}
}
