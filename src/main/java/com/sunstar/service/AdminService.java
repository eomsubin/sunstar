package com.sunstar.service;

import java.util.HashMap;
import java.util.List;

import com.sunstar.dto.AccountsDTO;
import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.MailDTO;

public interface AdminService {

	List<HashMap<String, String>> getSellerApply(HashMap<String, String> map); // jinwoo
	List<HashMap<String, String>> getSellerList(HashMap<String, String> map); // jinwoo
	List<HashMap<String, Object>> getCSellerList(String id); // jinwoo
	List<HashMap<String, Object>> getCSellerprduct(String id); // jinwoo
	List<HashMap<String, Object>> getCSellerordered(String id); // jinwoo
	List<HashMap<String, Object>> getCustomerList(HashMap<String, String> map); // jinwoo
	List<HashMap<String, Object>> getCCustomerList(String id); // jinwoo
	List<HashMap<String, Object>> getCCustomermails(String id); // jinwoo
	List<HashMap<String, Object>> getCCustomerordered(String id); // jinwoo

	
	List<CategoryDTO> getLv1();
	List<CategoryDTO> getLv2(String lv1select);
	List<CategoryDTO> getLv3(String lv2select);
	List<CategoryDTO> getLv2();
	List<CategoryDTO> getLv3();
	void add_lv2(CategoryDTO cdto);
	void add_lv3(CategoryDTO cdto);
	void droplv2(CategoryDTO cdto);
	void droplv3(CategoryDTO cdto);
	List<MailDTO> getMails();
	void updateReply(MailDTO dto);
	List<AccountsDTO> getAccList();
	void updateAccList(AccountsDTO dto);



}
