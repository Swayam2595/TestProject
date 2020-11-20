package com.myproject.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.myproject.model.Employees;

public interface EmployeesRepository extends JpaRepository<Employees, Long> {
	
	/*@Query("select p from Employees order by p.id desc")
	
	List<Employees> findAll();*/
	
	List<Employees>	findAllByOrderByIdAsc();
	

}
