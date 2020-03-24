package com.sunstar.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunstar.dto.CustomerDTO;
import com.sunstar.dto.CustomerUserDetail;
import com.sunstar.dto.OrderDTO;
import com.sunstar.dto.ShipDTO;
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
	

	@RequestMapping("/mypage/shipaddr")
	public String shipaddr(Model model,Principal principal) {
		mainservice.header(model);
		if(principal!=null) {
			CustomerUserDetail userdetail = (CustomerUserDetail)((Authentication)principal).getPrincipal();
			String id = userdetail.getUsername();
			
			CustomerDTO info = mpservice.getUserInfo(id);
			
			id= info.getId();
			List<ShipDTO> slist = mpservice.getShipAddr(id);
			
			model.addAttribute("slist",slist);
			model.addAttribute("info",info);
			model.addAttribute("contentpage","Mypage/shipaddr.jsp");
		
		
		
		}else {
			
			return "redirect:/";
		}
		return "home";
	}
	@ResponseBody
	@RequestMapping(value="/mypage/addshipaddr", method=RequestMethod.POST )
	public void addshipaddr(@RequestBody ShipDTO adddata) {
			
		mpservice.addshipaddr(adddata);
	}
	
	@RequestMapping("/updateShip/{a}")
	public String updateShip(@PathVariable String a, Principal principal) {
		
		CustomerUserDetail userdetail = (CustomerUserDetail)((Authentication)principal).getPrincipal();
		String id = userdetail.getUsername();
		
		CustomerDTO info = mpservice.getUserInfo(id);
		id=info.getId();
		ShipDTO sdto = new ShipDTO();
		sdto.setShipping_name(a);
		sdto.setId(id);
		mpservice.updateShip(sdto);
		
		
	
		return "redirect:/mypage/shipaddr";
	}
		
		
	
	
	
	
}
