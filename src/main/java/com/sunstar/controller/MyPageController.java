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
import com.sunstar.service.MyPageService;
import com.sunstar.service.PaymentService;

@Controller
public class MyPageController {
	@Autowired
	private MainService mainservice;	
	@Autowired
	private PaymentService paymentservice;
	@Autowired
	private MyPageService mpservice;
	
	@RequestMapping("/mypage/info")
	public String mypage(Model model,Principal principal) {
			
		mainservice.header(model);
		if(principal!=null) {
			
			CustomerUserDetail userdetail = (CustomerUserDetail)((Authentication)principal).getPrincipal();
			
			String id = userdetail.getUsername();
		    
			CustomerDTO info = mpservice.getUserInfo(id);
			info.setTel(info.getTel().replaceAll("-", ""));
	
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
	
	@RequestMapping("/info/update")
	public String infoUpdate(CustomerDTO info) {
		
		
		mpservice.infoUpdate(info);
		
		
		
		return "redirect:/mypage/info";
	}
	
	@RequestMapping("/info/pwupdate")
	public String pwUpdate(Model model,Principal principal) {
		
		mainservice.header(model);
		if(principal!=null) {
			
			CustomerUserDetail userdetail = (CustomerUserDetail)((Authentication)principal).getPrincipal();
			
			String id = userdetail.getUsername();
		    
			CustomerDTO info = mpservice.getUserInfo(id);
			info.setTel(info.getTel().replaceAll("-", ""));
	
			model.addAttribute("info",info);
			model.addAttribute("contentpage","Mypage/pwupdate.jsp");
			
		}else {
			return "redirect:/";
		}
			
		
		
		
		return "home";
	}
}
