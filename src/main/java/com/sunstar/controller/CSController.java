package com.sunstar.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sunstar.dto.NoticeDTO;
import com.sunstar.service.NoticeService;

@Controller
public class CSController {

	@Autowired
	private NoticeService noticeservice;
	
	@RequestMapping("/customer")
	public String customer()
	{
		return "CS/customer";
	}
	
	@RequestMapping("/notice")
	public String noticeList(Model model)
	{
		List<NoticeDTO> noticeList=noticeservice.noticelist();
		model.addAttribute("noticeList", noticeList);
		return "CS/notice";
	}

}
