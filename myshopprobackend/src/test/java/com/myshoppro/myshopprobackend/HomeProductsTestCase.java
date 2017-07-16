package com.myshoppro.myshopprobackend;

import java.util.Scanner;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.myshoppro.myshopprobackend.dao.HomeProductsDAO;
import com.myshoppro.myshopprobackend.dao.ProductDAO;
import com.myshoppro.myshopprobackend.model.Category;
import com.myshoppro.myshopprobackend.model.HomeProducts;

public class HomeProductsTestCase {
	public static void main(String[] args) {
	
	AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
	context.scan("com.myshoppro.myshopprobackend");
	context.refresh();
	HomeProductsDAO homeProductsDAO=(HomeProductsDAO)context.getBean("homeProductsDAO");
	ProductDAO productDAO=(ProductDAO)context.getBean("productDAO");
	HomeProducts homeProducts;
	Scanner input=new Scanner(System.in);
	int i;
		System.out.println("====Select an option====");
		System.out.println("1. Insert homeProducts");
		System.out.println("2. Get homeProducts");
		System.out.println("3. Get homeProducts List");
		System.out.println("Enter your choice : ");
		i=input.nextInt();

		switch(i){
		case 1:
			homeProducts=new HomeProducts();
			homeProducts.setSrNo(1);
			homeProducts.setBarNumber(1);
			homeProducts.setProduct(productDAO.getProduct(2));
			homeProductsDAO.insertOrUpdateHomeProducts(homeProducts);
			System.out.println("HomeProducts Inserted");
			break;
		default:
			System.out.println("Invalid operation");
		}
		input.close();
		context.close();
	}
}