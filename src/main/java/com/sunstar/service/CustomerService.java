package com.sunstar.service;

import java.util.List;

import com.sunstar.dto.MailDTO;
import com.sunstar.dto.NoticeDTO;


public interface CustomerService {
	public List<NoticeDTO> noticelist();

	public int addinquiry(MailDTO dto);

	
	
}
