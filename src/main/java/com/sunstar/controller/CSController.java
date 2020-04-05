package com.sunstar.controller;


import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mysql.cj.protocol.x.Notice;
import com.sunstar.dto.CustomerUserDetail;
import com.sunstar.dto.FaqDTO;
import com.sunstar.dto.MailDTO;
import com.sunstar.dto.NoticeDTO;
import com.sunstar.service.CustomerService;


@Controller
public class CSController {

	@Autowired
	private CustomerService customerservice;
	
	//고객센터 홈
	@RequestMapping("/CS")
	public String customer(Model model) throws Exception
	{
		List<FaqDTO> faq=customerservice.faqhot10();
		List<NoticeDTO> notice=customerservice.noticehot5();
		model.addAttribute("faq",faq);
		model.addAttribute("notice",notice);
		model.addAttribute("contentpage", "CS.jsp");
		return "CS/CShome";
		}

	
	//공지사항 리스트
	@RequestMapping("/notice")
	public String noticeList(Model model) throws Exception
	{
		List<NoticeDTO> list=customerservice.noticelist();
		model.addAttribute("list", list);
		model.addAttribute("contentpage", "notice.jsp");
		return "CS/CShome";
	}	
	
	
	@RequestMapping("/noticeadd")
	public String noticeaddform(Model model) throws Exception
	{
		model.addAttribute("contentpage", "noticeadd.jsp");
		return "CS/CShome";
	}
	
	
	//공지 글 등록하기
	@RequestMapping("/noticeadd/add")
	public String noticeadd(@ModelAttribute NoticeDTO dto) throws Exception
	{
		customerservice.addnotice(dto);
		return "redirect:/notice";
	}
	
	//공지글 삭제
	@RequestMapping("/notice/del")
	public String noticedel(@RequestParam("notice_no") String notice_no) throws Exception
	{
		
		customerservice.delnotice(notice_no);
		return "redirect:/notice";
	}
	
	//faq
	@RequestMapping("/faq")
	public String faqList(Model model) throws Exception
	{
		List<FaqDTO> list=customerservice.faqlist();
		model.addAttribute("list", list);
		model.addAttribute("contentpage", "faq.jsp");
		return "CS/CShome";
	}
	
	@RequestMapping("/faqadd")
	public String faqaddform(Model model) throws Exception
	{
		model.addAttribute("contentpage", "faqadd.jsp");
		return "CS/CShome";
	}
	
	//faq 글 등록하기
	@RequestMapping("/faqadd/add")
	public String noticeadd(@ModelAttribute FaqDTO dto) throws Exception
	{
		customerservice.addfaq(dto);
		return "redirect:/faq";
	}
	
	//faq 삭제
	@RequestMapping("/faq/del")
	public String faqdel(@RequestParam("faq_no") String faq_no) throws Exception
	{
		
		customerservice.delfaq(faq_no);
		return "redirect:/faq";
	}
	
	
	//1:1 문의하기
	@RequestMapping("/CS/inquiry")
	public String inquiry(Model model) throws Exception
	{
		model.addAttribute("contentpage", "inquiry.jsp");
		return "CS/CShome";
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
	
	
	
	//1:1 문의하기 작성
	@RequestMapping("/CS/inquiry/add")
	public String inquiryadd(@ModelAttribute MailDTO dto) throws Exception
	{
		customerservice.addinquiry(dto);
		return "redirect:/CS";
	}
	
	
	
	
}
