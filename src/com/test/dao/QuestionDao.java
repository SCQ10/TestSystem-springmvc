package com.test.dao;

import java.util.List;

import com.test.bean.Question;

public class QuestionDao extends BaseDao{
	
	public List<Question> getAllQuestion(){
		String hql="FROM Question";
		return getSession().createQuery(hql).list();
	}
	public int deleteQuestion(Integer id){
		String hql="DELETE FROM Question q WHERE q.id=?";
		int a=getSession().createQuery(hql).setInteger(0, id).executeUpdate();
		return a;
	}
	public void addQuestion(Question question){
		getSession().save(question);
	}
	public Question getQuestion(Integer id){
		String hql="FROM Question q WHERE q.id=?";
		return (Question) getSession().createQuery(hql).setInteger(0, id).uniqueResult();
	}
	public void updateQuestion(Question question){
		getSession().update(question);
	}
	public List<Question> getPaperQuestion(Integer peid){
		String hql="FROM Question q where q.paperExam=?";
		return getSession().createQuery(hql).setInteger(0, peid).list();
	}
}
