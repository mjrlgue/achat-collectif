package com.ensa.front.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ensa.back.dao.ProductDAO;
import com.ensa.back.dto.Product;

//mapping url:
//json/data/all/products
//json/data/category/1/products
@Controller
@RequestMapping("/json/data")
public class JSONDataController {

	@Autowired
	private ProductDAO productDAO;
	
	//this controller only return data in form of JSON, add annotation '@ResponseBody'
	//to return the JSON in the current context, ie page.jsp
	@ResponseBody
	@RequestMapping("/all/products")
	public List<Product> getAllProduct(){
		return productDAO.listActiveProducts();
	}
	
	//p0507 list products for admin
	@ResponseBody
	@RequestMapping("/admin/all/products")
	public List<Product> getAllProductsForAdmin(){
		return productDAO.list();
	}
	
	@ResponseBody
	@RequestMapping("/category/{id}/products")
	public List<Product> getProductsByCategory(@PathVariable int id){
		return productDAO.listActiveProductsByCategory(id);
	}
}
