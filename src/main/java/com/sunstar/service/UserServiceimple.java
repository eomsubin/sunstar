package com.sunstar.service;

import java.util.HashMap;

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

	@Override
	public int customeridcheck(String id) {
		return dao.customeridcheck(id);
	}

	@Override
	public int customeremailcheck(HashMap<String, String> map) {
		return dao.customeremailcheck(map);
	}

	@Override
	public CustomerDTO customerfindid(HashMap<String, String> map) {
		return dao.customerfindid(map);
	}

	@Override
	public int SetNewPassowrd(HashMap<String, String> map) {
		map.put("newpw", encoder.encode((map.get("newpw"))));
		return dao.SetNewPassowrd(map);
	}

	@Override
	public int join_Seller(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return dao.join_Seller(map);
	}

	@Override
	public int selleridcheck(String id) {
		// TODO Auto-generated method stub
		return dao.selleridcheck(id);
	}
}
