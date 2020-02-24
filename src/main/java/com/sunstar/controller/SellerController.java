package com.sunstar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellerController {

	
	
	@RequestMapping("/seller")
	public String seller(Model model) {
		
		return "seller/seller_main";
	}
	
	@RequestMapping("/product")
	public String product() {
		
		return "seller/product";
	}
}
