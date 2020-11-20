package com.myproject.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.myproject.model.Employees;

import com.myproject.repository.EmployeesRepository;



@Controller

public class EmployeeController {
	
	@Autowired
	private EmployeesRepository employeesRepository;
	
	
	@RequestMapping(value = "/addemployee.html", method = RequestMethod.POST)
	public String newEmployee(Employees employees) {

		employeesRepository.save(employees);
		return ("redirect:/view_employees.html");
		

	}
	

	@RequestMapping(value = "/view_employees.html", method = RequestMethod.GET)
	public ModelAndView view_employees() {
		ModelAndView modelAndView=new ModelAndView();
		List<Employees> listemployees=employeesRepository.findAll();
		 
		modelAndView.addObject("listemployees", listemployees);
		modelAndView.setViewName("employeedetails");
		System.out.println("Testing for jenkin");
		return modelAndView;

	
	}
	
	@RequestMapping("/view_graph.html")
	String Employees() {
		return("graph");
	}
	
	@RequestMapping("/tree_graph.html")
	String School() {
		return("tree_graph");
	}
	
	@RequestMapping("/treeClickable_graph.html")
	String Clickable() {
		return("tree_clickable");
	}
	
	
	
	@RequestMapping(value = "/Ajaxemppresent.html", method = RequestMethod.POST)
	public @ResponseBody String Ajaxemppresent( @RequestParam( value = "", required = false ) String slno ) {
			
		System.out.println("slno "+" Successful ");
		List<Employees> employee=employeesRepository.findAllByOrderByIdAsc();
		ObjectMapper mapper = new ObjectMapper();
		String json="";
		 
		//System.out.println("occu name "+employee.getFirstName());
		
		try
	 	{
     json = mapper.writeValueAsString(employee);
        } catch (JsonProcessingException e) {
    
      e.printStackTrace();
        }
	  System.out.println("json:"+json);
		return json;
}
	
	   
}




	
	

	


