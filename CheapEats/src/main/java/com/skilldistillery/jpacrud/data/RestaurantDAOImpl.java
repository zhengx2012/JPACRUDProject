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
		String query ="INSERT INTO Restaurant ("

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
