package com.myshoppro.myshopprobackend.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.myshoppro.myshopprobackend.model.UserDetails;

@Repository("userDetailsDAO")
public class UserDetailsDAO {
	@Autowired
	SessionFactory sessionFactory;
	public UserDetailsDAO(SessionFactory sessionFactory){
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
	
	/*public List<UserDetails> getUserDetailsDetails()
	{
		Session session=sessionFactory.openSession();
		List<UserDetails> list=session.createQuery("from UserDetails").list();
		session.close();
		return list;
	}
	
	@Transactional
	public void deleteUserDetails(UserDetails userDetails)
	{
		sessionFactory.getCurrentSession().delete(userDetails);
	}
*/	
	

}
