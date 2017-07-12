package com.myshoppro.myshopprobackend.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.myshoppro.myshopprobackend.model.OrderDetails;

@Repository("orderDetailsDAO")
public class OrderDetailsDAO {
	@Autowired
	SessionFactory sessionFactory;
	public OrderDetailsDAO(SessionFactory sessionFactory){
		this.sessionFactory=sessionFactory;
	}
	
	@Transactional
	public void insertOrUpdateOrderDetails(OrderDetails orderDetails)
	{
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(orderDetails);
	}
	
	public List<OrderDetails> getOrderDetailsList(String username)
	{
		Session session=sessionFactory.openSession();
		Query q=session.createQuery("from OrderDetails where username=:username");
		q.setParameter("username", username);
		List<OrderDetails> list=q.list();
		session.close();
		return list;
	}
}
