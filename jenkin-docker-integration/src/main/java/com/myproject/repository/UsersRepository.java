package com.myproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.myproject.model.Users;

public interface UsersRepository  extends JpaRepository<Users, Long> { 

}
