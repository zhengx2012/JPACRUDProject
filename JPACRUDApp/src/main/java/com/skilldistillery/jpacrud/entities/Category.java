package com.skilldistillery.jpacrud.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "category_name")
	private String categoryName;

	@OneToMany(mappedBy = "category")
	private List<Restaurant> restaurants;

	public Category() {
	}

	public Category(String name) {
		super();
		this.categoryName = name;
	}

	// getters and setters
	public String getName() {
		return categoryName;
	}

	public void setName(String name) {
		this.categoryName = name;
	}

	public int getId() {
		return id;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public List<Restaurant> getRestaurants() {
		return restaurants;
	}

	public void setRestaurants(List<Restaurant> restaurants) {
		this.restaurants = restaurants;
	}

	// add and remove methods
	public void addRestaurant(Restaurant restaurant) {
		if (restaurant == null) {
			restaurants = new ArrayList<>();
		}
		if (!restaurants.contains(restaurant)) {
			restaurants.add(restaurant);
			if (restaurant.getCategory() != null) {
				restaurant.getCategory().getRestaurants().remove(restaurant);
			}
			restaurant.setCategory(this);
		}

	}

	public void removeRestaurant(Restaurant restaurant) {
		restaurant.setCategory(null);
		if (restaurants != null) {
			restaurants.remove(restaurant);
		}
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Category: ").append(categoryName);
		return builder.toString();
	}

}
