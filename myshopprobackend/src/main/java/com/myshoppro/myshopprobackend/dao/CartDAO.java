package com.myshoppro.myshopprobackend.dao;

import java.util.List;

import com.myshoppro.myshopprobackend.model.Cart;

public interface CartDAO {
	public void insertOrUpdateCart(Cart cart);
	public Cart getCartItem(int cart_item_id);
	public List<Cart> getCartItems(String username);
	public void deleteCartItem(Cart cart);
	public List<Cart> getPurchasedCartItems(String username);
	public void cartFinal(String username);
}
