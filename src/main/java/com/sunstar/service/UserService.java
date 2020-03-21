package com.sunstar.service;

import java.util.HashMap;

import com.sunstar.dto.CustomerDTO;

public interface UserService {
	public int join_Customer(CustomerDTO dto);

	public int customeridcheck(String id);

	public int customeremailcheck(String email);

	public int customerpwcheck(HashMap<String, String> map);
	
}
