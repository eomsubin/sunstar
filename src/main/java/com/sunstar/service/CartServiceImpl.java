package com.sunstar.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunstar.dto.CartDTO;
import com.sunstar.mapper.CartMapper;

@Service("cartservice")
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper cartmapper;

	@Override
	public void addCart(CartDTO cart) throws Exception {
		// TODO Auto-generated method stub
		cartmapper.addCart(cart);	
	}

	}
	
	


