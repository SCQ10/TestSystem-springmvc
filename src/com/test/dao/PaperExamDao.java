package com.test.dao;

import java.util.List;

import org.hibernate.Query;

import com.test.bean.PaperExam;

public class PaperExamDao extends BaseDao{
	
	public List<PaperExam> getAll(){
		String hql="FROM PaperExam";
		return getSession().createQuery(hql).list();
	}
	
	public void addPaperExam(PaperExam paperExam){
		getSession().save(paperExam);
	}
	
	public int deletePaperExam(Integer id){
		String hql="DELETE PaperExam pe WHERE pe.id=?";
		int a=getSession().createQuery(hql).setInteger(0, id).executeUpdate();
		return a;
	}
	public PaperExam getPaperExam(String subject){
		String hql="FROM PaperExam e WHERE e.subject=?";
		Query query=getSession().createQuery(hql).setString(0,subject);
		return (PaperExam) query.uniqueResult();
	}
	public PaperExam get(String subject){
		String hql="FROM PaperExam e WHERE e.subject LIKE ?";
		Query query=getSession().createQuery(hql).setString(0,"%"+subject+"%");
		return (PaperExam) query.uniqueResult();
	}
	public PaperExam getPaperExam(Integer id){
		String hql="FROM PaperExam e WHERE e.id=?";
		Query query=getSession().createQuery(hql).setInteger(0, id);
		return (PaperExam) query.uniqueResult();
	}
	public void updatePaperExam(PaperExam paperExam) {
		getSession().update(paperExam);
	}
	
}
