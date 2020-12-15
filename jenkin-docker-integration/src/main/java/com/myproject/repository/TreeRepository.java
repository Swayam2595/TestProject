package com.myproject.repository;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import com.myproject.model.TreeEntity;

public interface TreeRepository extends JpaRepository<TreeEntity, Long> {
	
	 @Query("select p from TreeEntity AS p"
		       + " where  p.id=:id")
	 TreeEntity findById(@Param("id") int id);

	 @Query("select p from TreeEntity AS p"
		       + " where  p.name=:name")
	 TreeEntity findByName(@Param("name") String name);
	 @Query(" SELECT t1 AS lev1, t2 as lev2, t3 as lev3"+
	" FROM TreeEntity AS t1"+
	" LEFT JOIN TreeEntity AS t2 ON t2.parentid = t1.id"+
	" LEFT JOIN TreeEntity AS t3 ON t3.parentid = t2.id"+
	 
	" WHERE t1.name = 'india'")
	 List<TreeEntity> findbyname();
}
