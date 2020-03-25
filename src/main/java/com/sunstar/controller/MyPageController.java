
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
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping("/updateShip/{shipping_name}")
	public String updateShip(@PathVariable String shipping_name, Principal principal) {
		
		CustomerUserDetail userdetail = (CustomerUserDetail)((Authentication)principal).getPrincipal();
		String id = userdetail.getUsername();
		
		CustomerDTO info = mpservice.getUserInfo(id);
		id=info.getId();
		ShipDTO sdto = new ShipDTO();
		sdto.setShipping_name(shipping_name);
		sdto.setId(id);
		mpservice.updateShip(sdto);
		
		
	
		return "redirect:/mypage/shipaddr";
	}
		
	@RequestMapping("/deleteship/{shipping_name}")
	public String deleteShip(@PathVariable String shipping_name,Principal principal) {
		
		CustomerUserDetail userdetail = (CustomerUserDetail)((Authentication)principal).getPrincipal();
		String id = userdetail.getUsername();
		
		CustomerDTO info = mpservice.getUserInfo(id);
		ShipDTO sdto = new ShipDTO();
		sdto.setShipping_name(shipping_name);
		sdto.setId(id);
		mpservice.deleteShip(sdto);
		
		return "redirect:/mypage/shipaddr";
		
	}
	
	@RequestMapping("/mypage/orderdetail/{order_code}")
	public String orderDetail(Model model,@PathVariable String order_code) {
		mainservice.header(model);
		
		
		List<OrderDTO> orderdetail = mpservice.orderDetail(order_code); 
		
		OrderDTO orderdto = new OrderDTO();
		orderdto.setOrder_code(orderdetail.get(0).getOrder_code());
		orderdto.setOrder_way(orderdetail.get(0).getOrder_way());
		orderdto.setShipping_addr1(orderdetail.get(0).getShipping_addr1());
		orderdto.setShipping_addr2(orderdetail.get(0).getShipping_addr2());
		orderdto.setShipping_addr3(orderdetail.get(0).getShipping_addr3());
		
		model.addAttribute("one",orderdto);

		model.addAttribute("orderdetail",orderdetail);
		model.addAttribute("contentpage","Mypage/orderdetail.jsp");
		
		return "home";
	}
	
	@RequestMapping("/mypage/seller_register")
	public String seller_register(Model model) {
		
		mainservice.header(model);
		
		
		model.addAttribute("contentpage","Mypage/seller_register.jsp");
		
		
		return "home";
	}
	
	
}


