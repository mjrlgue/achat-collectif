package com.ensa.back.dao;

import java.util.List;

import com.ensa.back.dto.Category;




public interface CategoryDAO {

	
	Category get(int id);
	List<Category> list();
	//CRUD
	boolean add(Category category);
	boolean update(Category category);
	boolean delete(Category category);
}
