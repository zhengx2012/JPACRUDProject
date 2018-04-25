package com.skilldistillery.jpacrud.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
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

	@ManyToOne
	@JoinColumn(name = "category_id")
//	@Transient
	private Category category;

	// @Column(name = "address_id")
	// private Integer addressId;
	//
	// @Transient
	// private Address address;

	@Column(name = "image_url")
	private String imageUrl;

	private String address;

	private String address2;

	private String city;

	private String state;

	@Column(name = "zip_code")
	private String zipCode;

	public Restaurant() {
		// TODO Auto-generated constructor stub
	}

	public Restaurant(String name, String phoneNumber, double minPrice, double maxPrice, String address,
			String address2, String state, String city, String zipCode, String imageUrl) {
		super();
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.minPrice = minPrice;
		this.maxPrice = maxPrice;
		this.address = address;
		this.address2 = address2;
		this.state = state;
		this.city = city;
		this.zipCode = zipCode;
		this.imageUrl = imageUrl;
	}

	public Restaurant(String name, String phoneNumber, double minPrice, double maxPrice, String imageUrl) {
		super();
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.minPrice = minPrice;
		this.maxPrice = maxPrice;
		this.imageUrl = imageUrl;
	}

	public Restaurant(String name, double minPrice, double maxPrice, String imageUrl) {
		super();
		this.name = name;
		this.minPrice = minPrice;
		this.maxPrice = maxPrice;
		this.imageUrl = imageUrl;
	}
	

	public Restaurant(String name, String phoneNumber, double minPrice, double maxPrice, Category category,
			String imageUrl, String address, String address2, String city, String state, String zipCode) {
		super();
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.minPrice = minPrice;
		this.maxPrice = maxPrice;
		this.category = category;
		this.imageUrl = imageUrl;
		this.address = address;
		this.address2 = address2;
		this.city = city;
		this.state = state;
		this.zipCode = zipCode;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	// public Address getAddress() {
	// return address;
	// }
	//
	// public void setAddress(Address address) {
	// this.address = address;
	// }
	

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Restaurants ").append("\nName:").append(name).append("Phone Number: ").append(phoneNumber)
				.append("Address: ").append(address).append(" ").append(address2).append(", ").append(city).append(", ")
				.append(state).append(", ").append(zipCode).append(", Minimum Price: $").append(minPrice)
				.append(", Minimum Price: $").append(maxPrice).append(", Image: ").append(imageUrl);
		return builder.toString();
	}

}
