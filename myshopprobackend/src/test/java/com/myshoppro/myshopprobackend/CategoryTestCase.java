package com.myshoppro.myshopprobackend;

import java.util.List;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.myshoppro.myshopprobackend.dao.CategoryDAO;
import com.myshoppro.myshopprobackend.model.Category;

public class CategoryTestCase {

	public static void main(String[] args) {
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		context.scan("com.myshoppro.myshopprobackend");
		context.refresh();
		CategoryDAO categoryDAO=(CategoryDAO)context.getBean("categoryDAO");
		Category category;
				category=new Category();
				category.setCat_name("WIFIMobile");
				category.setCat_desc("This Mobile is WIFI Enabled. You can Enjoy Internet");
				category.setHome_cat("Mobiles");
				
				categoryDAO.insertOrUpdateCategory(category);		
				System.out.println("Category Inserted");
				
				category=categoryDAO.getCategory(category.getCat_id());
				System.out.println(category.getCat_name()+" category data retrieve");
				
				List<Category> list = categoryDAO.getCategoryDetails();
				System.out.println("Category List Retrieve");
				for(Category item:list)
					System.out.println(item.getCat_id()+" "+item.getCat_name());
							
				categoryDAO.deleteCategory(category);		
				System.out.println("Category deleted");
				
				context.close();
		}

}
