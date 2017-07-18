package com.myshoppro.myshopprobackend;

import java.util.Scanner;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.myshoppro.myshopprobackend.dao.HomeProductsDAO;
import com.myshoppro.myshopprobackend.dao.ProductDAO;
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
			int srNo=1;
			for(int j=1;j<3;j++){
				for(int l=1;l<3;l++){
					for(int k=1;k<5;k++){
			homeProducts=new HomeProducts();
			homeProducts.setSrNo(srNo++);
			homeProducts.setBarNumber(j*100+l);
			homeProducts.setProduct(productDAO.getProduct(2));
			homeProductsDAO.insertOrUpdateHomeProducts(homeProducts);
			}}}
			System.out.println("HomeProducts Inserted");
			
			break;
		default:
			System.out.println("Invalid operation");
		}
		input.close();
		context.close();
	}
}