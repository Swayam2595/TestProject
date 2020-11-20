package com.myproject.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.myproject.model.DynamicTree;


public interface DynamicTreeRepository extends JpaRepository<DynamicTree, Long>{

	@Query("select p from DynamicTree AS p"
		       + " where  p.id=:id")
	DynamicTree findById(@Param("id") int id);

	 @Query("select p from DynamicTree AS p"
		       + " where  p.name=:name")
	 DynamicTree findByName(@Param("name") String name);
	 @Query(" SELECT t1 AS lev1, t2 as lev2, t3 as lev3"+
	" FROM DynamicTree AS t1"+
	" LEFT JOIN DynamicTree AS t2 ON t2.parentid = t1.id"+
	" LEFT JOIN DynamicTree AS t3 ON t3.parentid = t2.id"+
	 
	" WHERE t1.name = 'india'")
	 List<DynamicTree> findbyname();
	 
	 
	 @Query("select rs from DynamicTree  rs where   rs.id=:id")
	 public DynamicTree getByID(@Param("id") int id);

	 @Query("select ul from DynamicTree  ul where   ul.name=:name ")
	 DynamicTree GetByname(@Param("name") String name);
	 
	 
	 @Query("select ul from DynamicTree  ul where ul.parentid=:parentid")
	 public List<DynamicTree> getChildrenByParent(@Param("parentid") int parentid);
	 
 
	
	 
	 
	 
}
