package com.myproject.controllers;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.myproject.model.FileUpload;

@Controller
public class UploadingController {
	 @RequestMapping(value = "ImageUpload.html", method = RequestMethod.GET)
	    public String DisplayForm() {
	        return "uploadfile";
	    }
	 
	    @RequestMapping(value = "/savefiles.html", method = RequestMethod.POST)
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
	        return "uploadfilesuccess";
	    }

}
