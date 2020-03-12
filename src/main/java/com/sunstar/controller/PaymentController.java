package com.sunstar.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.OrderDTO;
import com.sunstar.service.MainService;
import com.sunstar.service.PaymentService;

@Controller
public class PaymentController {
	@Autowired
	private MainService mainservice;
	@Autowired
	private PaymentService paymentservice;
	
	

	@RequestMapping("/checkout")
	public String checkout( Model model, HttpSession session)
	{
	
		
		mainservice.header(model);
		
		
		model.addAttribute("contentpage", "payment/checkout.jsp");       
	
		return "home";


	}
	@ResponseBody
	@RequestMapping("/complete")
	public List<OrderDTO> payment(Model model) {
		
		List<OrderDTO> orderList = paymentservice.getOrderList();
		
		
		
		return null;
  }
}
