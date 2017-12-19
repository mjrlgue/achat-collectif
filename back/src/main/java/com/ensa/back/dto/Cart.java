package com.ensa.back.dto;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;


@Entity
public class Cart implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/*
	 * private fields
	 * */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	/*----p0602----*/
	@OneToOne
	private User user;
		
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	/*--------*/
//	//p0602 add relation OneToOne
//	@Column(name = "user_id")
//	private int user_id;
//	public int getUser_id() {
//		return user_id;
//	}
//	public void setUser_id(int user_id) {
//		this.user_id = user_id;
//	}


	@Column(name = "grand_total")	
	private double grandTotal;
	@Column(name = "cart_lines")
	private int cartLines;
	
	/*
	 * setter and getters for the fields
	 * */
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double getGrandTotal() {
		return grandTotal;
	}
	public void setGrandTotal(double grandTotal) {
		this.grandTotal = grandTotal;
	}
	public int getCartLines() {
		return cartLines;
	}
	public void setCartLines(int cartLines) {
		this.cartLines = cartLines;
	}
	
	
	@Override
	public String toString() {
		return "Cart [id=" + id + ", grandTotal=" + grandTotal + ", cartLines=" + cartLines + "]";
	}
	
}
