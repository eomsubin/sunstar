package com.sunstar.controller;

import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sunstar.dto.AuthDTO;
import com.sunstar.dto.CustomerDTO;
import com.sunstar.service.AuthService;
import com.sunstar.service.UserService;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/resources/sunstar-security.xml"
	,"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class AuthServiceTest {

	@Autowired @Qualifier("userservice")
	private UserService service;
	
	@Autowired @Qualifier("AuthService")
	private AuthService service2;
	
	@Test
	public void t1()
	{
		
		CustomerDTO dto = new CustomerDTO(); 
		
		dto.setId("jinwoo");
		dto.setPassword("123");
		dto.setName("jinwoo");
		dto.setTel("01071332619");
		dto.setEmail("wlsdn9489@naver.com");
		dto.setEnable(true);
		
		ArrayList<AuthDTO> arr = new ArrayList<AuthDTO>();
		arr.add(new AuthDTO("jinwoo","ROLE_ADMIN"));
		arr.add(new AuthDTO("jinwoo","ROLE_USER"));
		arr.add(new AuthDTO("jinwoo","ROLE_MANAGER"));
		dto.setAuthlist(arr);
		
		service.join_Customer(dto);
		UserDetails user = service2.loadUserByUsername("jinwoo");
		System.out.println(user.getUsername());
		System.out.println(user.getPassword());
		System.out.println(user.getAuthorities());

	}
}
