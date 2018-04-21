package com.skilldistillery.jpacrud.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jpacrud.data.AddressDAO;
import com.skilldistillery.jpacrud.data.CategoryDAO;
import com.skilldistillery.jpacrud.data.RestaurantDAO;
import com.skilldistillery.jpacrud.entities.Address;
import com.skilldistillery.jpacrud.entities.Category;
import com.skilldistillery.jpacrud.entities.Restaurant;

@Controller
public class EatsController {
	@Autowired
	private RestaurantDAO rDAO;
	@Autowired
	private AddressDAO aDAO;
	@Autowired
	private CategoryDAO cDAO;

	@RequestMapping(path = "/show.do", params = "rid", method = RequestMethod.GET)
	public ModelAndView index(int rid) {
		ModelAndView mv = new ModelAndView();
		Restaurant res = rDAO.retrieveById(rid);
		mv.addObject("restaurant", res);
		Address add = aDAO.retrieveById(res.getAddressId());
		mv.addObject("address", add);
		Category cat = cDAO.retrieveCategory(res.getCategoryId());
		mv.addObject("category", cat);
		mv.setViewName("WEB-INF/views/showRestaurant.jsp");
		return mv;

	}

	@RequestMapping(path = "/index.do", method = RequestMethod.GET)
	public ModelAndView showAll() {
		ModelAndView mv = new ModelAndView();
		List<Restaurant> restaurants = rDAO.retrieveAll();
		mv.addObject("restaurants", restaurants);
		mv.setViewName("WEB-INF/views/index.jsp");
		return mv;

	}

	@RequestMapping(path = "/create.do", method = RequestMethod.PUT)
	public String showCreatePage() {
		return "WEB-INF/views/create.jsp";

	}

	@RequestMapping(path = "update.do", method = RequestMethod.PUT)
	public String showUpdatePage() {
		return "WEB-INF/views/update.jsp";

	}

	@RequestMapping(path = "delete.do", method = RequestMethod.PUT)
	public String showDeletePage() {
		return "WEB-INF/views/delete.jsp";

	}

	public ModelAndView create(String name, double minPrice, double maxPrice, int categoryId, Category category,
			int addressId, Address address, String imageUrl) {
		ModelAndView mv = new ModelAndView();
		Restaurant createdRest = new Restaurant(name, minPrice, maxPrice, categoryId, category, addressId, address,
				imageUrl);
		mv.addObject("restaurant", createdRest);
		mv.setViewName("redirect:WEB-INF/views/created.jsp");
		return mv;
	}

}
