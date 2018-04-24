package com.skilldistillery.jpacrud.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.jpacrud.entities.Address;
import com.skilldistillery.jpacrud.entities.Category;
import com.skilldistillery.jpacrud.entities.Restaurant;

@Transactional
@Component
public class RestaurantDAOImpl implements RestaurantDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Restaurant create(Restaurant restaurant) {
//		restaurant.getCategory().setName(restaurant.getCategory().getName());
		em.persist(restaurant);
		em.flush();

		return restaurant;
	}

	@Override
	public Restaurant update(Restaurant restaurant, int id) {
		Restaurant updatedRest = em.find(Restaurant.class, id);
		updatedRest.setName(restaurant.getName());
		updatedRest.setImageUrl(restaurant.getImageUrl());
		updatedRest.setMinPrice(restaurant.getMinPrice());
		updatedRest.setMaxPrice(restaurant.getMaxPrice());
		updatedRest.setAddress(restaurant.getAddress());
		updatedRest.setAddress2(restaurant.getAddress2());
		updatedRest.setCity(restaurant.getCity());
		updatedRest.setState(restaurant.getState());
		updatedRest.setZipCode(restaurant.getZipCode());
		em.persist(updatedRest);
		em.flush();
		return updatedRest;
	}

	@Override
	public boolean delete(int id) {
		Restaurant rest = em.find(Restaurant.class, id);
		boolean deleted = false;
		try {
			em.remove(rest);
			deleted = true;
		} catch (IllegalArgumentException iae) {
			em.getTransaction().rollback();
		}
		return deleted;
	}

	@Override
	public Restaurant retrieveById(int id) {
		Restaurant res = null;
	
		try {
		res = em.find(Restaurant.class, id);
		String query = "SELECT c FROM Category c WHERE id =:id";
		Category cat = (Category) em.createQuery(query, Category.class).setParameter("id", res.getCategory().getId())
				.getSingleResult();
		res.setCategory(cat);
		} catch (NullPointerException e) {
			System.out.println("Not a valid id");
		}
		return res;
	}

	@Override
	public List<Restaurant> retrieveAll() {
		String query = "SELECT r FROM Restaurant r";
//		String categoryQuery = "SELECT c FROM Category c WHERE id =:catId";
		List<Restaurant> rests = em.createQuery(query, Restaurant.class).getResultList();
		if (rests != null) {

//			for (Restaurant r : rests) {
//				Category category = (Category) em.createQuery(categoryQuery, Category.class)
//						.setParameter("catId", r.getCategory().getId());
//				r.setCategory(category);
//			}
		}
		return rests;
	}

	// @Override
	// public List<Restaurant> retrieveAll() {
	// String query = "SELECT r FROM Restaurant r";
	// String categoryQuery = "SELECT c FROM Category c WHERE id =:catid";
	// String addressQuery = "SELECT a FROM Address a WHERE id =:addid";
	// List<Restaurant> rests = em.createQuery(query,
	// Restaurant.class).getResultList();
	// if (rests != null) {
	//
	// for (Restaurant r : rests) {
	// Category category = (Category) em.createQuery(categoryQuery, Category.class)
	// .setParameter("categoryId", r.getCategoryId()).getSingleResult();
	// r.setCategory(category);
	//
	// Address address = (Address) em.createQuery(addressQuery, Address.class)
	// .setParameter("addressId", r.getAddressId()).getSingleResult();
	// r.setAddress(address);
	// }
	// }
	// return rests;
	// }

}
