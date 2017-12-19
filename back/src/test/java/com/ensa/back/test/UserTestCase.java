package com.ensa.back.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.ensa.back.dao.UserDAO;
import com.ensa.back.dto.Address;
import com.ensa.back.dto.Cart;
import com.ensa.back.dto.User;



public class UserTestCase {


	private static AnnotationConfigApplicationContext context;
	private static UserDAO userDAO;
	private User user = null;
	private Cart cart = null;
	private Address address = null;
	
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.ensa.back");
		context.refresh();
		
		userDAO = (UserDAO) context.getBean("userDAO");
	}
	
	/*
	@Test
	public void testAdd() {
		
		
		user = new User() ;
		user.setFirstName("Marwane");
		user.setLastName("Chahoud");
		user.setEmail("abc@gmail.com");
		user.setContactNumber("123456");
		user.setRole("USER");
		user.setPassword("123456");

		// add the user
		assertEquals("Failed to add user!",true, userDAO.addUser(user));
		
		address = new Address();
		address.setAddressLineOne("LOT Wifaq N 02, 5272 rue alfalah");
		address.setAddressLineTwo("none");
		address.setCity("Temara");
		address.setState("Rabat-sale-zemmour-zear");
		address.setCountry("Maroc");
		address.setPostalCode("12041");
		address.setBilling(true);
		
		// link the user with the address using user id
		address.setUserId(user.getId());
		
		// add the address
		assertEquals("Failed to add address!",true, userDAO.addAddress(address));
		
		if(user.getRole().equals("USER")) {
			
			// create a cart for this user
			cart = new Cart();
			
			cart.setUser(user);

			// add the cart
			assertEquals("Failed to add cart!",true, userDAO.addCart(cart));
			
			// add a shipping address for this user

			address = new Address();
			address.setAddressLineOne("LOT Wifaq N 02, 5272 rue alfalah");
			address.setAddressLineTwo("none");
			address.setCity("Temara");
			address.setState("Rabat-sale-zemmour-zear");
			address.setCountry("Maroc");
			address.setPostalCode("12041");
			// set shipping to true
			address.setShipping(true);
			
			// link it with the user
			address.setUserId(user.getId());
			
			// add the shipping address
			assertEquals("Failed to add shipping address!",true, userDAO.addAddress(address));
		}
	}
	*/

	
	/*
	@Test
	public void testAdd() {
		
		
		user = new User() ;
		user.setFirstName("Marwane");
		user.setLastName("Chahoud");
		user.setEmail("abc@gmail.com");
		user.setContactNumber("123456");
		user.setRole("USER");
		user.setPassword("123456");

		
		
		if(user.getRole().equals("USER")) {
			
			// create a cart for this user
			cart = new Cart();
			
			cart.setUser(user);
			//attach cart with user
			user.setCart(cart);
		}
		// add the user
		assertEquals("Failed to add user!",true, userDAO.addUser(user));
	}
	*/
	
	/*
	@Test
	public void testUpdateCart() {
		
		// fetch the user by its email
		user = userDAO.getByEmail("abc@gmail.com");
		
		// get the cart of the user
		cart = user.getCart();
		
		cart.setGrandTotal(12345);
		
		cart.setCartLines(2);
		
		assertEquals("Failed to update the cart!", true, userDAO.updateCart(cart));
		
		
	}
	*/
	
	/*
	@Test
	public void testAddAddress() {
		
		// we need to add an user
		user = new User() ;
		user.setFirstName("Marwane");
		user.setLastName("Chahoud");
		user.setEmail("abc@gmail.com");
		user.setContactNumber("123456");
		user.setRole("USER");
		user.setPassword("123456");
		
		// add the user
		assertEquals("Failed to add user!",true, userDAO.addUser(user));
	
		
		// we are going to add the address
		
		address = new Address();
		address.setAddressLineOne("LOT Wifaq N 02, 5272 rue alfalah");
		address.setAddressLineTwo("none");
		address.setCity("Temara");
		address.setState("Rabat-sale-zemmour-zear");
		address.setCountry("Maroc");
		address.setPostalCode("12041");
		// set blling to true
		address.setBilling(true);	
		
		// attached the user to the address
		address.setUser(user);
		
		assertEquals("Failed to add address!", true, userDAO.addAddress(address));
		
		
		// we are also going to add the shipping address
		address = new Address();
		address.setAddressLineOne("LOT Wifaq N 02, 5272 rue alfalah");
		address.setAddressLineTwo("none");
		address.setCity("Temara");
		address.setState("Rabat-sale-zemmour-zear");
		address.setCountry("Maroc");
		address.setPostalCode("12041");
		// set shipping to true
		address.setShipping(true);
		
		// attached the user to the address
		address.setUser(user);
		
		assertEquals("Failed to add shipping address!", true, userDAO.addAddress(address));
		
	}
	*/
	
	/*
	@Test
	public void testAddAddress() {
		
		user = userDAO.getByEmail("abc@gmail.com");
		// we are also going to add the shipping address
				address = new Address();
				address.setAddressLineOne("LOT Wifaq N 02, 5272 rue alfalah");
				address.setAddressLineTwo("none");
				address.setCity("Rabat");
				address.setState("Casablanca");
				address.setCountry("Maroc");
				address.setPostalCode("1241");
				// set shipping to true
				address.setShipping(true);
				

				// attached the user to the address
				address.setUser(user);
				
				assertEquals("Failed to add shipping address!", true, userDAO.addAddress(address));
		
	}
	*/
	
	@Test
	public void testGetAddresses() {//get shipping adresses
		
		user = userDAO.getByEmail("abc@gmail.com");

		assertEquals("Failed to fetch the list of shipping address and size does not match!",2, 
				userDAO.listShippingAddresses(user).size());
		
		assertEquals("Failed to fetch the billing address and size does not match!","Temara", 
				userDAO.getBillingAddress(user).getCity());		
	}
}
