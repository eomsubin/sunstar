package com.sunstar.controller;

import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sunstar.dto.AuthDTO;
import com.sunstar.dto.CustomerDTO;
import com.sunstar.dto.ProductDTO;
import com.sunstar.service.AuthService;
import com.sunstar.service.ProductServiceImpl;
import com.sunstar.service.UserService;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/resources/sunstar-security.xml"
	,"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ProductTest {

	@Autowired @Qualifier("productservice")
	private ProductServiceImpl service;
	
	@Test
	public void t1()
	{
		ProductDTO dto = service.productview(111);
		System.out.println(dto);

	}
}
