package com.myshoppro.myshopprobackend.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.myshoppro.myshopprobackend.dao.CartDAO;
import com.myshoppro.myshopprobackend.dao.OrderDetailsDAO;

@Component
public class OrderDetailsWebFlow {
@Autowired
OrderDetailsDAO orderDetailsDAO;
@Autowired
CartDAO cartDAO;

	 public OrderDetails initFlow()
	 {
		  return new OrderDetails();
	 } 
	 
	 public String addOrderDetails(OrderDetails orderDetails)
	 {		int order_id=(int)(Math.random()*10000000+Math.random()*7777);
	 	orderDetails.setOrder_id(order_id);
		 orderDetailsDAO.insertOrderDetails(orderDetails);
		 cartDAO.cartFinal(orderDetails.getUsername());
		 System.out.println("order");
		 return "success";
	 }
	 
	 
}
