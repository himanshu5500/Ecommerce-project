package com.myshoppro.myshopprobackend;

import java.util.List;
import java.util.Scanner;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.myshoppro.myshopprobackend.dao.CategoryDAO;
import com.myshoppro.myshopprobackend.dao.ProductDAO;
import com.myshoppro.myshopprobackend.dao.SupplierDAO;
import com.myshoppro.myshopprobackend.model.Category;
import com.myshoppro.myshopprobackend.model.Product;
import com.myshoppro.myshopprobackend.model.Supplier;

public class ProductTestCase {

	public static void main(String[] args) {		
	AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
	context.scan("com.myshoppro.myshopprobackend");
	context.refresh();
	ProductDAO productDAO=(ProductDAO)context.getBean("productDAO");
	Product product;
	SupplierDAO supplierDAO=(SupplierDAO)context.getBean("supplierDAO");
	Supplier supplier;
	CategoryDAO categoryDAO=(CategoryDAO)context.getBean("categoryDAO");
	Category category;
	Scanner input=new Scanner(System.in);
	int i;
		System.out.println("====Select an option====");
		System.out.println("1. Insert product");
		System.out.println("2. Update product");
		System.out.println("3. Delete product");
		System.out.println("4. Retrieve product");
		System.out.println("5. Show all product");
		System.out.println("Enter your choice : ");
		i=input.nextInt();
		switch(i){
		case 1:
			product=new Product();
			product.setPro_name("Vivo v5");
			product.setPro_desc("5' screen, 4g enabled, dual sim");
			product.setPro_price(5000);
			product.setPro_quantity(4);
			category=categoryDAO.getCategory(1);
			supplier=supplierDAO.getSupplier(1);
			product.setCategory(category);
			product.setSupplier(supplier);
			productDAO.insertOrUpdateProduct(product);		
			System.out.println("Product Inserted");
			break;
		case 2:
			System.out.println("Enter ID : ");
			i=input.nextInt();
			product=productDAO.getProduct(i);
			product.setPro_name("Oppo");
			productDAO.insertOrUpdateProduct(product);
			System.out.println("The Product Updated");
			break;
		case 3:
			System.out.println("Enter ID : ");
			i=input.nextInt();
			product=productDAO.getProduct(i);
			productDAO.deleteProduct(product);
			System.out.println("The Product Deleted");
			break;
		case 4:
			System.out.println("Enter ID : ");
			i=input.nextInt();
			product=productDAO.getProduct(i);
			System.out.println(product.getPro_id()+":"+product.getPro_name()+":"+product.getPro_price()+":"+product.getPro_desc()+":"+product.getPro_quantity()+":"+product.getCategory().getCat_id()+":"+product.getSupplier().getSup_id());
			break;
		case 5:
			List<Product> list=productDAO.getProductDetails();
			for(Product product2:list)
			{
				System.out.println(product2.getPro_id()+":"+product2.getPro_name()+":"+product2.getPro_price()+":"+product2.getPro_desc()+":"+product2.getPro_quantity()+":"+product2.getCategory().getCat_id()+":"+product2.getSupplier().getSup_id());
			}
			break;
		default:
			System.out.println("Invalid operation");
		
		}
		input.close();
		context.close();


	}

}
