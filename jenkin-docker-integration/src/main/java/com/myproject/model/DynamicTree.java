package com.myproject.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="Tree_Graph")
public class DynamicTree {
	
	@Id  
	@GeneratedValue(strategy=GenerationType.AUTO)  
	
	 int id;
	 String name;
	 int parentid;	 
	 String parentname;
	// String image;
	 
	
	 
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getParentid() {
		return parentid;
	}
	public void setParentid(int parentid) {
		this.parentid = parentid;
	}
	public String getParentname() {
		return parentname;
	}
	public void setParentname(String parentname) {
		this.parentname = parentname;
	}
	/*public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}*/
	
	
	 
   

}
