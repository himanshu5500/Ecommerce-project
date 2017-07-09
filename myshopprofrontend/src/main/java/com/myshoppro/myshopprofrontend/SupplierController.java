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
import com.myshoppro.myshopprobackend.dao.SupplierDAO;
import com.myshoppro.myshopprobackend.model.Category;
import com.myshoppro.myshopprobackend.model.Supplier;

@Controller
public class SupplierController {
	@Autowired
	SupplierDAO supplierDAO;
	@Autowired
	CategoryDAO categoryDAO;
	
	@RequestMapping("/Supplier")
	public ModelAndView showSupplierPage()
	{	ModelAndView m=new ModelAndView("Supplier");
		List<Supplier> list=supplierDAO.getSupplierDetails();
		m.addObject("supDetails",list);
		boolean flag=false;
		m.addObject("flag",flag);
		return m;
	}
	
	@RequestMapping(value="/addSupplier",method=RequestMethod.POST)
	public ModelAndView addSupplier(@RequestParam("name") String sup_name,@RequestParam("address") String sup_address){
		ModelAndView m=new ModelAndView("Supplier");
		Supplier supplier=new Supplier();
		supplier.setSup_address(sup_address);
		supplier.setSup_name(sup_name);
		supplierDAO.insertOrUpdateSupplier(supplier);
		List<Supplier> list=supplierDAO.getSupplierDetails();
		m.addObject("supDetails",list);
		boolean flag=false;
		m.addObject("flag",flag);
		return m;
	}
	
	@RequestMapping("/deleteSupplier")
	public ModelAndView deleteSupplier(@RequestParam("supId") int supId){
		ModelAndView m=new ModelAndView("Supplier");
		Supplier supplier=supplierDAO.getSupplier(supId);
		supplierDAO.deleteSupplier(supplier);
		List<Supplier> list=supplierDAO.getSupplierDetails();
		m.addObject("supDetails",list);
		boolean flag=false;
		m.addObject("flag",flag);
		return m;
	}
	
	@RequestMapping("/updateSupplier/{supId}")
	public ModelAndView updateSupplier(@PathVariable("supId") int supId){
		ModelAndView m=new ModelAndView("Supplier");
		Supplier supplier=supplierDAO.getSupplier(supId);
		m.addObject("supplier",supplier);
		List<Supplier> list=supplierDAO.getSupplierDetails();
		m.addObject("supDetails",list);
		boolean flag=true;
		m.addObject("flag",flag);
		return m;
	}

	@RequestMapping(value="/updateSupplier",method=RequestMethod.POST)
	public ModelAndView update_Supplier(@RequestParam("supId") int supid,@RequestParam("name") String sup_name,@RequestParam("address") String sup_address){
		ModelAndView m=new ModelAndView("Supplier");
		Supplier supplier=new Supplier();
		supplier.setSup_id(supid);
		supplier.setSup_address(sup_address);
		supplier.setSup_name(sup_name);
		supplierDAO.insertOrUpdateSupplier(supplier);
		List<Supplier> list=supplierDAO.getSupplierDetails();
		m.addObject("supDetails",list);
		boolean flag=false;
		m.addObject("flag",flag);
		return m;
	}
	@ModelAttribute
	public void homeCatDetails(Model m){
		List<Category> list=categoryDAO.getCategoryDetails();
		m.addAttribute("catDetails",list);
	}
}
