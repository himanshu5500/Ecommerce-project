package com.myshoppro.myshopprofrontend;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myshoppro.myshopprobackend.dao.CartDAO;
import com.myshoppro.myshopprobackend.dao.CategoryDAO;
import com.myshoppro.myshopprobackend.dao.OrderDetailsDAO;
import com.myshoppro.myshopprobackend.dao.ProductDAO;
import com.myshoppro.myshopprobackend.dao.UserDetailsDAO;
import com.myshoppro.myshopprobackend.model.Cart;
import com.myshoppro.myshopprobackend.model.Category;
import com.myshoppro.myshopprobackend.model.OrderDetails;
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
	@Autowired
	OrderDetailsDAO orderDetailsDAO;
	
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
	@RequestMapping("/placeOrder")
	public ModelAndView placeOrder(HttpSession session,@RequestParam int mobile,@RequestParam String name,@RequestParam String address,@RequestParam String payMode){
		ModelAndView m=new ModelAndView("PurchaseSummary");
		String username=(String)session.getAttribute("username");
		List<Cart> cart_list=cartDAO.getCartItems(username);
		int order_id=(int)(Math.random()*10000000+Math.random()*7777);
		for(Cart cartItem:cart_list){
		OrderDetails orderDetails=new OrderDetails();
		/*cartItem.setStatus("Y");
		cartDAO.insertOrUpdateCart(cartItem);*/
		orderDetails.setCart_id(cartItem.getCart_id());
		orderDetails.setMobile(mobile);
		orderDetails.setName(name);
		orderDetails.setOrder_amount(cartItem.getQuantity()*cartItem.getPrice());
		orderDetails.setPay_mode(payMode);
		orderDetails.setOrder_id(order_id);
		orderDetails.setProd_id(cartItem.getProd_id());
		orderDetails.setProd_name(cartItem.getProd_name());
		orderDetails.setShip_address(address);
		orderDetails.setStatus("processing");
		orderDetails.setUsername(username);
		orderDetailsDAO.insertOrUpdateOrderDetails(orderDetails);
		cartDAO.deleteCartItem(cartItem);
		}			
		m.addObject("orderId",order_id);
		return m;
	}
	
	@RequestMapping("/myOrders")
	public ModelAndView myOrders(HttpSession session){
		ModelAndView m=new ModelAndView("MyOrders");
		String username=(String)session.getAttribute("username");
		List<OrderDetails> list=orderDetailsDAO.getOrderDetailsList(username);
		m.addObject("orderList",list);
		return m;
		}	
	
	@ModelAttribute
	public void homeCatDetails(Model m){
		List<Category> list=categoryDAO.getCategoryDetails();
		m.addAttribute("catDetails",list);
	}
	
}
