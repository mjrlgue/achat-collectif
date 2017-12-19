package com.ensa.back.dao;

import java.util.List;

import com.ensa.back.dto.Address;
import com.ensa.back.dto.Cart;
import com.ensa.back.dto.User;


public interface UserDAO {

	// add an user
		boolean addUser(User user);
		//p0603 update cart user by this method
		User getByEmail(String email);
		
		// add an address
		boolean addAddress(Address address);
		
		//p0603 update a cart
		boolean updateCart(Cart cart);
		// p0604
		 Address getBillingAddress(User user);
		 List<Address> listShippingAddresses(User user);

}
