package com.ensa.back.dao;

import java.util.List;

import com.ensa.back.dto.Cart;
import com.ensa.back.dto.CartLine;



public interface CartLineDAO {

	// common methods
		public CartLine get(int id);	
		public boolean add(CartLine cartLine);
		public boolean update(CartLine cartLine);
		public boolean delete(CartLine cartLine);
		public List<CartLine> list(int cartId);
		
		// other business method related to the cart lines
		public List<CartLine> listAvailable(int cartId);
		public CartLine getByCartAndProduct(int cartId, int productId);
		
		
		// udpate a cart
		boolean updateCart(Cart cart);	
}
