package com.sunstar.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.sunstar.dto.CartDTO;

@Mapper
public interface CartMapper {

	void addCart(CartDTO cart);
}
