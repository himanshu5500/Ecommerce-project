package com.myshoppro.myshopprofrontend;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myshoppro.myshopprobackend.dao.CategoryDAO;
import com.myshoppro.myshopprobackend.dao.HomeProductsDAO;
import com.myshoppro.myshopprobackend.model.Category;
import com.myshoppro.myshopprobackend.model.HomeProducts;

@Controller
public class PageController {
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	HomeProductsDAO homeProductsDAO;
	
	@RequestMapping(value={"index","home","/"})
	public ModelAndView index(){
		ModelAndView m=new ModelAndView("index");
		List<HomeProducts> list=homeProductsDAO.getHomeProductsList();
		m.addObject("homeProducts",list);
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
