package com.sunstar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunstar.dto.NoticeDTO;
import com.sunstar.mapper.CustomerMapper;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private CustomerMapper mapper;
	
	@Override
	public List<NoticeDTO> list() {
		// TODO Auto-generated method stub
		return null;
	}

}
