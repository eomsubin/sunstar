package com.sunstar.controller;


import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sunstar.dto.CustomerUserDetail;
import com.sunstar.dto.MailDTO;
import com.sunstar.service.CustomerService;


@Controller
public class CSController {

	@Autowired
	private CustomerService customerservice;
	
	//고객센터 홈
	@RequestMapping("/CS")
	public String customer(Model model) throws Exception
	{
		model.addAttribute("contentpage", "CS.jsp");
		return "CS/CShome";
	}
	
	//공지사항 
	@RequestMapping("/notice")
	public String noticeList(Model model) throws Exception
	{
		//List<NoticeDTO> noticeList=customerservice.noticelist();
		model.addAttribute("contentpage", "notice.jsp");
		return "CS/CShome";
	}
	
	//1:1 문의하기
	@RequestMapping("/CS/inquiry")
	public String inquiry(Model model) throws Exception
	{
		model.addAttribute("contentpage", "inquiry.jsp");
		return "CS/CShome";
	}
	
	//1:1 문의하기 작성
	@RequestMapping("/CS/inquiry/add")
	public String inquiryadd(@ModelAttribute MailDTO dto) throws Exception
	{
		customerservice.addinquiry(dto);
		return "redirect:/CS";
	}
	
	
	//1:1 문의 내역 리스트
	@RequestMapping("/CS/inquiry/inquirylist")
	public String inquirylist(Model model, Principal principal) throws Exception
	{
		if(principal != null ) {
			CustomerUserDetail detail = (CustomerUserDetail)((Authentication)principal).getPrincipal();
			String id=detail.getUsername();
			List<MailDTO> list=customerservice.getInquirylist(id);
			model.addAttribute("list", list);
		}else {
	    	  return "redirect:/userlogin";
	      }
		model.addAttribute("contentpage", "inquiryList.jsp");
		return "CS/CShome";
	}
	

}
