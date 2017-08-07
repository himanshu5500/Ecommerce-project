package com.myshoppro.myshopprobackend.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.myshoppro.myshopprobackend.model.UserDetails;

@Repository("userDetailsDAO")
public class UserDetailsDAOImpl implements UserDetailsDAO{
	@Autowired
	SessionFactory sessionFactory;
	public UserDetailsDAOImpl(SessionFactory sessionFactory){
		this.sessionFactory=sessionFactory;
	}
	
	@Transactional
	public void insertOrUpdateUserDetails(UserDetails userDetails)
	{
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(userDetails);
	}
	
	public UserDetails getUserDetails(String username)
	{
		Session session=sessionFactory.openSession();
		UserDetails userDetails=session.get(UserDetails.class,username);
		session.close();
		return userDetails;
	}
	

}
