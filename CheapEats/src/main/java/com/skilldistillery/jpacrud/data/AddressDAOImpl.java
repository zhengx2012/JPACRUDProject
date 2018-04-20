package com.skilldistillery.jpacrud.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.jpacrud.entities.Address;

@Transactional
@Component
public class AddressDAOImpl implements AddressDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public Address retrieveById(int id) {
		Address add = em.find(Address.class, id);
		return add;
	}

}
