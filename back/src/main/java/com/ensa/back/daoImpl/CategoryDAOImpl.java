package com.ensa.back.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ensa.back.dao.CategoryDAO;
import com.ensa.back.dto.Category;

@Repository("categoryDAO")
@Transactional
public class CategoryDAOImpl implements CategoryDAO {

	@Autowired
	private SessionFactory sessionFactory;
	private static List<Category> categories = new ArrayList<>();
	
//	static {
//		Category category = new Category();
//		
//		//1
//		category.setId(1);
//		category.setName("Television");
//		category.setDescription("A television Samsung");
//		category.setImageURL("tv_1.png");
//		categories.add(category);
//		
//		//2
//		category = new Category();
//		category.setId(2);
//		category.setName("Laptop");
//		category.setDescription("A laptop Samsung");
//		category.setImageURL("laptop_1.png");
//		categories.add(category);
//		
//		//3
//		category = new Category();
//		category.setId(3);
//		category.setName("Mobile");
//		category.setDescription("A Mobile samsung");
//		category.setImageURL("mobile_1.png");
//		categories.add(category);
//	}
	
	//Get a single category from id
	@Override
	public Category get(int id) {
		// TODO Auto-generated method stub
//		for(Category category : categories) {
//			if(category.getId()==id) return category;
//		}
		return sessionFactory.getCurrentSession().get(Category.class, Integer.valueOf(id));
	}

	@Override
	public List<Category> list() {
		// TODO Auto-generated method stub
		//1: select ACTIVE category
		//2: return the list
		String selectActiveCategory = "FROM Category WHERE active = :active";
		Query query = sessionFactory.getCurrentSession().createQuery(selectActiveCategory);
		query.setParameter("active", true);
		return query.getResultList();
	}

	@Override
	public boolean add(Category category) {
		// TODO Auto-generated method stub
		try {
			// add the category to the database table
			sessionFactory.getCurrentSession().persist(category);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean update(Category category) {
		// TODO Auto-generated method stub
		try {
			// add the category to the database table
			sessionFactory.getCurrentSession().update(category);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean delete(Category category) {
		// TODO Auto-generated method stub
		category.setActive(false);
		try {
			// add the category to the database table
			sessionFactory.getCurrentSession().update(category);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

}
