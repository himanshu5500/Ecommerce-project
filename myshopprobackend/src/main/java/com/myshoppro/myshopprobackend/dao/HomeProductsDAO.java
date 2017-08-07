package com.myshoppro.myshopprobackend.dao;

import java.util.List;

import com.myshoppro.myshopprobackend.model.HomeProducts;

public interface HomeProductsDAO {
	public void insertOrUpdateHomeProducts(HomeProducts homeProducts);
	public List<HomeProducts> getHomeProductsList();
	public HomeProducts getHomeProducts(int srNo);

}
