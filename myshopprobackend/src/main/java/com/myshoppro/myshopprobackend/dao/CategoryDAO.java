package com.myshoppro.myshopprobackend.dao;

import java.util.List;

import com.myshoppro.myshopprobackend.model.Category;

public interface CategoryDAO {
	public void insertOrUpdateCategory(Category category);
	public Category getCategory(int catid);
	public List<Category> getCategoryDetails();
	public void deleteCategory(Category category);
	
}
