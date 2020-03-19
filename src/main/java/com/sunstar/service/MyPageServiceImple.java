package com.sunstar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunstar.dto.CustomerDTO;
import com.sunstar.mapper.MyPageMapper;

@Service("mpservice")
public class MyPageServiceImple implements MyPageService {
	
	@Autowired
	private MyPageMapper mpmapper;

	@Override
	public void infoUpdate(CustomerDTO info) {
		mpmapper.infoUpdate(info);
		
	}

	@Override
	public CustomerDTO getUserInfo(String id) {
		// TODO Auto-generated method stub
		return mpmapper.getUserInfo(id);
	}
	
	
	
}
