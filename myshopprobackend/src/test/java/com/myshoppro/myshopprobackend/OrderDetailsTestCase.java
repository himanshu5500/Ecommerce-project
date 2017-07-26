package com.myshoppro.myshopprobackend;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.myshoppro.myshopprobackend.dao.OrderDetailsDAO;
import com.myshoppro.myshopprobackend.model.Billing;
import com.myshoppro.myshopprobackend.model.OrderDetails;
import com.myshoppro.myshopprobackend.model.Shipping;

public class OrderDetailsTestCase {

	public static void main(String[] args) {
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		context.scan("com.myshoppro.myshopprobackend");
		context.refresh();
		OrderDetailsDAO orderDetailsDAO=(OrderDetailsDAO)context.getBean("orderDetailsDAO");
		OrderDetails orderDetails;
		Billing billing=new Billing();
		Shipping shipping=new Shipping();
				billing.setHouse_locality("a11");
				billing.setCity("delhi");
				billing.setState("new delhi");
				billing.setPincode(000000);
				billing.setPay_mode("COD");
				shipping.setName("User");
				shipping.setMobile("0000000000");
				shipping.setHouse_locality("a11");
				shipping.setCity("delhi");
				shipping.setState("new delhi");
				shipping.setPincode(000000);
				
				orderDetails=new OrderDetails();
				orderDetails.setCart_id(1001);
				orderDetails.setOrder_id(1111111);
				orderDetails.setBilling(billing);
				orderDetails.setShipping(shipping);
				orderDetails.setUsername("TestUser");
				orderDetailsDAO.insertOrderDetails(orderDetails);
				System.out.println("Order Details inserted");
				
				orderDetails=orderDetailsDAO.getOrderDetails("TestUser", 1001);
				System.out.println("Order Details retrieve");
				System.out.println("Order Id = "+orderDetails.getOrder_id());
				
				orderDetailsDAO.deleteOrderDetails("TestUser");
				System.out.println("Order Details Deleted");
				context.close();
	}
}
