package com.myshoppro.myshopprofrontend;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myshoppro.myshopprobackend.dao.CategoryDAO;
import com.myshoppro.myshopprobackend.dao.HomeProductsDAO;
import com.myshoppro.myshopprobackend.dao.ProductDAO;
import com.myshoppro.myshopprobackend.model.Category;
import com.myshoppro.myshopprobackend.model.HomeProducts;
import com.myshoppro.myshopprobackend.model.Product;

@Controller
public class PageController {
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	HomeProductsDAO homeProductsDAO;
	@Autowired
	ProductDAO productDAO;
	
	@RequestMapping(value={"index","home","/"})
	public ModelAndView index(){
		ModelAndView m=new ModelAndView("index");
		List<HomeProducts> list=homeProductsDAO.getHomeProductsList();
		m.addObject("homeProducts",list);
		return m;
	}
	@RequestMapping("/homeProducts")
	public ModelAndView homeProduct(@ModelAttribute("homeProduct") HomeProducts homeProduct){
		ModelAndView m=new ModelAndView("HomeProducts");
		List<HomeProducts> list=homeProductsDAO.getHomeProductsList();
		m.addObject("homeProducts",list);
		return m;
	}
	@RequestMapping("/updateHomeProducts")
	public ModelAndView updateHomeProduct(@RequestParam("id") int srNo){
		ModelAndView m=new ModelAndView("HomeProducts");
		HomeProducts homeProducts= homeProductsDAO.getHomeProducts(srNo);
		List<Product> pro_list=productDAO.getProductDetails();
		LinkedHashMap<Integer,String> prolist=new  LinkedHashMap<Integer,String>();
		for(Product product:pro_list)
			prolist.put(product.getPro_id(), product.getPro_name());
		List<HomeProducts> list=homeProductsDAO.getHomeProductsList();
		m.addObject("homeProducts",list);
		m.addObject("prolist",prolist);
		m.addObject("homeProduct",homeProducts);
		m.addObject("flag",true);
		return m;
	}
	@RequestMapping("/updateHomeProduct")
	public ModelAndView updateHomeProduct(@ModelAttribute("homeProduct") HomeProducts homeProduct){
		ModelAndView m=new ModelAndView("redirect:homeProducts");
		homeProductsDAO.insertOrUpdateHomeProducts(homeProduct);
		return m;
	}
	
	@RequestMapping("aboutUs")
	public String Test(){
		return "AboutUs";
	}
	@ModelAttribute
	public void homeCatDetails(Model m){
		List<Category> list=categoryDAO.getCategoryDetails();
		m.addAttribute("catDetails",list);
	}
	

}
