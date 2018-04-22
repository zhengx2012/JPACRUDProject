package com.skilldistillery.jpacrud.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class RestaurantTest {
	private EntityManagerFactory emf;
	private EntityManager em;
	Restaurant restaurant;

	@BeforeEach
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("CheapEatsApp");
		em = emf.createEntityManager();
		restaurant = new Restaurant();
	}

	@AfterEach
	public void tearDown() throws Exception {
		em.close();
		emf.close();
		restaurant = null;
	}

	@Test
	@DisplayName("Test Restaurant entity mapping")
	void test_restaurant_mapping() {
		restaurant = em.find(Restaurant.class, 1);
		assertEquals("Lazo Empanadas", restaurant.getName());
		assertEquals("(303) 296-6710", restaurant.getPhoneNumber());
		assertEquals(1.5, restaurant.getMinPrice());
		assertEquals(5.5, restaurant.getMaxPrice());
	}

}
