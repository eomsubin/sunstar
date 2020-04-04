package com.sunstar.service;

import java.util.List;

import com.mysql.cj.protocol.x.Notice;
import com.sunstar.dto.MailDTO;
import com.sunstar.dto.NoticeDTO;


public interface CustomerService {
	

	public int addinquiry(MailDTO dto);

	public List<MailDTO> getInquirylist(String id);

	public int addnotice(NoticeDTO dto);

	public List<NoticeDTO> noticelist();

	
	
}
