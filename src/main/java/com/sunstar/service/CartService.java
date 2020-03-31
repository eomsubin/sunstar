package com.sunstar.service;

import java.util.HashMap;
import java.util.List;

import com.sunstar.dto.CartDTO;

public interface CartService {

	public int addCart(CartDTO cart) throws Exception;

	public List<CartDTO> cartList(String id) throws Exception;

	public int deleteItem(String cart_no) throws Exception;

	public int changeQuantity(HashMap<String, String> data);

	


}
