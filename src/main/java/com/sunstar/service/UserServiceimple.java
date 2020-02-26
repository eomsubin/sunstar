package com.sunstar.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunstar.dao.CustomerDAO;
import com.sunstar.dto.CustomerDTO;

@Service(value="userservice")
public class UserServiceimple implements UserService{

	@Resource(name="passwordEncoder")
	private BCryptPasswordEncoder encoder;
	
	@Autowired
	private CustomerDAO dao;
	
	@Transactional
	@Override
	public int join_Customer(CustomerDTO dto) {
		String newpwd = encoder.encode(dto.getPassword());
		dto.setPassword(newpwd);
		dao.join_Customer(dto);
		return dao.join_Customer_auth(dto);
	}



	
}
