package com.sunstar.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import org.apache.poi.util.SystemOutLogger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunstar.dto.CartDTO;
import com.sunstar.dto.CustomerUserDetail;
import com.sunstar.service.CartService;
import com.sunstar.service.MainService;


@Controller
public class CartController {	
	
	@Autowired
	private MainService mainservice;
	
	@Autowired
	private CartService cartservice;

	 
/*	//상세보기 css
	@RequestMapping(value = "/detailview2", method = RequestMethod.GET)
	public String detailview2(Model model) {
		mainservice.header(model);
		model.addAttribute("contentpage", "shop/detailview2.jsp");
		return "home";	
	}*/
	
	

	// 카드 담기
	@ResponseBody
	@RequestMapping(value = "/detailview/addCart", method = RequestMethod.GET)
	public int addCart(Model model, CartDTO data) throws Exception {
		int result = 0;
		result = cartservice.addCart(data);
		return result;
	}

	
	// 카트 목록
	@RequestMapping(value = "/cartList")
	public String getCartList(Model model, Principal principal) throws Exception {
		
		if(principal!=null)
	      {
	      System.out.println(principal);
	      CustomerUserDetail detail = (CustomerUserDetail)((Authentication)principal).getPrincipal();
	      System.out.println(detail.getUsername());
	      System.out.println(detail.getId());
	      String id=detail.getUsername();
	      List<CartDTO> cartList = cartservice.cartList(id);
	      HashMap<String, String> sellerList = new HashMap<>();
	      for(CartDTO dto : cartList)
	      {
	    	  sellerList.put(dto.getSeller_code(), dto.getSeller_name());
	    	  System.out.println(dto.getSeller_code());
	      }
	      
			model.addAttribute("cartList", cartList);
			model.addAttribute("sellerList", sellerList);
			model.addAttribute("contentpage", "shop/cartList.jsp"); 
	      }else {
	    	  return "redirect:http://${pageContext.request.contextPath}/userlogin";
	      }
		mainservice.header(model);
		return "home";
	}
	
	//카트 x버튼 삭제
	@ResponseBody
	@RequestMapping(value = "/cartList/deleteItem")
	public int deleteAll( @RequestParam HashMap<String, String> data) throws Exception{
		System.out.println(data.get("id"));
		System.out.println(data.get("cart_no"));
		System.out.println(data.get("seller_code"));
		
		cartservice.deleteItem(data.get("cart_no"));
		
		return 0;
		
	}
	
	//카트 수량 변경
	@ResponseBody
	@RequestMapping(value= "/cartList/changeQuantity")
	public int changeNum(Model model, @RequestParam HashMap<String, String> data) throws Exception{
		int result=0;
		System.out.println(data.get("id"));
		System.out.println(data.get("cart_no"));
		System.out.println(data.get("cart_Quantity"));
		System.out.println(data);
		result=cartservice.changeQuantity(data);
		return result;
	}

	

}
