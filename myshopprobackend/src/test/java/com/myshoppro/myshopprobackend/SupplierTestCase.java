package com.myshoppro.myshopprobackend;

import java.util.List;
import java.util.Scanner;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.myshoppro.myshopprobackend.dao.SupplierDAO;
import com.myshoppro.myshopprobackend.model.Supplier;

public class SupplierTestCase {

	public static void main(String[] args) {
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		context.scan("com.myshoppro.myshopprobackend");
		context.refresh();
		SupplierDAO supplierDAO=(SupplierDAO)context.getBean("supplierDAO");
		Supplier supplier;
		Scanner input=new Scanner(System.in);
		int i;
			System.out.println("====Select an option====");
			System.out.println("1. Insert supplier");
			System.out.println("2. Update supplier");
			System.out.println("3. Delete supplier");
			System.out.println("4. Retrieve supplier");
			System.out.println("5. Show all supplier");
			System.out.println("Enter your choice : ");
			i=input.nextInt();
			switch(i){
			case 1:
				supplier=new Supplier();
				supplier.setSup_name("Raj");
				supplier.setSup_address("Delhi");
				supplierDAO.insertOrUpdateSupplier(supplier);		
				System.out.println("Supplier Inserted");
				break;
			case 2:
				System.out.println("Enter ID : ");
				i=input.nextInt();
				supplier=supplierDAO.getSupplier(i);
				supplier.setSup_name("Rajkumar");
				supplierDAO.insertOrUpdateSupplier(supplier);
				System.out.println("The Supplier Updated");
				break;
			case 3:
				System.out.println("Enter ID : ");
				i=input.nextInt();
				supplier=supplierDAO.getSupplier(i);
				supplierDAO.deleteSupplier(supplier);
				System.out.println("The Supplier Deleted");
				break;
			case 4:
				System.out.println("Enter ID : ");
				i=input.nextInt();
				supplier=supplierDAO.getSupplier(i);
				System.out.println("Supplier Name:"+supplier.getSup_name());
				System.out.println("Supplier Address:"+supplier.getSup_address());
				break;
			case 5:
				List<Supplier> list=supplierDAO.getSupplierDetails();
				for(Supplier supplier2:list)
				{
					System.out.println(supplier2.getSup_id()+":"+supplier2.getSup_name()+":"+supplier2.getSup_address());
				}
				break;
			default:
				System.out.println("Invalid operation");
			
			}
			input.close();
			context.close();
		}

}
