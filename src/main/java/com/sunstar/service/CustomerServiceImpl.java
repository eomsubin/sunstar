package com.sunstar.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mysql.cj.protocol.x.Notice;
import com.sunstar.dto.FaqDTO;
import com.sunstar.dto.MailDTO;
import com.sunstar.dto.NoticeDTO;
import com.sunstar.mapper.CSMapper;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CSMapper csmapper;
	


	@Override
	public int addinquiry(MailDTO dto) {
		// TODO Auto-generated method stub
		return csmapper.inquiryadd(dto);
	}

	@Override
	public List<MailDTO> getInquirylist(String id) {
		// TODO Auto-generated method stub
		return csmapper.inquirylist(id);
	}

	@Override
	public int addnotice(NoticeDTO dto) {
		// TODO Auto-generated method stub
		return csmapper.noticeadd(dto);
	}

	@Override
	public List<NoticeDTO> noticelist() {
		// TODO Auto-generated method stub
		return csmapper.noticelist();
	}

	@Override
	public boolean delnotice(String notice_no) {
		// TODO Auto-generated method stub
		return csmapper.delnotice(notice_no);
	}

	@Override
	public List<FaqDTO> faqlist() {
		// TODO Auto-generated method stub
		return csmapper.faqlist();
	}

	@Override
	public int addfaq(FaqDTO dto) {
		// TODO Auto-generated method stub
		return csmapper.faqadd(dto);
	}

	@Override
	public boolean delfaq(String faq_no) {
		// TODO Auto-generated method stub
		return csmapper.faqdel(faq_no);
	}

	@Override
	public List<FaqDTO> faqhot10() {
		// TODO Auto-generated method stub
		return csmapper.faqhot10();
	}

	@Override
	public List<NoticeDTO> noticehot5() {
		// TODO Auto-generated method stub
		return csmapper.noticehot5();
	}

	@Override
	public List<HashMap<String, Object>> getOrderList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return csmapper.getOrderList(map);
	}






	}


