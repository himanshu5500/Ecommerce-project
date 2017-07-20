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
import com.myshoppro.myshopprobackend.dao.ProductDAO;
import com.myshoppro.myshopprobackend.dao.UserDetailsDAO;
import com.myshoppro.myshopprobackend.model.Cart;
import com.myshoppro.myshopprobackend.model.Category;
import com.myshoppro.myshopprobackend.model.Product;
import com.myshoppro.myshopprobackend.model.UserDetails;

@Controller
public class CartController {
	@Autowired
	ProductDAO productDAO;
	@Autowired
	CartDAO cartDAO;
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	UserDetailsDAO userDetailsDAO;
	
	@RequestMapping("/showCart")
	public ModelAndView showCart(HttpSession session){
		ModelAndView m=new ModelAndView("Cart");
		String username=(String)session.getAttribute("username");
		List<Cart> cart_list=cartDAO.getCartItems(username);
		m.addObject("cartItems", cart_list);
		m.addObject("cartSize", cart_list.size());
		return m;
	}
	@RequestMapping("/addToCart")
	public ModelAndView addToCart(@RequestParam("proid") int proId,HttpSession session)
	{	ModelAndView m=new ModelAndView("redirect:showCart");
		boolean notexist=true;
		String username=(String)session.getAttribute("username");
		UserDetails userDetails=userDetailsDAO.getUserDetails(username);
		List<Cart> cart_list=cartDAO.getCartItems(username);
		for(Cart cart:cart_list)
			if(cart.getProd_id()==proId){
				notexist=false;
				cart.setQuantity(cart.getQuantity()+1);
				cartDAO.insertOrUpdateCart(cart);
			}
		if(notexist){
		Cart cart=new Cart();
		if(cart_list.size()==0){
			userDetails.setCart_id(userDetails.getCart_id()+1);
			userDetailsDAO.insertOrUpdateUserDetails(userDetails);
		}
		cart.setCart_id(userDetails.getCart_id());
		cart.setQuantity(1);
		cart.setStatus("N");
		cart.setUsername(username);
		cart.setProd_id(proId);
		Product product=productDAO.getProduct(proId);
		cart.setProd_name(product.getPro_name());
		cart.setPrice(product.getPro_price());
		cartDAO.insertOrUpdateCart(cart);
		}
		return m;
	}
	@RequestMapping("/updateCart")
	public ModelAndView updateCart(@RequestParam("id") int cart_item_id,@RequestParam("action") String action)
	{	ModelAndView m=new ModelAndView("redirect:showCart");
		Cart cart=cartDAO.getCartItem(cart_item_id);
		int quantity=cart.getQuantity();
		if(action.equals("increase"))
			cart.setQuantity(quantity+1);
		else if(quantity!=1&&action.equals("decrease"))
			cart.setQuantity(quantity-1);
		cartDAO.insertOrUpdateCart(cart);
		return m;
	}
	@RequestMapping("/deleteCartItem")
	public ModelAndView deleteCartItem(@RequestParam("id") int cart_item_id)
	{	ModelAndView m=new ModelAndView("redirect:showCart");
		Cart cart=cartDAO.getCartItem(cart_item_id);
		cartDAO.deleteCartItem(cart);
		return m;
	}	
	@RequestMapping("/BuyNow")
	public ModelAndView buyNow(@RequestParam("proid") int proId,HttpSession session)
	{	ModelAndView m=new ModelAndView("redirect:checkOut");
		boolean notexist=true;
		String username=(String)session.getAttribute("username");
		
		List<Cart> cart_list=cartDAO.getCartItems(username);
		for(Cart cart:cart_list)
			if(cart.getProd_id()==proId){
				notexist=false;
				cart.setQuantity(cart.getQuantity()+1);
				cartDAO.insertOrUpdateCart(cart);
			}
		if(notexist){
		Cart cart=new Cart();
		cart.setCart_id(1001);
		cart.setQuantity(1);
		cart.setStatus("N");
		cart.setUsername(username);
		cart.setProd_id(proId);
		Product product=productDAO.getProduct(proId);
		cart.setProd_name(product.getPro_name());
		cart.setPrice(product.getPro_price());
		cartDAO.insertOrUpdateCart(cart);
		}
		return m;
	}
	@RequestMapping("/checkOut")
	public ModelAndView checkOut(HttpSession session){
		ModelAndView m=new ModelAndView("OrderConfirm");
		String username=(String)session.getAttribute("username");
		List<Cart> cart_list=cartDAO.getCartItems(username);
		int totalAmount=0,cartId=0;
		for(Cart cart:cart_list){
			totalAmount+=cart.getQuantity()*cart.getPrice();
			cartId=cart.getCart_id();
		}
		m.addObject("totalAmount",totalAmount);
		m.addObject("cartItems", cart_list);
		m.addObject("cartId", cartId);
		return m;
	}
	
	@ModelAttribute
	public void homeCatDetails(Model m){
		List<Category> list=categoryDAO.getCategoryDetails();
		m.addAttribute("catDetails",list);
	}
	
}
