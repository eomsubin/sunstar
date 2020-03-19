package com.sunstar.service;

import com.sunstar.dto.CustomerDTO;

public interface MyPageService {
	
	void infoUpdate(CustomerDTO info);

	CustomerDTO getUserInfo(String id);
}	
