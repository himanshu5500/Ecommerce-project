package com.myshoppro.myshopprobackend.dao;

import com.myshoppro.myshopprobackend.model.OrderDetails;

public interface OrderDetailsDAO {
	public void insertOrderDetails(OrderDetails orderDetails);
	public OrderDetails getOrderDetails(String username,int cart_id);
	public void deleteOrderDetails(String username);

}
