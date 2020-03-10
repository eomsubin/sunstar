package com.sunstar.dao;

import org.apache.ibatis.annotations.Mapper;

import com.sunstar.dto.CustomerDTO;

@Mapper
public interface CustomerDAO {

	public CustomerDTO getUserById(String userid);
	public int join_Customer(CustomerDTO dto);
	public int join_Customer_auth(CustomerDTO dto);
	public int customeridcheck(String id);
	public int customeremailcheck(String email);
	
}
