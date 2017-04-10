package com.test.dao;

import java.util.List;

import com.test.bean.HistoryExam;

public class HistoryExamDao extends BaseDao{
	
	public List<HistoryExam> getAll(){
		String hql="FROM HistoryExam";
		return getSession().createQuery(hql).list();
	}
	public int deleteHistoryExam(Integer id){
		String hql="DELETE FROM HistoryExam he WHERE he.id=?";
		return getSession().createQuery(hql).setInteger(0, id).executeUpdate();
	}
	public List<HistoryExam> getUserHistoryScore(Integer id){
		String hql="FROM HistoryExam he WHERE he.user=?";
		return getSession().createQuery(hql).setInteger(0, id).list();
	}
	public void addExamRecord(HistoryExam historyExam){
		getSession().save(historyExam);
	}
}
