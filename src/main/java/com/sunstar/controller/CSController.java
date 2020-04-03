package com.sunstar.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sunstar.dto.MailDTO;
import com.sunstar.dto.NoticeDTO;
import com.sunstar.service.CustomerService;


@Controller
public class CSController {

	@Autowired
	private CustomerService customerservice;
	
	@RequestMapping("/CS")
	public String customer(Model model) throws Exception
	{
		model.addAttribute("contentpage", "CS.jsp");
		return "CS/CShome";
	}
	
	@RequestMapping("/notice")
	public String noticeList(Model model) throws Exception
	{
		List<NoticeDTO> noticeList=customerservice.noticelist();
		model.addAttribute("contentpage", "notice.jsp");
		return "CS/CShome";
	}
	
	@RequestMapping("/inquiry")
	public String inquiry(Model model) throws Exception
	{
		model.addAttribute("contentpage", "inquiry.jsp");
		return "CS/CShome";
	}
	
	

	@RequestMapping("/inquiry/add")
	public String inquiryadd(@ModelAttribute MailDTO dto) throws Exception
	{
		System.out.println("test");
		System.out.println(dto+"adasdsadasadsa");
		customerservice.addinquiry(dto);
		return "redirect:/CS";
	}
	
	
	

}
