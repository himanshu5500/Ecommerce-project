package com.myshoppro.myshopprobackend.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.myshoppro.myshopprobackend.model.Category;

@Repository("categoryDAO")
public class CategoryDAOImpl implements CategoryDAO{
	@Autowired
	SessionFactory sessionFactory;
	public CategoryDAOImpl(SessionFactory sessionFactory){
		this.sessionFactory=sessionFactory;
	}
	
	@Transactional
	public void insertOrUpdateCategory(Category category)
	{
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(category);
	}
	
	public Category getCategory(int catid)
	{
		Session session=sessionFactory.openSession();
		Category category=session.get(Category.class,catid);
		session.close();
		return category;
	}
	
	public List<Category> getCategoryDetails()
	{
		Session session=sessionFactory.openSession();
		List<Category> list=session.createQuery("from Category").list();
		session.close();
		return list;
	}
	
	@Transactional
	public void deleteCategory(Category category)
	{
		sessionFactory.getCurrentSession().delete(category);
	}
	
	

}
