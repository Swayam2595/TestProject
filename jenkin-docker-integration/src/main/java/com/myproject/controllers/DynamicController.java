package com.myproject.controllers;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.DatatypeConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.myproject.model.DynamicTree;

import com.myproject.model.FileUpload;

import com.myproject.repository.DynamicTreeRepository;
@Controller
public class DynamicController {
	
	@Autowired
	 DynamicTreeRepository dynamictreerepository;
	
	@RequestMapping(value = "/TreeDataView.html", method = { RequestMethod.POST,RequestMethod.GET})
	public String TreePlot() {
		return "TreeGraphView";
	}
	
	
	@RequestMapping(value = "/TreeGraphPlot.html", method = { RequestMethod.POST,RequestMethod.GET})
	public String Tree(Model model) {
		
		List<DynamicTree> listofdatas=dynamictreerepository.findAll();
		model.addAttribute("listofdatas", listofdatas);
		return "TreeDataPlot";
		

	}
	
	@RequestMapping(value = "/TreeDataInput.html", method = { RequestMethod.POST,RequestMethod.GET})
	public String TreeData(Model model) {

		List<DynamicTree> listofdata=dynamictreerepository.findAll();
		/*
		 * for(TreeEntity te:listofdata) { TreeEntity
		 * tre=treeRepository.findById(te.getParentid()); if(tre!=null) {
		 * te.setParentname(tre.getName()); } }
		 */
		model.addAttribute("listofdata", listofdata);
		return "TreeDataInput";
		

	}
	
	@RequestMapping(value = "/DynamicTreeDataInput", method = { RequestMethod.POST,RequestMethod.GET})
	public String AddTreeData(@ModelAttribute("tree")DynamicTree tree) {
		DynamicTree te=new DynamicTree();
		DynamicTree tre=dynamictreerepository.findByName(tree.getParentname());
		te.setName(tree.getName());
		//te.setImage(tree.getImage());
		if(tre!=null)
		{
		te.setParentid(tre.getId());
		}
		te.setParentname(tree.getParentname());
		dynamictreerepository.save(te);
		return "redirect:/TreeGraphPlot.html";
		

	}
	 @RequestMapping(value = "/savefiles.html", method ={ RequestMethod.POST,RequestMethod.GET})
	    public String Save(
	            @ModelAttribute("uploadForm") FileUpload uploadForm,
	            Model map,HttpServletRequest request) throws IllegalStateException, IOException {
	       
	    	
	    	String rootPath = request.getSession().getServletContext().getRealPath("/");
		    File dir = new File(rootPath + File.separator + "uploadedfile");
		    if (!dir.exists()) {
		        dir.mkdirs();
		    }
		    
	        List<MultipartFile> Files = uploadForm.getFiles();
	 
	        List<String> fileNames = new ArrayList<String>();
	 
	        if (null != Files && Files.size() > 0) {
	            for (MultipartFile multipartFile : Files) {
	 
	                String fileName = multipartFile.getOriginalFilename();
	                if (!"".equalsIgnoreCase(fileName)) {
	                    // Handle file content - multipartFile.getInputStream()
	                	String path = dir.getAbsolutePath() + File.separator + fileName;
	                	System.out.println(path);
	                    multipartFile
	                            .transferTo(new File(path));
	                    fileNames.add(fileName);
	                }
	            }
	        }
	 
	        map.addAttribute("files", fileNames);
	        return "redirect:/TreeGraphPlot.html";
	    }


	@RequestMapping(value = "/jsondatafordynamictree", method = { RequestMethod.POST,RequestMethod.GET})
	
	public @ResponseBody String jsondatafortree( @RequestParam( value = "plname", required = false ) String plname,
			                                     @RequestParam( value = "belongsto", required = false ) String belongsto ) {
		
	//List<TreeEntity> listoftree=treeRepository.findbyname();
		
		

		System.out.println("plname "+plname+" belongsto"+ belongsto);
		if(plname!="")
		{
		DynamicTree te=new DynamicTree();
		DynamicTree tre=dynamictreerepository.findByName(belongsto);
		te.setName(plname);
		if(tre!=null)
		{
		te.setParentid(tre.getId());
		}
		te.setParentname(belongsto);
		dynamictreerepository.save(te);
		
		}
		List<DynamicTree> listofdata=dynamictreerepository.findAll();
	ObjectMapper mapper = new ObjectMapper();
	String json="";
	 
	//System.out.println("occu name "+employee.getFirstName());
	
	try
 	{
 json = mapper.writeValueAsString(listofdata);
    } catch (JsonProcessingException e) {

  e.printStackTrace();
    }
  System.out.println("json:"+json);
	return json;
	}

	
	
	@RequestMapping(value = "/jsondatafortreeview", method = RequestMethod.POST)
	public @ResponseBody String jsondatafortree( ) {
		
	//List<TreeEntity> listoftree=treeRepository.findbyname();
		//List<TreeEntity> listoftree=treeRepository.findAll();
		List<DynamicTree> listofdata=dynamictreerepository.findAll();
	ObjectMapper mapper = new ObjectMapper();
	String json="";
	 
	//System.out.println("occu name "+employee.getFirstName());
	
	try
 	{
 json = mapper.writeValueAsString(listofdata);
    } catch (JsonProcessingException e) {

  e.printStackTrace();
    }
  System.out.println("json:"+json);
	return json;
}
	
	

	//Delete ......................................................................................
		
	@RequestMapping(value = "/branchdelete.html", method = RequestMethod.POST, headers = "Accept=application/json")  

		 public ModelAndView branchdelete(@ModelAttribute("treegraph") DynamicTree treegraph,
				 
		 @RequestParam( value = "id", required = false ) String id) {  
					 
			 System.out.println("id is : "+id);
			 DynamicTree tree2 = dynamictreerepository.getByID(Integer.valueOf(id));
			 
			 List<DynamicTree> children = dynamictreerepository.getChildrenByParent(Integer.valueOf(id));
			// List<DynamicTree> grandchildren = dynamictreerepository.getGrandChildrenByParent(Integer.valueOf(id));
 
			 for (DynamicTree tree: children) {
				 dynamictreerepository.delete(tree);
				 
				/* List<DynamicTree> Children1 = dynamictreerepository.getChildrenByParent(Integer.valueOf(tree.getId()));
				
				 if (Children1.getSize() == null)
				  {
					 dynamictreerepository.delete(tree);
				 }
				 else
				 {
					System.out.println("Error"); 
				 }*/
				 
			 }
		 

			 DynamicTree tree=dynamictreerepository.GetByname(tree2.getName());

			 
			 dynamictreerepository.delete(tree);		
             RedirectView rv = new RedirectView();
		  	 rv.setUrl("TreeGraphPlot.html");
		  
		     return new ModelAndView(rv);
		  
		 }   	    
	
	
	
	
}
