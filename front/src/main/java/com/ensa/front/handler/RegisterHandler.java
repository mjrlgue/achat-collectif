package com.ensa.front.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.stereotype.Component;

import com.ensa.back.dao.UserDAO;
import com.ensa.back.dto.Address;
import com.ensa.back.dto.Cart;
import com.ensa.back.dto.User;
import com.ensa.front.model.RegisterModel;

//p0609 make it bean
@Component
public class RegisterHandler {
	
	@Autowired
	private UserDAO userDAO;
	
	public RegisterModel init() {
		
		return new RegisterModel();
	}

	public void addUser(RegisterModel registerModel, User user) {
		registerModel.setUser(user);
	}

	public void addBilling(RegisterModel registerModel, Address billing) {
		registerModel.setBilling(billing);
	}
	
	public String saveAll(RegisterModel registerModel) {
		String transitionValue = "success";
		
		//fetch user
		User user = registerModel.getUser();
		
		if(user.getRole().equals("USER")) {
			Cart cart = new Cart();
			cart.setUser(user);
			user.setCart(cart);
		}
		//save the user
		userDAO.addUser(user);
		
		//get the adress
		Address billing = registerModel.getBilling();
		billing.setUserId(user.getId());
		billing.setBilling(true);
		
		//save address
		userDAO.addAddress(billing);
		
		return transitionValue;
	}
	
	//p0610
	
	public String validateUser(User user, MessageContext error) {
		
		String transitionValue="success";
		
		//check if password matches confirm password
		if(!(user.getPassword().equals(user.getConfirmPassword()))) {
			
			error.addMessage(new MessageBuilder().error()
					.source("confirmPassword").
					defaultText("Mot de passe incorrect !").build());
			
			transitionValue = "failure";
		}
		
		//check uniqueness of the email
		if(userDAO.getByEmail(user.getEmail()) != null) {
			
			error.addMessage(new MessageBuilder().error()
					.source("email").
					defaultText("Email deja utilise !").build());
			transitionValue = "failure";
		}
		return transitionValue;
	}
}
