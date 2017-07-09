package com.myshoppro.myshopprobackend.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.myshoppro.myshopprobackend.model.HomeProducts;

@Repository("homeProductsDAO")
public class HomeProductsDAO {
	@Autowired
	SessionFactory sessionFactory;
	public HomeProductsDAO(SessionFactory sessionFactory){
		this.sessionFactory=sessionFactory;
	}
	
	@Transactional
	public void insertOrUpdateHomeProducts(HomeProducts homeProducts)
	{
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(homeProducts);
	}
	
	public List<HomeProducts> getHomeProductsList()
	{
		Session session=sessionFactory.openSession();
		List<HomeProducts> list=session.createQuery("from HomeProducts").list();
		session.close();
		return list;
	}
	
	@Transactional
	public void deleteHomeProducts(HomeProducts homeProducts)
	{
		sessionFactory.getCurrentSession().delete(homeProducts);
	}
	
	
	
}
