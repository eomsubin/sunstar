package com.sunstar.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.sunstar.dto.CustomerDTO;

@Mapper
public interface MyPageMapper {
	
	void infoUpdate(CustomerDTO info);

	CustomerDTO getUserInfo(String id);
}
