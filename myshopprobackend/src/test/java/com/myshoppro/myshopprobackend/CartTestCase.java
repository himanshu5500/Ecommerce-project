package com.myshoppro.myshopprobackend;

import java.util.List;
import java.util.Scanner;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.myshoppro.myshopprobackend.dao.CartDAO;
import com.myshoppro.myshopprobackend.model.Cart;

public class CartTestCase {

	public static void main(String[] args) {
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		context.scan("com.myshoppro.myshopprobackend");
		context.refresh();
		CartDAO cartDAO=(CartDAO)context.getBean("cartDAO");
		Cart cart;
		Scanner input=new Scanner(System.in);
		int i;
			System.out.println("====Select an option====");
			System.out.println("1. Insert cart");
			System.out.println("2. Update cart");
			System.out.println("3. Delete cart");
			System.out.println("4. Retrieve cart");
			System.out.println("5. Show all cart");
			System.out.println("Enter your choice : ");
			i=input.nextInt();
			switch(i){
			case 1:
				cart=new Cart();
				cart.setCart_id(1001);
				cart.setUsername("himanshu1234");
				cart.setProd_name("Kenstar");
				cart.setProd_id(2);
				cart.setPrice(14000);
				cart.setQuantity(3);
				cart.setStatus("N");
				cartDAO.insertOrUpdateCart(cart);		
				System.out.println("Cart Inserted");
				break;
			case 2:
				System.out.println("Enter Cart item id : ");
				i=input.nextInt();
				cart=cartDAO.getCartItem(i);
				cart.setQuantity(5);
				cartDAO.insertOrUpdateCart(cart);
				System.out.println("The Cart Updated");
				break;
			case 3:
				System.out.println("Enter Cart item ID : ");
				i=input.nextInt();
				cart=cartDAO.getCartItem(i);
				cartDAO.deleteCartItem(cart);
				System.out.println("The Cart Deleted");
				break;
			case 4:
				System.out.println("Enter Cart item ID : ");
				i=input.nextInt();
				cart=cartDAO.getCartItem(i);
				System.out.println(cart.getCart_id()+":"+cart.getProd_name()+":"+cart.getProd_id()+":"+cart.getPrice()+":"+cart.getQuantity()+":"+cart.getUsername());
				break;
			case 5:
				List<Cart> list=cartDAO.getCartItems("himanshu1234");
				for(Cart cart2:list)
				{
					System.out.println(cart2.getCart_id()+":"+cart2.getProd_name()+":"+cart2.getProd_id()+":"+cart2.getPrice()+":"+cart2.getQuantity()+":"+cart2.getUsername());
				}
				break;
			default:
				System.out.println("Invalid operation");
			
			}
			input.close();
			context.close();
}

}
