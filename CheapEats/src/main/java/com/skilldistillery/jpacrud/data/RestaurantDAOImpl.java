package com.skilldistillery.jpacrud.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.jpacrud.entities.Restaurant;

@Transactional
@Component
public class RestaurantDAOImpl implements RestaurantDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Restaurant create(Restaurant restaurant) {

		return null;
	}

	@Override
	public Restaurant update(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Restaurant delete(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Restaurant retrieveById(int id) {
		Restaurant res = em.find(Restaurant.class, id);
		return res;
	}

	@Override
	public List<Restaurant> retrieveAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
