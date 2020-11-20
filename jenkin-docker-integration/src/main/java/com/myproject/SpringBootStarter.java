package com.myproject;



import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.bind.annotation.RestController;

@RestController
@EnableAutoConfiguration
@SpringBootApplication
@EnableScheduling

public class SpringBootStarter extends SpringBootServletInitializer {
	
		 
	public static void main(String[] args) {
		SpringApplication.run(SpringBootStarter.class, args);
		
	}
	
	
}
