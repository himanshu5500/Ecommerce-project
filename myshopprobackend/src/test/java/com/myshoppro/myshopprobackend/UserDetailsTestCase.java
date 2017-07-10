package com.myshoppro.myshopprobackend;

import java.util.Scanner;
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
		Scanner input=new Scanner(System.in);
		int i;String s;
			System.out.println("====Select an option====");
			System.out.println("1. Insert userDetails");
			System.out.println("2. Update userDetails");
			System.out.println("3. Retrieve userDetails");
			//System.out.println("4. Delete userDetails");
			//System.out.println("5. Show all userDetails");
			System.out.println("Enter your choice : ");
			i=input.nextInt();
			switch(i){
			case 1:
				userDetails=new UserDetails();
				userDetails.setUsername("himanshu123");
				userDetails.setFull_name("Himanshu");
				userDetails.setEmail("himanshu@myshoppro.com");
				userDetails.setPassword("asdfg");
				userDetails.setAddress("delhi");
				userDetails.setMobile(1234567890);
				userDetails.setRole("ROLE_ADMIN");
				userDetails.setEnabled(true);
				userDetailsDAO.insertOrUpdateUserDetails(userDetails);		
				System.out.println("UserDetails Inserted");
				break;
			case 2:
				System.out.println("Enter ID : ");
				s=input.next();
				userDetails=userDetailsDAO.getUserDetails(s);
				userDetails.setUsername("Rajkumar");
				userDetailsDAO.insertOrUpdateUserDetails(userDetails);
				System.out.println("The UserDetails Updated");
				break;
			case 3:
				System.out.println("Enter Email ID : ");
				s=input.next();
				userDetails=userDetailsDAO.getUserDetails(s);
				System.out.println("UserName:"+userDetails.getUsername());
				System.out.println("Address:"+userDetails.getAddress());
				System.out.println("Email:"+userDetails.getEmail());
				System.out.println("role:"+userDetails.getRole());
				break;
			/*case 4:
				System.out.println("Enter ID : ");
				i=input.nextInt();
				userDetails=userDetailsDAO.getUserDetails(i);
				userDetailsDAO.deleteUserDetails(userDetails);
				System.out.println("The UserDetails Deleted");
				break;
			case 5:
				List<UserDetails> list=userDetailsDAO.getUserDetailsDetails();
				for(UserDetails userDetails2:list)
				{
					System.out.println(userDetails2.getSup_id()+":"+userDetails2.getSup_name()+":"+userDetails2.getSup_address());
				}
				break;*/
			default:
				System.out.println("Invalid operation");
			
			}
			input.close();
			context.close();
		}

}
