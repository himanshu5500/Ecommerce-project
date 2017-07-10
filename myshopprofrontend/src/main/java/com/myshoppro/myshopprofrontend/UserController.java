package com.myshoppro.myshopprofrontend;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myshoppro.myshopprobackend.dao.CategoryDAO;
import com.myshoppro.myshopprobackend.dao.UserDetailsDAO;
import com.myshoppro.myshopprobackend.model.Category;
import com.myshoppro.myshopprobackend.model.UserDetails;

@Controller
public class UserController {
	@Autowired
	UserDetailsDAO userDetailsDAO;
	@Autowired
	CategoryDAO categoryDAO;
	@RequestMapping("login")
	public String login(){
		return "Login";
	}
	
	@RequestMapping("register")
	public String register(){
		return "Register";
	}
	
	@RequestMapping(value="/login_success",method=RequestMethod.POST)
		public String loginsuccess(HttpSession session)
		{ 
			String username= SecurityContextHolder.getContext().getAuthentication().getName();
			session.setAttribute("username",username);
			session.setAttribute("usertitle",username.charAt(0));
			session.setAttribute("loggedIn",true);
			@SuppressWarnings("unchecked")
			Collection<GrantedAuthority> authorities =(Collection<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();
			for(GrantedAuthority role:authorities)
			{
				System.out.println("Role:"+role.getAuthority()+"username"+username);
				if(role.getAuthority().equals("ROLE_ADMIN"))
					session.setAttribute("user",null);
				else
					session.setAttribute("user","user");
				}
			return "redirect:index";
		}
	
	@RequestMapping("/admin**")
	public ModelAndView adminPage() {

		ModelAndView model = new ModelAndView("AdminHome");
		model.addObject("title", "Spring Security Login Form - Database Authentication");
		return model;
	}

	@RequestMapping(value="/addUserDetails",method=RequestMethod.POST)
	public ModelAndView addProduct(@RequestParam Map<String,String> user)
	{	ModelAndView m=new ModelAndView("Login");
		UserDetails userDetails=userDetailsDAO.getUserDetails(user.get("username"));
		if(userDetails!=null){
		m.addObject("userExist","Username Already Exist");
		m.setViewName("Register");
		}
		else{
		userDetails =new UserDetails();
		userDetails.setFull_name(user.get("full_name"));
		userDetails.setAddress(user.get("address"));
		userDetails.setEmail(user.get("email"));
		userDetails.setUsername(user.get("username"));
		userDetails.setPassword(user.get("password"));
		userDetails.setMobile(Integer.parseInt(user.get("mobile")));
		userDetails.setEnabled(true);
		userDetails.setRole("ROLE_USER");
		userDetailsDAO.insertOrUpdateUserDetails(userDetails);
		m.addObject("userCreate","Account Successfully Created");
		m.setViewName("Login");
		}
		return m;
	}
	
	@RequestMapping(value="/myAccount")
	public ModelAndView myAccount(HttpSession session)
	{	ModelAndView m=new ModelAndView("MyAccount");
		String user=(String)session.getAttribute("username");
		UserDetails userDetails=userDetailsDAO.getUserDetails(user);	
		m.addObject("user",userDetails);
		return m;
	}
	
	@RequestMapping(value="/changePass")
	public ModelAndView changePass(@RequestParam("currentPass") String cPass,@RequestParam("newPass") String nPass,HttpSession session)
	{	ModelAndView m=new ModelAndView("MyAccount");
		String user=(String)session.getAttribute("username");
		UserDetails userDetails=userDetailsDAO.getUserDetails(user);	
		if(cPass.equals(userDetails.getPassword())){
			userDetails.setPassword(nPass);
			userDetailsDAO.insertOrUpdateUserDetails(userDetails);
			m.addObject("info","password changed successfully");
		}
		else{
			m.addObject("info","Error while changing password");	
		}
		m.addObject("user",userDetails);
		return m;
	}
	@RequestMapping(value="/updateUser",method=RequestMethod.POST)
	public ModelAndView updateUser(@RequestParam Map<String,String> user,HttpSession session)
	{	ModelAndView m=new ModelAndView("MyAccount");
		String username=(String)session.getAttribute("username");
		UserDetails userDetails=userDetailsDAO.getUserDetails(username);
		if(user.get("full_name")!=null)
		userDetails.setFull_name(user.get("full_name"));
		if(user.get("address")!=null)
		userDetails.setAddress(user.get("address"));
		if(user.get("email")!=null)
		userDetails.setEmail(user.get("email"));
		if(user.get("mobile")!=null)
		userDetails.setMobile(Integer.parseInt(user.get("mobile")));	
		userDetailsDAO.insertOrUpdateUserDetails(userDetails);
		userDetails=userDetailsDAO.getUserDetails(username);	
		m.addObject("user",userDetails);
		return m;
	}
	@ModelAttribute
	public void homeCatDetails(Model m){
		List<Category> list=categoryDAO.getCategoryDetails();
		m.addAttribute("catDetails",list);
	}
}
