package com.sunstar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.sunstar.dao.CustomerDAO;
import com.sunstar.dto.CustomerUserDetail;
import com.sunstar.dto.CustomerDTO;

@Service("AuthService")
public class AuthService implements UserDetailsService{

	@Autowired
	private CustomerDAO dao;
	
	@Override
	public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {
			CustomerDTO dto = dao.getUserById(userid);
			if(dto==null)
				throw new UsernameNotFoundException(userid);
		return new CustomerUserDetail(dto);
	}

}
