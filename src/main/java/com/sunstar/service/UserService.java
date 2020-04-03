package com.sunstar.service;

import java.util.HashMap;

import com.sunstar.dto.CustomerDTO;

public interface UserService {
	public int join_Customer(CustomerDTO dto);

	public int customeridcheck(String id);

	public int customeremailcheck(HashMap<String, String> map);

	public CustomerDTO customerfindid(HashMap<String, String> map);

	public int SetNewPassowrd(HashMap<String, String> map);

	public int join_Seller(HashMap<String, String> map);

	public int selleridcheck(String id);

	public int join_Sellerauth(HashMap<String, String> map);

	public int rejectjoin_Sellerre(HashMap<String, String> map);

	public int Acsuspensionseller(HashMap<String, String> map);

	public int Actseller(HashMap<String, String> map);

	public int delseller(HashMap<String, String> map);
}
