package com.sunstar.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunstar.dto.CartDTO;
import com.sunstar.mapper.CartMapper;

@Service("cartservice")
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper cartmapper;

	@Override
	public int addCart(CartDTO cart) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(cart);
		
		
		return cartmapper.addCart(cart);	
	}

	@Override
	public List<CartDTO> cartList(String id) throws Exception {
		// TODO Auto-generated method stub
		return cartmapper.cartList(id);
	}

	}
	
	


