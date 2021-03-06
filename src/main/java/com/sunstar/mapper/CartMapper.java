package com.sunstar.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sunstar.dto.CartDTO;

@Mapper
public interface CartMapper {

	public int addCart(CartDTO cart) throws Exception;

	public List<CartDTO> cartList(String id) throws Exception;

	public int deleteItem(String cart_no) throws Exception;

	public int changeQuantity(HashMap<String, String> data);
}
