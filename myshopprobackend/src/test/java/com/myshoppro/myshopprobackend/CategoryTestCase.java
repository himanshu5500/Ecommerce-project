package com.myshoppro.myshopprobackend;

import java.util.List;
import java.util.Scanner;

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
		Scanner input=new Scanner(System.in);
		int i;
			System.out.println("====Select an option====");
			System.out.println("1. Insert category");
			System.out.println("2. Update category");
			System.out.println("3. Delete category");
			System.out.println("4. Retrieve category");
			System.out.println("5. Show all category");
			System.out.println("Enter your choice : ");
			i=input.nextInt();
			switch(i){
			case 1:
				category=new Category();
				category.setCat_name("WIFIMobile");
				category.setCat_desc("This Mobile is WIFI Enabled. You can Enjoy Internet");
				category.setHome_cat("Mobiles");
				categoryDAO.insertOrUpdateCategory(category);		
				System.out.println("Category Inserted");
				break;
			case 2:
				System.out.println("Enter ID : ");
				i=input.nextInt();
				category=categoryDAO.getCategory(i);
				category.setCat_name("WifiEnMobile");
				categoryDAO.insertOrUpdateCategory(category);
				System.out.println("The Category Updated");
				break;
			case 3:
				System.out.println("Enter ID : ");
				i=input.nextInt();
				category=categoryDAO.getCategory(i);
				categoryDAO.deleteCategory(category);
				System.out.println("The Category Deleted");
				break;
			case 4:
				System.out.println("Enter ID : ");
				i=input.nextInt();
				category=categoryDAO.getCategory(i);
				System.out.println("Category Name:"+category.getCat_name());
				System.out.println("Category Description:"+category.getCat_desc());
				break;
			case 5:
				List<Category> list=categoryDAO.getCategoryDetails();
				for(Category category2:list)
				{
					System.out.println(category2.getCat_id()+":"+category2.getCat_name()+":"+category2.getCat_desc());
				}
				break;
			default:
				System.out.println("Invalid operation");
			
			}
			input.close();
			context.close();
		}

}
