package com.ensa.front.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ensa.back.dao.CartLineDAO;
import com.ensa.back.dto.Cart;
import com.ensa.back.dto.CartLine;
import com.ensa.front.model.UserModel;

@Service("cartService")
public class CartService {

	@Autowired
	private CartLineDAO cartLineDAO;
	
	
	@Autowired
	private HttpSession session;
	
	//returns the cart of the user who's logged in
	private Cart getCart() {
		
		return ((UserModel)session.getAttribute("userModel")).getCart();
	}
	
	
	//fetch cartLine from DB and returns the entire cartLine
	
	
	public List<CartLine> getCartLine(){
		
		return cartLineDAO.list(this.getCart().getId());
	}
	
	
	
	
	
	
}
