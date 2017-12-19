package com.ensa.front.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ensa.back.dao.CategoryDAO;
import com.ensa.back.dao.ProductDAO;
import com.ensa.back.dto.Category;
import com.ensa.back.dto.Product;
import com.ensa.front.exception.ProductNotFoundException;

@Controller
public class PageController {
	//p0406
	private static final Logger logger = LoggerFactory.getLogger(PageController.class);

	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private ProductDAO productDAO;
	
	@RequestMapping(value= {"/", "/home", "/index"})
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title","Home");
		
		//p0406 logger
		logger.info("Inside PageController index method, MODE = INFO");
		logger.info("Inside PageController index method, MODE = DEBUG");
		
		//passing list of categories
		mv.addObject("categories", categoryDAO.list());
		mv.addObject("userClickHome",true);
		return mv;
	}
	@RequestMapping(value= "/about")
	public ModelAndView about() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title","About Us");
		mv.addObject("userClickAbout",true);
		return mv;
	}

	@RequestMapping(value= "/contact")
	public ModelAndView contact() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title","Contact Us");
		mv.addObject("userClickContact",true);
		return mv;
	}
	
	/*
	 * Methods to load all the products and based on category
	 * */
	
	@RequestMapping(value = "/show/all/products")
	public ModelAndView showAllProducts() {		
		ModelAndView mv = new ModelAndView("page");		
		mv.addObject("title","All Products");
		
		//passing the list of categories
		mv.addObject("categories", categoryDAO.list());
		
		mv.addObject("userClickAllProducts",true);
		return mv;				
	}
	
	/*
	 * Methods to load a specific products on click in list category
	 * */
	
	@RequestMapping(value = "/show/category/{id}/products")
	public ModelAndView showCategoryProducts(@PathVariable("id") int id) {		
		ModelAndView mv = new ModelAndView("page");
		
		//categoryDAO to fetch single category
		Category category = null;
		category = categoryDAO.get(id);
		mv.addObject("title",category.getName());
		
		//passing the list of categories
		mv.addObject("categories", categoryDAO.list());
		
		//passing the single category object
		mv.addObject("category", category);
		//userClickCategoryProducts
		mv.addObject("userClickCategoryProducts",true);
		return mv;				
	}
	
	//viewing a single product
	@RequestMapping(value="/show/{id}/product")
	public ModelAndView showSingleProduct(@PathVariable int id) throws ProductNotFoundException {
		
		ModelAndView mv = new ModelAndView("page");
		Product product = productDAO.get(id);
		//throw exception
		if(product == null) throw new ProductNotFoundException();
		
		product.setViews(product.getViews() + 1);
		//update the view after incrementing it !
		productDAO.update(product);
		//
		mv.addObject("title", product.getName());
		mv.addObject("product", product);
		mv.addObject("userClickShowProduct", true);
		return mv;
	}
	
	//p0607
	//having similar mapping to our flow id, so we can't acces to the flow,
	//it gives priority to the request mapping, solution: modify dispatcher-servlet

	@RequestMapping(value= "/register")
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title","About Us");
		return mv;
	}
	
	//login
	@RequestMapping(value= "/login")
	public ModelAndView login(@RequestParam(name ="error", required=false)String error,
			@RequestParam(name ="logout", required=false)String logout) {
		ModelAndView mv = new ModelAndView("login");
		
		if(error != null) {
			mv.addObject("message", "username/password invalide !");
		}
		if(logout != null) {
			mv.addObject("logout", "Vosu avez ete deconnecte !");
		}
		mv.addObject("title","Login");
		return mv;
	}
	
	//access-denied page
		@RequestMapping(value= "/access-denied")
		public ModelAndView accessDenied() {
			ModelAndView mv = new ModelAndView("error");
			mv.addObject("title","403 - Access denied");
			mv.addObject("errorTitle","Nice try");
			mv.addObject("errorDescription","Vous n'etes pas autoriser pour acceder cette page");
			return mv;
		}
	
		//logout
		
		@RequestMapping(value="/perform-logout")
		public String logout(HttpServletRequest request, HttpServletResponse response) {
			
			//first we are going to fetch authentication
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			
			if(auth != null) {
				new SecurityContextLogoutHandler().logout(request, response, auth);
			}
				
			return "redirect:/login?logout";
		}
	
		

		//stats
			@RequestMapping(value= "/stats")
			public ModelAndView stats() {
				ModelAndView mv = new ModelAndView("page");
				mv.addObject("userClickStats", true);
				
				return mv;
			}
	
}
