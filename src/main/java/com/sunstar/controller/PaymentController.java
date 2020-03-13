package com.sunstar.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunstar.dto.CartDTO;
import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.CustomerUserDetail;
import com.sunstar.dto.OrderDTO;
import com.sunstar.service.MainService;
import com.sunstar.service.PaymentService;

@Controller
public class PaymentController {
	@Autowired
	private MainService mainservice;
	@Autowired
	private PaymentService paymentservice;
	
	
	
	
	
	
	

	@RequestMapping(value="/checkout", method = RequestMethod.POST)
	public String checkout( Model model, Principal principal,@RequestParam int[] chBox )
	{
		mainservice.header(model);
		
		if(principal!=null) {
			CustomerUserDetail userdetail = (CustomerUserDetail)((Authentication)principal).getPrincipal();
			String id = userdetail.getUsername();
			
			String tel= userdetail.getTel();
			String name= userdetail.getId();
			String email= userdetail.getEmail();
			String address1= userdetail.getAddress1();
			String address2= userdetail.getAddress2();
			String address3= userdetail.getAddress3();
			String zip= userdetail.getZip();
			
			tel= tel.replaceAll("-","");
			
			CartDTO userinfo= new CartDTO();
			userinfo.setName(name);
			userinfo.setTel(tel);
			userinfo.setEmail(email);
			userinfo.setAddress1(address1);
			userinfo.setAddress2(address2);
			userinfo.setAddress3(address3);
			userinfo.setZip(zip);
			List<CartDTO> orderdto = paymentservice.viewOrdered(id);
			
			model.addAttribute("odto",orderdto);
			model.addAttribute("userinfo",userinfo);
			
			model.addAttribute("contentpage", "payment/checkout.jsp");       
		}else {
			return "redirect:/userlogin";
		}
		
		
		
		
		
	
		return "home";


	}
	
	
	/*@ResponseBody
	@RequestMapping("/complete")
	public List<OrderDTO> payment(Model model) {
		
		List<OrderDTO> orderList = paymentservice.getOrderList();
		
		
		
		return null;
  }*/
}
