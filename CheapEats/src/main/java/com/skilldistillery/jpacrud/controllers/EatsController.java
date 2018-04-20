package com.skilldistillery.jpacrud.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jpacrud.data.AddressDAO;
import com.skilldistillery.jpacrud.data.AddressDAOImpl;
import com.skilldistillery.jpacrud.data.RestaurantDAO;
import com.skilldistillery.jpacrud.data.RestaurantDAOImpl;
import com.skilldistillery.jpacrud.entities.Address;
import com.skilldistillery.jpacrud.entities.Restaurant;

@Controller
public class EatsController {
	@Autowired
	private RestaurantDAO rDAO;
	@Autowired
	private AddressDAO aDAO;

	@RequestMapping(path = "index.do", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		Restaurant res = rDAO.retrieveById(1);
		int addId = res.getAddressId();
		System.out.println(addId);
		mv.addObject("restaurant", res);
		Address add = aDAO.retrieveById(addId);
		mv.addObject("address", add);
		mv.setViewName("WEB-INF/views/index.jsp");
		return mv;

	}

	// @RequestMapping(path = "index.do", method = RequestMethod.GET)
	// public ModelAndView show() {
	// ModelAndView mv = new ModelAndView();
	// List<Restaurant> restaurants = new ArrayList<>();
	// mv.addObject("restaurants", restaurants);
	// mv.setViewName("WEB-INF/views/index.jsp");
	// return mv;
	//
	// }
}
