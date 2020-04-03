package com.sunstar.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sunstar.dto.CategoryDTO;

@Mapper
public interface AdminMapper {

	public List<HashMap<String, String>> getSellerApply(HashMap<String, String> map);
	public List<HashMap<String, String>> getSellerList(HashMap<String, String> map);
	public List<CategoryDTO> getLv1();
	public List<CategoryDTO> getLv2(String lv1select);
	public List<CategoryDTO> getLv3(String lv2select);
	public List<CategoryDTO> getLv2();
	public List<CategoryDTO> getLv3();
	public void add_lv2(CategoryDTO cdto);
	public void add_lv3(CategoryDTO cdto);
	

}
