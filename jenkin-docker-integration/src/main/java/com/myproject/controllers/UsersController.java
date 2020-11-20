package com.myproject.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import com.myproject.repository.UsersRepository;
import com.myproject.model.Users;

@Controller
public class UsersController {

	
	@Autowired
	private UsersRepository usersData;
	

	
	
	@RequestMapping(value = "/loginCheck.html", method = RequestMethod.POST)
	public ModelAndView loginCheck(@ModelAttribute("users") Users users) {

	    System.out.println("login checking");	
		
		System.out.println("input userName: "+users.getUsername());
		System.out.println("input Password: "+users.getPassword());
		
		
		List<Users> allUsers = usersData.findAll();
		
		ModelAndView modelAndView=new ModelAndView();
		for(Users userObject:allUsers) {
			
			String userName= userObject.getUsername();
			String passWord = userObject.getPassword();
			
			
			if(userName.equals(users.getUsername())&& passWord.equals(users.getPassword()) ) {
				modelAndView.setViewName("./demo");
			}
			else {
				
				modelAndView.setViewName("Error");
			}
		}
		
		
		
		
                  modelAndView.addObject("allUsers", allUsers);
		return modelAndView;
	
		
		}
	
	@RequestMapping(value = "/dashboard.html", method = RequestMethod.GET)
	public ModelAndView dashboard() {
		ModelAndView modelAndView=new ModelAndView();
		
		modelAndView.setViewName("dashboard");	
		return modelAndView;		

	}

	
}
