package com.sunstar.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunstar.dto.CartDTO;
import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.CustomerDTO;
import com.sunstar.dto.CustomerUserDetail;
import com.sunstar.dto.OrderDTO;
import com.sunstar.dto.OrderListDTO;
import com.sunstar.service.MainService;
import com.sunstar.service.MyPageService;
import com.sunstar.service.PaymentService;

@Controller
public class PaymentController {
	@Autowired
	private MainService mainservice;
	@Autowired
	private PaymentService paymentservice;
	
	@Autowired
	private MyPageService mpservice;
	
	
	
	
	
    // 카트에서의 값가지고 주문페이지 넘어가기
	@RequestMapping(value="/checkout", method = RequestMethod.POST)
	public String checkout( Model model, Principal principal,@RequestParam String[] chBox )
	{
		mainservice.header(model);
		
		if(principal!=null) {
			CustomerUserDetail userdetail = (CustomerUserDetail)((Authentication)principal).getPrincipal();
			String id = userdetail.getUsername();
			
	
			
			CustomerDTO info = mpservice.getUserInfo(id);
			info.setTel(info.getTel().replaceAll("-", ""));
			CartDTO userinfo= new CartDTO();
			
			userinfo.setId(id);
			System.out.println(id);
			
			int cart_no=0;
			
			List<CartDTO> list = new ArrayList<>();
			for(String i: chBox) {
				cart_no=Integer.parseInt(i);
				
				System.out.println(cart_no);
				userinfo.setCart_no(cart_no);
				
				CartDTO orderdto = paymentservice.viewOrdered(userinfo);
			
				
				list.add(orderdto);
				
			}
						
			System.out.println(list);
			
			
			
			model.addAttribute("odto",list);

			//model.addAttribute("odto2",orderdto);
		
			model.addAttribute("userinfo",info);
			
			model.addAttribute("contentpage", "payment/checkout.jsp");       
		}else {
			return "redirect:/userlogin";
		}
		return "home";
	}
	
	
	
	// 결제 완료 후 데이터 받아와서 주문 목록에 추가하기
	@ResponseBody
	@RequestMapping(value="/checkout/complete",method=RequestMethod.POST)
	public int complete(Model model, @RequestBody OrderDTO allData) {
		int r=0;
		
		
	    r = paymentservice.addOrder(allData);
	   
		
		return r;
  }
}
