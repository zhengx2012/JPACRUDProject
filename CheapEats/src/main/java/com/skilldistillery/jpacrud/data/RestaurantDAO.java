package com.skilldistillery.jpacrud.data;

import java.util.List;

import com.skilldistillery.jpacrud.entities.Restaurant;

public interface RestaurantDAO {
	Restaurant create(Restaurant restaurant);
	Restaurant retrieveById(int id);
	List<Restaurant> retrieveAll();
	Restaurant update(Restaurant restaurant, int id);
	boolean delete(int id);
	
}
