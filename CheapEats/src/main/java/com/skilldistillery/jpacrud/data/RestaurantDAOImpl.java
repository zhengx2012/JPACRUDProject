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

		return null;
	}

	@Override
	public Restaurant update(Restaurant restaurant, int id) {
		Restaurant updatedRest = em.find(Restaurant.class, id);
		updatedRest.setName(restaurant.getName());
		updatedRest.setImageUrl(restaurant.getImageUrl());
		updatedRest.setMinPrice(restaurant.getMinPrice());
		updatedRest.setMaxPrice(restaurant.getMaxPrice());
		updatedRest.setAddress(restaurant.getAddress());
		updatedRest.setCategory(restaurant.getCategory());
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
		}
		catch(IllegalArgumentException iae) {
			em.getTransaction().rollback();
		}
		return deleted;
	}

	@Override
	public Restaurant retrieveById(int id) {
		Restaurant res = em.find(Restaurant.class, id);
		String query = "SELECT c FROM Category c WHERE id =:id";
		Category cat = (Category) em.createQuery(query, Category.class).setParameter("id", res.getCategoryId())
				.getSingleResult();
		res.setCategory(cat);
		return res;
	}

	@Override
	public List<Restaurant> retrieveAll() {
		String query = "SELECT r FROM Restaurant r";
		String categoryQuery = "SELECT c FROM Category c WHERE id =:catid";
		String addressQuery = "SELECT a FROM Address a WHERE id =:addid";
		List<Restaurant> rests = em.createQuery(query, Restaurant.class).getResultList();
		if (rests != null) {

			for (Restaurant r : rests) {
				Category category = (Category) em.createQuery(categoryQuery, Category.class)
						.setParameter("catid", r.getCategoryId()).getSingleResult();
				r.setCategory(category);

				Address address = (Address) em.createQuery(addressQuery, Address.class)
						.setParameter("addid", r.getAddressId()).getSingleResult();
				r.setAddress(address);
			}
		}
		return rests;
	}

}
