package com.myshoppro.myshopprobackend.dao;

import java.util.List;

import com.myshoppro.myshopprobackend.model.Category;
import com.myshoppro.myshopprobackend.model.Product;

public interface ProductDAO {
	public void insertOrUpdateProduct(Product product);
	public Product getProduct(int prod_id);
	public List<Product> getProductDetails();
	public List<Product> getProductCatWise(Category category);
	public void deleteProduct(Product product);
	
}
