package com.ensa.front.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ensa.back.dao.CategoryDAO;
import com.ensa.back.dao.ProductDAO;
import com.ensa.back.dto.Category;
import com.ensa.back.dto.Product;
import com.ensa.front.utility.FileUploaderUtility;
import com.ensa.front.validator.ProductValidator;

//p0501
@Controller
@RequestMapping("/manage")
public class ManagementController {

	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired ProductDAO productDAO;
	
	//add a logger
	private static final Logger logger=LoggerFactory.getLogger(ManagementController.class);
	
	@RequestMapping(value="/products", method=RequestMethod.GET)
	public ModelAndView showManageProduct(@RequestParam(name="operation", required=false) String operation) {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("userClickManageProducts", true);
		mv.addObject("title", "Manage Products");
		//create new product and link it in form control with modelAttribute="product"
		Product newProduct = new Product();
		
		//set fields
		newProduct.setSupplierId(1);
		newProduct.setActive(true);
		mv.addObject("product", newProduct);
		if(operation != null) {
			if(operation.equals("product")) {
				mv.addObject("message", "Produit ajouté avec succès");
			}//p0511 add a new category
			else if(operation.equals("category")) {
				mv.addObject("message", "Catégorie ajouté avec succès");
			}
		}
		return mv;
	}
	
	//p0502
	//return list of categories
	@ModelAttribute("categories")
	public List<Category> getCategories() {
		return categoryDAO.list();
	}
	
	//p0503
	//handle product submission from form control
	@RequestMapping(value="/products", method=RequestMethod.POST)
	//@ModelAttribute("product") same name in form control: modelAttribute
	//p0504 adding @validate and BindingResult and Model
	//p0505 add a HttpRequest for uploading file
	public String handleProductSubmission(@Valid @ModelAttribute("product") Product mProduct,
											BindingResult results, Model model,
											HttpServletRequest request) {
		
		//p0506 validate file image
		//p0510 for update product, ignore validate image
		if(mProduct.getId() == 0) {

			new ProductValidator().validate(mProduct, results);
		}else {
			if(!mProduct.getFile().getOriginalFilename().equals("")) {
				new ProductValidator().validate(mProduct, results);
			}
		}
		
		
		
		//p0504 check if there are any errors
		if(results.hasErrors()) {
			
			model.addAttribute("userClickManageProducts", true);
			model.addAttribute("title", "Manage Products");
			model.addAttribute("message", "Echec de validation des champs !");
			return "page";
		}
		
		logger.info(mProduct.toString());
		
		//create a new product
		//p0510: check the id, if exist, it's an update, if it's not, it's an add
		if(mProduct.getId() == 0) {
			productDAO.add(mProduct);
			
		}else {
			//update product if id != 0
			productDAO.update(mProduct);
		}
		
		//p0505 uploading file
		if(!mProduct.getFile().getOriginalFilename().equals("")) {
			FileUploaderUtility.uploadFile(request, mProduct.getFile(), mProduct.getCode());
		}
		return "redirect:/manage/products?operation=product";
	}
	
	//p0509 create teh request mapping declared in activeMenu.js
	@RequestMapping(value="/product/{id}/activation", method=RequestMethod.POST)
	@ResponseBody
	public String handleProductActivationForAdmin(@PathVariable int id) {
		//get te product from db
		Product product = productDAO.get(id);
		
		boolean isActive = product.isActive();
		//activate/desativate depending on the initial vale stored in DB
		product.setActive(!product.isActive());
		//update product
		productDAO.update(product);
		
		
		return (isActive)? "Produit DESACTIVE avec succes, id= "+ product.getId() : 
							"Produit ACTIVE avec succes, id= "+ product.getId();
	}
	
	//p0510 updating existing product details when clicking details
	@RequestMapping(value="/{id}/product", method=RequestMethod.GET)
	public ModelAndView showEditProduct(@PathVariable int id) {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("userClickManageProducts", true);
		mv.addObject("title", "Manage Products");
		//fetch product from DB
		Product newProduct = productDAO.get(id);
		
		// set product fetched from DB
		mv.addObject("product", newProduct);
		
		return mv;
	}
	
	//p0511 handle category submission
	@RequestMapping(value="/category", method=RequestMethod.POST)
	public String handleCategorySubmission(@ModelAttribute Category category) {
		//add ne category
		categoryDAO.add(category);
		
		return "redirect:/manage/products?operation=category";
	}
		
	
	
	
	//p0511 create a modal for creating category
	@ModelAttribute("category")
	public Category getCategory() {
		return new Category();
	}
	
	
	
	
	
	
}
