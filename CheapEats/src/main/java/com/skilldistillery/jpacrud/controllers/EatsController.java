package com.skilldistillery.jpacrud.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jpacrud.entities.Restaurants;


@Controller
public class EatsController {

	@RequestMapping(path = "index.do", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("message", "Hello");
		mv.setViewName("WEB-INF/views/index.jsp");
		return mv;

	}

	@RequestMapping(path = "index.do", method = RequestMethod.GET)
	public ModelAndView show() {
		ModelAndView mv = new ModelAndView();
		List<Restaurants> restaurants = new ArrayList<>();
		mv.addObject("restaurants", restaurants);
		mv.setViewName("WEB-INF/views/index.jsp");
		return mv;

	}
}
