package com.ensa.back.dto;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name="Product_subscribe", uniqueConstraints = @UniqueConstraint(columnNames= {"product_id", "user_id"}))
public class ProductSubscribe {

	public static final short SUBSCRIBE_VALUE = 1;
	public static final short DEFAULT = 0;
	

	    protected short value;

	    @Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long Id;

	    @ManyToOne(fetch = FetchType.LAZY)
	    @JoinColumn(name = "user_id", nullable = false)
	    protected User user;

	    @ManyToOne(fetch = FetchType.LAZY)
	    @JoinColumn(name = "Product_id", nullable = false)
	    private Product Product;

	    public void ProductSubscribing(User user, short value,Product Product) {
	        this.user = user;
	        this.Product = Product;
	        this.value = value;
	    }

	    public ProductSubscribe() {

	    }

	    public Long getId() {
	        return Id;
	    }

	    public void setId(Long id) {
	        Id = id;
	    }

	    public Product getProduct() {
	        return Product;
	    }

	    public void setProduct(Product Product) {
	        this.Product = Product;
	    }

	    public User getUser() {
	        return user;
	    }

	    public void setUser(User user) {
	        this.user = user;
	    }

	    public short getValue() {
	        return value;
	    }

	    public void setValue(short value) {
	        this.value = value;
	    }
	
	
	
	
}
