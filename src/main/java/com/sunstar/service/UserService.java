package com.sunstar.service;

import java.util.HashMap;

import com.sunstar.dto.CustomerDTO;

public interface UserService {
	public int join_Customer(CustomerDTO dto);

	public int customeridcheck(String id);

	public int customeremailcheck(HashMap<String, String> map);

	public CustomerDTO customerfindid(HashMap<String, String> map);
<<<<<<< HEAD

	public int SetNewPassowrd(HashMap<String, String> map);
=======
>>>>>>> branch 'master' of https://github.com/eomsubin/sunstar.git
	
}
