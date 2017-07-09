package com.myshoppro.myshopprobackend.dao;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.myshoppro.myshopprobackend.model.Cart;
import com.myshoppro.myshopprobackend.model.Category;

@Repository("cartDAO")
public class CartDAO {
	@Autowired
	SessionFactory sessionFactory;
	public CartDAO(SessionFactory sessionFactory){
		this.sessionFactory=sessionFactory;
	}
	@Transactional
	public void insertOrUpdateCart(Cart cart)
	{
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(cart);
	}

	public Cart getCartItem(int cart_item_id)
	{
		Session session=sessionFactory.openSession();
		Cart cart=session.get(Cart.class,cart_item_id);
		session.close();
		return cart;
	}
	
	public List<Cart> getCartItems(String username)
	{
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Cart where username=:username and status='N'");
		query.setParameter("username",username);
		List<Cart> list=query.list();
		session.close();
		return list;
	}
	
	@Transactional
	public void deleteCartItem(Cart cart)
	{
		sessionFactory.getCurrentSession().delete(cart);
	}
	
}
