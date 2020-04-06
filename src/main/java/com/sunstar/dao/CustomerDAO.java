package com.sunstar.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.sunstar.dto.CustomerDTO;

@Mapper
public interface CustomerDAO {

	public CustomerDTO getUserById(String userid);
	public int join_Customer(CustomerDTO dto);
	public int join_Customer_auth(CustomerDTO dto);
	public int customeridcheck(String id);
	public int customeremailcheck(HashMap<String, String> map);
	public int customerpwcheck(HashMap<String, String> map);
	public CustomerDTO customerfindid(HashMap<String, String> map);
	public int SetNewPassowrd(HashMap<String, String> map);
	public int join_Seller(HashMap<String, String> map);
	public int selleridcheck(String id);
	public int join_Sellerauth(String id);
	public int rejectjoin_Sellerre(String id);
	public int delseller_auth(String id);
	public int updateseller_state(HashMap<String, String> map);
	public int updatesellerproduct_state(HashMap<String, String> map);
	public int delseller(String id);
	public int Setenable_customer(HashMap<String, String> map);
	public int delcustomer(String id);

	
}
