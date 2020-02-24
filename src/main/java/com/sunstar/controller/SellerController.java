package com.sunstar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellerController {

	
	
	@RequestMapping("/seller")
	public String seller(Model model) {
		
		model.addAttribute("sellerpage", "seller_main.jsp");
		return "seller/seller_temp";
	}
	
	@RequestMapping("/product")
	public String product(Model model) {
		model.addAttribute("sellerpage", "product.jsp");
		return "seller/seller_temp";
	}
	@RequestMapping("/addproduct")
	public String addproduct(Model model) {
		model.addAttribute("sellerpage", "addsproduct.jsp");
		return "seller/seller_temp";
	}
}
