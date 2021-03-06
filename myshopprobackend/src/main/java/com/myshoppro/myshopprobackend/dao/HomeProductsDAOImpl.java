package com.myshoppro.myshopprobackend.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.myshoppro.myshopprobackend.model.HomeProducts;

@Repository("homeProductsDAO")
public class HomeProductsDAOImpl implements HomeProductsDAO{
	@Autowired
	SessionFactory sessionFactory;
	public HomeProductsDAOImpl(SessionFactory sessionFactory){
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
	
	public HomeProducts getHomeProducts(int srNo)
	{
		Session session=sessionFactory.openSession();
		HomeProducts homeProduct=session.get(HomeProducts.class,srNo);
		session.close();
		return homeProduct;
	}
	
}
