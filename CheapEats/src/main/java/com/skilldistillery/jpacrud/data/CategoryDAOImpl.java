package com.skilldistillery.jpacrud.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.jpacrud.entities.Category;

@Transactional
@Component
public class CategoryDAOImpl implements CategoryDAO {
	@PersistenceContext
	EntityManager em;

	@Override
	public Category retrieveCategory(int id) {
		Category cat = em.find(Category.class, id);
		return cat;
	}

}
