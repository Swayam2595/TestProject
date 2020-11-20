package com.myproject.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.myproject.model.DynamicTree;
import com.myproject.model.Employees;
import com.myproject.model.TreeEntity;
import com.myproject.repository.TreeRepository;

@Controller
public class TreeControllers {
	@Autowired
	TreeRepository treeRepository;
	
	@RequestMapping(value = "/Tree", method = { RequestMethod.POST,RequestMethod.GET})
	public String Tree() {
		return "Tree";
		

	}
	
	@RequestMapping(value = "/TreeData", method = { RequestMethod.POST,RequestMethod.GET})
	public String TreeData(Model model) {

		List<TreeEntity> listoftree=treeRepository.findAll();
		/*
		 * for(TreeEntity te:listoftree) { TreeEntity
		 * tre=treeRepository.findById(te.getParentid()); if(tre!=null) {
		 * te.setParentname(tre.getName()); } }
		 */
		model.addAttribute("listoftree", listoftree);
		return "TreeData";
		

	}
	
	@RequestMapping(value = "/AddTreeData", method = { RequestMethod.POST,RequestMethod.GET})
	public String AddTreeData(@ModelAttribute("tree")TreeEntity tree) {
		TreeEntity te=new TreeEntity();
		TreeEntity tre=treeRepository.findByName(tree.getParentname());
		te.setName(tree.getName());
		if(tre!=null)
		{
		te.setParentid(tre.getId());
		}
		te.setParentname(tree.getParentname());
		treeRepository.save(te);
		return "redirect:/TreeData";
		

	}
	

	@RequestMapping(value = "/jsondatafortree", method = RequestMethod.POST)
	public @ResponseBody String jsondatafortree( ) {
		
	//List<TreeEntity> listoftree=treeRepository.findbyname();
		List<TreeEntity> listoftree=treeRepository.findAll();
		
	ObjectMapper mapper = new ObjectMapper();
	String json="";
	 
	//System.out.println("occu name "+employee.getFirstName());
	
	try
 	{
 json = mapper.writeValueAsString(listoftree);
    } catch (JsonProcessingException e) {

  e.printStackTrace();
    }
  System.out.println("json:"+json);
	return json;
}
}
