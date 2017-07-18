package com.myshoppro.myshopprofrontend;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.LinkedHashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.myshoppro.myshopprobackend.dao.CategoryDAO;
import com.myshoppro.myshopprobackend.dao.ProductDAO;
import com.myshoppro.myshopprobackend.dao.SupplierDAO;
import com.myshoppro.myshopprobackend.model.Category;
import com.myshoppro.myshopprobackend.model.Product;
import com.myshoppro.myshopprobackend.model.Supplier;
@Controller
public class ProductController {
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	ProductDAO productDAO;
	@Autowired
	SupplierDAO supplierDAO;
	
	@RequestMapping("/Product")
	public ModelAndView showProductPage(@ModelAttribute("product") Product product)
	{	ModelAndView m=new ModelAndView("Product");
		List<Product> pro_list=productDAO.getProductDetails();
		m.addObject("suplist",this.getSupList());
		m.addObject("catlist",this.getCatList());
		m.addObject("proDetails",pro_list);
		m.addObject("flag",false);
		return m;
	}
	
	@RequestMapping(value="/addProduct",method=RequestMethod.POST)
	public ModelAndView addProduct(@ModelAttribute("product") Product product,@RequestParam("pro_image") MultipartFile image)
	{	ModelAndView m=new ModelAndView("Product");
		productDAO.insertOrUpdateProduct(product);
		String imgpath="C:\\Users\\MY LAPY\\Documents\\Project\\myshopprofrontend\\src\\main\\webapp\\resources\\images\\";
		String file_info=imgpath+product.getPro_id()+".jpg";
		System.out.println(file_info);
		File f=new File(file_info);
		if(!image.isEmpty()){
			try{
			byte buff[]=image.getBytes();
			BufferedOutputStream bs=new BufferedOutputStream(new FileOutputStream(f));
			bs.write(buff);
			bs.close();
			}
			catch(Exception e){
				System.out.println("Exception");
			}
		}
		List<Product> pro_list=productDAO.getProductDetails();
		m.addObject("suplist",this.getSupList());
		m.addObject("catlist",this.getCatList());
		m.addObject("proDetails",pro_list);
		m.addObject("flag",false);
		return m;
	}
	
	@RequestMapping("/deleteProduct")
	public ModelAndView deleteProduct(@RequestParam("proId") int proId,@ModelAttribute("product") Product product1)
	{	ModelAndView m=new ModelAndView("Product");
		Product product=productDAO.getProduct(proId);
		productDAO.deleteProduct(product);
		List<Product> pro_list=productDAO.getProductDetails();
		m.addObject("suplist",this.getSupList());
		m.addObject("catlist",this.getCatList());
		m.addObject("proDetails",pro_list);
		m.addObject("flag",false);
		return m;
	}

	@RequestMapping("/updateProduct")
	public ModelAndView updateProduct(@RequestParam("proId") int proId){
		ModelAndView m=new ModelAndView("Product");
		Product product=productDAO.getProduct(proId);
		m.addObject("product",product);
		List<Product> pro_list=productDAO.getProductDetails();
		m.addObject("suplist",this.getSupList());
		m.addObject("catlist",this.getCatList());
		m.addObject("proDetails",pro_list);
		m.addObject("flag",true);
		return m;
	}
	
	@RequestMapping("/viewProducts")
	public ModelAndView viewAllProduct(@RequestParam("id") int catId){
		ModelAndView m=new ModelAndView("ViewProducts");
		Category category=categoryDAO.getCategory(catId);
		List<Product> pro_list=productDAO.getProductCatWise(category);
		Gson g=new Gson();
		String product_list=g.toJson(pro_list);
		m.addObject("proDetails",product_list);
		m.addObject("catName",category.getCat_name());
		m.addObject("search","show");
		return m;	
	}
	
	@RequestMapping("/productDetails")
	public ModelAndView productDetails(@RequestParam("proid") int proId){
		ModelAndView m=new ModelAndView("ProductDetails");
		Product product=productDAO.getProduct(proId);
		m.addObject("product",product);
		return m;	
	}
	
	public LinkedHashMap<Integer, String> getSupList(){
		List<Supplier> sup_list=supplierDAO.getSupplierDetails();
		LinkedHashMap<Integer, String> suplist=new LinkedHashMap<Integer, String>();
		for(Supplier sup:sup_list){suplist.put(sup.getSup_id(),sup.getSup_name());}
		return suplist;
	}
	public LinkedHashMap<Integer, String> getCatList(){
		List<Category> cat_list=categoryDAO.getCategoryDetails();
		LinkedHashMap<Integer, String> catlist=new LinkedHashMap<Integer, String>();
		for(Category cat:cat_list){catlist.put(cat.getCat_id(),cat.getCat_name());}
		return catlist;
	}
	@ModelAttribute
	public void homeCatDetails(Model m){
		List<Category> list=categoryDAO.getCategoryDetails();
		m.addAttribute("catDetails",list);
	}
	
}
