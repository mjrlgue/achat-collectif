package com.ensa.back.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.ensa.back.dao.CategoryDAO;
import com.ensa.back.dto.Category;

public class CategoryTestCase {

	private static AnnotationConfigApplicationContext context;
	private static CategoryDAO categoryDAO;
	private Category category;
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.ensa.back");
		context.refresh();
		categoryDAO = (CategoryDAO)context.getBean("categoryDAO");
	}
	
	
//	@Test
//	public void testAddCategory() {
//		
//		category = new Category();
//		
//		category.setName("Book");
//		category.setDescription("This is some description for laptop!");
//		category.setImageURL("CAT_105.png");
//		
//		assertEquals("Successfully added a category inside the table!",true,categoryDAO.add(category));
//		
//	}
	
	/*
	@Test
	public void testGetCategory() {
		
		category = categoryDAO.get(3);
		
		
		assertEquals("Successfully fetched a single category from the table!","Mobile",category.getName());
		
		
	}
	*/
	
/*
	@Test
	public void testUpdateCategory() {
		
		category = categoryDAO.get(3);
		category.setName("Phone");
		
		assertEquals("Successfully updated a single category in the table!",true,categoryDAO.update(category));
		
		
	}
*/
/*	
	@Test
	public void testDeleteCategory() {
		
		category = categoryDAO.get(3);
		
		assertEquals("Successfully deleted a single category in the table!",true,categoryDAO.delete(category));
		
		
	}
	*/
	
	/*
	@Test
	public void testListCategory() {
		
		assertEquals("Successfully fetched list of categories from the table!",8,categoryDAO.list().size());
		
		
	}
	*/
	
	//ALL CRUD TEST
	
	@Test
	public void testCRUDCategory() {
		
		// add operation
		category = new Category();
		
		category.setName("Watch");
		category.setDescription("This is some description for laptop!");
		category.setImageURL("ABC_8.png");
		
		assertEquals("Successfully added a category inside the table!",true,categoryDAO.add(category));
		
		
		category = new Category();
		
		category.setName("TV");
		category.setDescription("This is some description for television!");
		category.setImageURL("TV_55.png");
		
		assertEquals("Successfully added a category inside the table!",true,categoryDAO.add(category));

		
		// fetching and updating the category
		category = categoryDAO.get(2);
		
		category.setName("TVs");
		
		assertEquals("Successfully updated a single category in the table!",true,categoryDAO.update(category));
		
		
		// delete the category
		assertEquals("Successfully deleted a single category in the table!",true,categoryDAO.delete(category));
		
			
		//fetching the list
		assertEquals("Successfully fetched the list of categories from the table!",1,categoryDAO.list().size());		
				
		
	}
}
