package com.sunstar.service;

import java.util.HashMap;
import java.util.List;

import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.MailDTO;

public interface AdminService {

	List<HashMap<String, String>> getSellerApply(HashMap<String, String> map);
	List<HashMap<String, String>> getSellerList(HashMap<String, String> map);
	List<CategoryDTO> getLv1();
	List<CategoryDTO> getLv2(String lv1select);
	List<CategoryDTO> getLv3(String lv2select);
	List<CategoryDTO> getLv2();
	List<CategoryDTO> getLv3();
	void add_lv2(CategoryDTO cdto);
	//mail
	List<MailDTO> getMails();

}
