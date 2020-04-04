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
	public List<CategoryDTO> getLv2(CategoryDTO lv1data);
	public List<HashMap<String, Object>> getCSellerList(List<String> list);

}
