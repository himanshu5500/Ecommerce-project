package com.myshoppro.myshopprobackend;

import java.util.List;
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
			
			product=productDAO.getProduct(product.getPro_id());		
			System.out.println(product.getPro_name()+" data retrieve");
			
			List<Product> list = productDAO.getProductDetails();
			System.out.println("Product List Retrieve");
			for(Product item:list)
				System.out.println(item.getPro_id()+" "+item.getPro_name());
			
			list = productDAO.getProductCatWise(category);
			System.out.println("Product List Per Category Retrieve");
			for(Product item:list)
				System.out.println(item.getPro_id()+" "+item.getPro_name());
			
			productDAO.deleteProduct(product);		
			System.out.println("Product Deleted");
			
			context.close();


	}

}
