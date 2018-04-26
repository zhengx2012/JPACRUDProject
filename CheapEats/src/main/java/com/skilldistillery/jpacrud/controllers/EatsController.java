package com.skilldistillery.jpacrud.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		try {
			Restaurant restaurant = rDAO.retrieveById(rid);
			mv.addObject("restaurant", restaurant);
			// Category category = cDAO.retrieveCategory(restaurant.getCategory());
			// mv.addObject("category", category);
			mv.setViewName("WEB-INF/views/showRestaurant.jsp");

		} catch (NullPointerException e) {
			mv.setViewName("redirect:notFound.do");
		}
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

	@RequestMapping(path = "/create.do", method = RequestMethod.GET)
	public String showCreatePage() {
		return "WEB-INF/views/create.jsp";

	}

	@RequestMapping(path = "/add.do", method = RequestMethod.POST)
	public ModelAndView addRestaurant(Restaurant rest, @RequestParam("categoryId") int categoryId) {
		ModelAndView mv = new ModelAndView();
//		Restaurant rest = new Restaurant(name, phoneNumber, minPrice, maxPrice, category, imageUrl, address, address2,
//				city, state, zipCode);
		System.out.println("**************************");
		System.out.println(rest);
		System.out.println("**************************");
		try {
			rest.setCategory(rDAO.getCategoryById(categoryId));
			Restaurant createdRest = rDAO.create(rest);
			mv.addObject("restaurant", createdRest);
			mv.setViewName("redirect:success.do");
		} catch (IllegalArgumentException e) {
			mv.setViewName("redirect:failure.do");
		}

		return mv;
	}

	@RequestMapping(path = "/update.do", method = RequestMethod.GET)
	public ModelAndView showUpdatePage(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView();
		try {
			Restaurant restaurant = rDAO.retrieveById(id);
			mv.addObject("restaurant", restaurant);
			mv.setViewName("WEB-INF/views/update.jsp");
		} catch (NullPointerException e) {
			mv.setViewName("redirect:notFound.do");
		}
		return mv;

	}

	@RequestMapping(path = "/updating.do", method = RequestMethod.POST)
	public ModelAndView updateRestaurant(String name, String phoneNumber, double minPrice, double maxPrice,
			Category category, String address, String address2, String city, String state, String zipCode,
			String imageUrl, int id) {
	
		ModelAndView mv = new ModelAndView();
		Restaurant rest = new Restaurant(name, phoneNumber, minPrice, maxPrice, category, imageUrl, address, address2, city,
				state, zipCode);
		Restaurant updatedRest = rDAO.update(rest, id);
		try {
			mv.addObject("restaurant", updatedRest);
			mv.setViewName("redirect:success.do");
		} catch(IllegalArgumentException e) {
			mv.setViewName("redirect:failure.do");
		}
		return mv;
	}

	@RequestMapping(path = "/delete.do", params = "id", method = RequestMethod.GET)
	public ModelAndView deleteRestaurant(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView();
		try {
			rDAO.delete(id);
			mv.setViewName("redirect:deleted.do");
		} catch (IllegalStateException e) {
			mv.setViewName("redirect:notFound.do");
		} catch (NullPointerException e) {
			mv.setViewName("redirect:notFound.do");
		}

		return mv;

	}

	@RequestMapping(path = "/deleted.do", method = RequestMethod.GET)
	public String showDeletePage() {
		return "WEB-INF/views/delete.jsp";

	}

	@RequestMapping(path = "/success.do", method = RequestMethod.GET)
	public String showSuccessPage() {
		return "WEB-INF/views/restaurantModifySuccess.jsp";

	}

	@RequestMapping(path = "/failure.do", method = RequestMethod.GET)
	public String showFailurePage() {
		return "WEB-INF/views/restaurantModifyFailed.jsp";

	}

	@RequestMapping(path = "/notFound.do", method = RequestMethod.GET)
	public String showNotFound() {
		return "WEB-INF/views/idNotFound.jsp";

	}

	@RequestMapping(path = "*", method = RequestMethod.GET)
	public String fallback() {
		return "WEB-INF/views/fallback.jsp";
	}

}
