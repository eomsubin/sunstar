package com.sunstar.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sunstar.dto.CustomerDTO;
import com.sunstar.dto.CustomerUserDetail;
import com.sunstar.dto.OrderDTO;
import com.sunstar.service.MainService;
import com.sunstar.service.PaymentService;

@Controller
public class MyPageController {
	@Autowired
	private MainService mainservice;	
	@Autowired
	private PaymentService paymentservice;
	
	@RequestMapping("/mypage/info")
	public String mypage(Model model,Principal principal) {
			
		mainservice.header(model);
		if(principal!=null) {
			
			CustomerUserDetail userdetail = (CustomerUserDetail)((Authentication)principal).getPrincipal();
			
			String id = userdetail.getUsername();
			String name = userdetail.getId();
			String email = userdetail.getEmail();
			String tel = userdetail.getTel();
			String address1= userdetail.getAddress1();
			String address2= userdetail.getAddress2();
			String address3= userdetail.getAddress3();
			String zip= userdetail.getZip();
			
			tel= tel.replaceAll("-","");
			CustomerDTO info = new CustomerDTO();
			info.setId(id);
			info.setName(name);
			info.setEmail(email);
			info.setTel(tel);
			info.setAddress1(address1);
			info.setAddress2(address2);
			info.setAddress3(address3);
			info.setZip(zip);
			
			model.addAttribute("info",info);
			model.addAttribute("contentpage","Mypage/mypage.jsp");
			
		}else {
			return "redirect:/";
		}
			
		return "home";
	}
	
	@RequestMapping("/mypage/order")
	public String orderList(Model model, Principal principal) {
		mainservice.header(model);
		
		if(principal!=null) {
			CustomerUserDetail userdetail = (CustomerUserDetail)((Authentication)principal).getPrincipal();
			
			String id = userdetail.getUsername();
			
			List<OrderDTO> buylist = paymentservice.buylist(id);
			
			model.addAttribute("buylist",buylist);
			model.addAttribute("contentpage","Mypage/buyer_orderlist.jsp");
			
			
		}else {
			return "redirect:/";
		}
		
		
		return "home";
	}
}
