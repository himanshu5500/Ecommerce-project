package com.myshoppro.myshopprobackend;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import com.myshoppro.myshopprobackend.dao.UserDetailsDAO;
import com.myshoppro.myshopprobackend.model.UserDetails;

public class UserDetailsTestCase {

	public static void main(String[] args) {
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		context.scan("com.myshoppro.myshopprobackend");
		context.refresh();
		UserDetailsDAO userDetailsDAO=(UserDetailsDAO)context.getBean("userDetailsDAO");
		UserDetails userDetails;
				userDetails=new UserDetails();
				userDetails.setUsername("himanshu123");
				userDetails.setFull_name("Himanshu");
				userDetails.setEmail("himanshu@myshoppro.com");
				userDetails.setPassword("asdfgasdfg");
				userDetails.setAddress("delhi");
				userDetails.setMobile(1234567890);
				userDetails.setRole("ROLE_ADMIN");
				userDetails.setEnabled(true);
				userDetails.setCart_id(100);
				
				userDetailsDAO.insertOrUpdateUserDetails(userDetails);		
				System.out.println("UserDetails Inserted");
		
				userDetails=userDetailsDAO.getUserDetails(userDetails.getUsername());
				userDetails.setFull_name("Rajkumar");
				userDetailsDAO.insertOrUpdateUserDetails(userDetails);
				System.out.println("The UserDetails Updated");

				userDetails=userDetailsDAO.getUserDetails(userDetails.getUsername());
				System.out.println("Name:"+userDetails.getFull_name());
				System.out.println("Address:"+userDetails.getAddress());
				System.out.println("Email:"+userDetails.getEmail());
				System.out.println("role:"+userDetails.getRole());
				
				context.close();
		}

}
