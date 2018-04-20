package com.skilldistillery.jpacrud.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Restaurant {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	@Column(name = "min_price")
	private int minPrice;

	@Column(name = "max_price")
	private int maxPrice;

	@Column(name = "category_id")
	private int categoryId;

	@Column(name = "address_id")
	private int addressId;
	
	@Column(name="image_url")
	private String imageUrl;

	public Restaurant() {
		// TODO Auto-generated constructor stub
	}

	public Restaurant(String name, int minPrice, int maxPrice, int categoryId, int addressId, String imageUrl) {
		super();
		this.name = name;
		this.minPrice = minPrice;
		this.maxPrice = maxPrice;
		this.categoryId = categoryId;
		this.addressId = addressId;
		this.imageUrl = imageUrl;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}

	public int getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

	public int getId() {
		return id;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Restaurants ").append("\nName:").append(name).append(", Minimum Price: $").append(minPrice)
				.append(", Minimum Price: $").append(maxPrice).append(", Category ID: ").append(categoryId)
				.append(", Address ID: ").append(addressId).append(", Image: ").append(imageUrl);
		return builder.toString();
	}

}
