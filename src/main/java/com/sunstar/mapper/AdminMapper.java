package com.sunstar.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMapper {

	public List<HashMap<String, String>> getSellerApply(HashMap<String, String> map);
	public List<HashMap<String, String>> getSellerList(HashMap<String, String> map);

}
