package com.myshoppro.myshopprofrontend;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.myshoppro.myshopprobackend.dao.CategoryDAO;
import com.myshoppro.myshopprobackend.model.Category;

@Controller
public class CategoryController {
	@Autowired
	CategoryDAO categoryDAO;
	
	@RequestMapping("/Category")
	public ModelAndView showCategoryPage()
	{	ModelAndView m=new ModelAndView("Category");
		List<Category> list=categoryDAO.getCategoryDetails();
		m.addObject("catDetails",list);
		boolean flag=false;
		m.addObject("flag",flag);
		return m;
	}
	
	@RequestMapping(value="/addCategory",method=RequestMethod.POST)
	public ModelAndView addCategory(@RequestParam("name") String cat_name,@RequestParam("desc") String cat_desc,@RequestParam("home_cat") String home_cat){
		ModelAndView m=new ModelAndView("Category");
		Category category=new Category();
		category.setHome_cat(home_cat);
		category.setCat_desc(cat_desc);
		category.setCat_name(cat_name);
		categoryDAO.insertOrUpdateCategory(category);
		List<Category> list=categoryDAO.getCategoryDetails();
		m.addObject("catDetails",list);
		boolean flag=false;
		m.addObject("flag",flag);
		return m;
	}
	
	@RequestMapping("/deleteCategory")
	public ModelAndView deleteCategory(@RequestParam("catId") int catId){
		ModelAndView m=new ModelAndView();
		Category category=categoryDAO.getCategory(catId);
		try{categoryDAO.deleteCategory(category);
		m.setViewName("redirect:Category");
		}
		catch(Exception e){
			List<Category> list=categoryDAO.getCategoryDetails();
			m.addObject("catDetails",list);
			boolean flag=false;
			m.addObject("flag",flag);
			m.addObject("warning","Edit the Assosiated Products First");
			m.setViewName("Category");
		}
		return m;
	}
	
	@RequestMapping("/updateCategory/{catId}")
	public ModelAndView updateCategory(@PathVariable("catId") int catId){
		ModelAndView m=new ModelAndView("Category");
		Category category=categoryDAO.getCategory(catId);
		m.addObject("category",category);
		List<Category> list=categoryDAO.getCategoryDetails();
		m.addObject("catDetails",list);
		boolean flag=true;
		m.addObject("flag",flag);
		return m;
	}

	@RequestMapping(value="/updateCategory",method=RequestMethod.POST)
	public ModelAndView update_Category(@RequestParam("catId") int catid,@RequestParam("home_cat") String home_cat,@RequestParam("name") String cat_name,@RequestParam("desc") String cat_desc){
		ModelAndView m=new ModelAndView("Category");
		Category category=new Category();
		category.setCat_id(catid);
		category.setHome_cat(home_cat);
		category.setCat_desc(cat_desc);
		category.setCat_name(cat_name);
		categoryDAO.insertOrUpdateCategory(category);
		List<Category> list=categoryDAO.getCategoryDetails();
		m.addObject("catDetails",list);
		boolean flag=false;
		m.addObject("flag",flag);
		return m;
	}
	
}
