package com.sunstar.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.OptionDTO;
import com.sunstar.dto.ProductDTO;
import com.sunstar.service.SellerService;

@Controller
public class SellerController {

	@Autowired
	private SellerService sellerservice;
	
	@RequestMapping("/seller")
	public String seller(Model model) {
		
		model.addAttribute("sellerpage", "seller_main.jsp");
		return "seller/seller_temp";
	}
	
	@RequestMapping("/product")
	public String product(Model model) {
		
		List<ProductDTO> plist = sellerservice.list();		
		
		model.addAttribute("plist", plist);
		System.out.println("--");
		System.out.println(plist.get(0).getOptions());
		System.out.println("--");
		model.addAttribute("sellerpage", "product.jsp");
		return "seller/seller_temp";
	}
	
	@RequestMapping("/addproduct")
	public String addproduct(Model model) {
	
		//페이지에 카테고리 표시
		List<CategoryDTO> clist = sellerservice.getCategory();
		List<CategoryDTO> dlist = new ArrayList<>();
		for(CategoryDTO dto : clist) {
			dto.setLv123(dto.getLv1()+" - "+dto.getLv2()+" - "+dto.getLv3()); 
			dlist.add(dto);
		}
		model.addAttribute("dlist", dlist);
		
		model.addAttribute("sellerpage", "addsproduct.jsp");
		return "seller/seller_temp";
	}
	
	@RequestMapping("/addproductresult")
	public String addproductresult(Model model, ProductDTO dto) {

		
		sellerservice.addProduct(dto);
		
		model.addAttribute("sellerpage", "product.jsp");

		return "seller/seller_temp";
	}
}
