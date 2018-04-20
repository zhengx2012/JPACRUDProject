package com.skilldistillery.jpacrud.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Address {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "phone_number")
	private String phoneNumber;

	private String address;
	private String city;
	private String state;

	@Column(name = "zip_code")
	private String zipCode;

	public Address() {
		// TODO Auto-generated constructor stub
	}

	public Address(String phoneNumber, String address, String city, String state, String zipCode) {
		super();
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zipCode = zipCode;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Phone Number: ").append(phoneNumber).append("\n").append("Address: ").append(address)
				.append(", ").append(city).append(", ").append(state).append(", ").append(zipCode);
		return builder.toString();
	}

}
