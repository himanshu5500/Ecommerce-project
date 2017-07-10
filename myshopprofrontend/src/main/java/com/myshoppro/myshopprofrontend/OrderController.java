package com.myshoppro.myshopprofrontend;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.myshoppro.myshopprobackend.dao.CartDAO;
import com.myshoppro.myshopprobackend.dao.CategoryDAO;
import com.myshoppro.myshopprobackend.dao.ProductDAO;
import com.myshoppro.myshopprobackend.dao.UserDetailsDAO;
import com.myshoppro.myshopprobackend.model.Cart;
import com.myshoppro.myshopprobackend.model.Category;
import com.myshoppro.myshopprobackend.model.UserDetails;

@Controller
public class OrderController {
	@Autowired
	ProductDAO productDAO;
	@Autowired
	CartDAO cartDAO;
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	UserDetailsDAO userDetailsDAO;
	
	@RequestMapping("/checkOut")
	public ModelAndView showCart(HttpSession session){
		ModelAndView m=new ModelAndView("OrderConfirm");
		String username=(String)session.getAttribute("username");
		List<Cart> cart_list=cartDAO.getCartItems(username);
		UserDetails userDetails=userDetailsDAO.getUserDetails(username);
		int totalAmount=0;
		for(Cart cart:cart_list){
			totalAmount+=cart.getQuantity()*cart.getPrice();
		}
		m.addObject("totalAmount",totalAmount);
		m.addObject("user",userDetails);
		m.addObject("cartItems", cart_list);
		return m;
	}
	
	@ModelAttribute
	public void homeCatDetails(Model m){
		List<Category> list=categoryDAO.getCategoryDetails();
		m.addAttribute("catDetails",list);
	}
	
}
