package com.skilldistillery.jpacrud.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

@Entity
public class Restaurant {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	@Column(name = "phone_number")
	private String phoneNumber;

	@Column(name = "min_price")
	private double minPrice;

	@Column(name = "max_price")
	private double maxPrice;

	@Column(name = "category_id")
	private int categoryId;

	@Transient
	private Category category;

	@Column(name = "address_id")
	private Integer addressId;

	@Transient
	private Address address;

	@Column(name = "image_url")
	private String imageUrl;

	public Restaurant() {
		// TODO Auto-generated constructor stub
	}

	public Restaurant(String name, String phoneNumber, double minPrice, double maxPrice, int categoryId,
			String imageUrl) {
		super();
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.minPrice = minPrice;
		this.maxPrice = maxPrice;
		this.categoryId = categoryId;
		this.imageUrl = imageUrl;
	}

	public Restaurant(String name, double minPrice, double maxPrice, Category category, Address address,
			String imageUrl) {
		super();
		this.name = name;
		this.minPrice = minPrice;
		this.maxPrice = maxPrice;
		this.category = category;
		this.address = address;
		this.imageUrl = imageUrl;
	}

	public Restaurant(String name, double minPrice, double maxPrice, String imageUrl) {
		super();
		this.name = name;
		this.minPrice = minPrice;
		this.maxPrice = maxPrice;
		this.imageUrl = imageUrl;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public double getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(double d) {
		this.minPrice = d;
	}

	public double getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(double maxPrice) {
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

	public void setAddressId(Integer addressId) {
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

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Restaurants ").append("\nName:").append(name).append("Phone Number: ").append(phoneNumber)
				.append(", Minimum Price: $").append(minPrice).append(", Minimum Price: $").append(maxPrice)
				.append(", Category ID: ").append(categoryId).append(", Address ID: ").append(addressId)
				.append(", Image: ").append(imageUrl);
		return builder.toString();
	}

}
