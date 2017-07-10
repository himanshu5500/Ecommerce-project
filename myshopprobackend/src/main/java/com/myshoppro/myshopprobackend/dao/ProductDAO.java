package com.myshoppro.myshopprobackend.dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.myshoppro.myshopprobackend.model.Category;
import com.myshoppro.myshopprobackend.model.Product;

@Repository("productDAO")
public class ProductDAO {
		@Autowired
		SessionFactory sessionFactory;
		public ProductDAO(SessionFactory sessionFactory){
			this.sessionFactory=sessionFactory;
		}
		
		@Transactional
		public void insertOrUpdateProduct(Product product)
		{
			Session session=sessionFactory.getCurrentSession();
			session.saveOrUpdate(product);
		}
		
		public Product getProduct(int catid)
		{
			Session session=sessionFactory.openSession();
			Product product=session.get(Product.class,catid);
			session.close();
			return product;
		}
		
		public List<Product> getProductDetails()
		{
			Session session=sessionFactory.openSession();
			List<Product> list=session.createQuery("from Product").list();
			session.close();
			return list;
		}
		
		public List<Product> getProductCatWise(Category category)
		{
			Session session=sessionFactory.openSession();
			Query query=session.createQuery("from Product where category=:category");
			query.setParameter("category", category);
			List<Product> list=query.list();
			session.close();
			return list;
		}
		
		@Transactional
		public void deleteProduct(Product product)
		{
			sessionFactory.getCurrentSession().delete(product);
		}
		
}


