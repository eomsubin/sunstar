package com.sunstar.service;

import java.util.HashMap;
import java.util.List;

import com.sunstar.dto.CategoryDTO;

public interface AdminService {

	List<HashMap<String, String>> getSellerApply(HashMap<String, String> map);
	List<HashMap<String, String>> getSellerList(HashMap<String, String> map);
	List<CategoryDTO> getLv1();
	List<CategoryDTO> getLv2(CategoryDTO lv1data);

}
