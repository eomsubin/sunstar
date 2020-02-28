package com.sunstar.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.OptionDTO;
import com.sunstar.dto.ProductDTO;
import com.sunstar.service.NoticeService;
import com.sunstar.service.SellerService;

@Controller
public class CustomerController {

	@Autowired
	private NoticeService noticeservice;
	
	@RequestMapping("/customer")
	public String customer()
	{
		return "customer/customer";
	}
	
	@RequestMapping("/notice")
	public String notice()
	{
		return "customer/notice";
	}

}
