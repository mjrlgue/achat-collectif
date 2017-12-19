package com.ensa.front.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ensa.front.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartService cartService;
	
	
	@RequestMapping("/show")
	public ModelAndView accessDenied() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Votre Carte");
		mv.addObject("userClickShowCart", true);
		mv.addObject("cartLines", cartService.getCartLine());
		return mv;
	}
}
