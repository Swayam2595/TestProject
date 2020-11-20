package com.myproject.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="employees_distribution")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Employees implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	  Long id;
	  int year;
	  int employeeRequired;
	  int employee;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getEmployeeRequired() {
		return employeeRequired;
	}
	public void setEmployeeRequired(int employeeRequired) {
		this.employeeRequired = employeeRequired;
	}
	public int getEmployee() {
		return employee;
	}
	public void setEmployee(int employee) {
		this.employee = employee;
	}
	
	  
	  
	
	
	
	 
	
	
	
	
	
}
