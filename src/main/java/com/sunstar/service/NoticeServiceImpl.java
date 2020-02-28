package com.sunstar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunstar.dto.NoticeDTO;
import com.sunstar.mapper.CSMapper;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private CSMapper csmapper;
	
	@Override
	public List<NoticeDTO> noticelist() {
		// TODO Auto-generated method stub
		return csmapper.noticeList();
	}

}
