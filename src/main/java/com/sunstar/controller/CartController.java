package com.sunstar.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunstar.dto.CartDTO;
import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.CustomerUserDetail;
import com.sunstar.dto.ProductDTO;
import com.sunstar.service.CartService;
import com.sunstar.service.MainService;
import com.sunstar.service.ProductService;

@Controller
public class CartController {	
	
	@Autowired
	private MainService mainservice;
	
	@Autowired
	private ProductService productservice;

	@Autowired
	private CartService cartservice;

	public String header(Model model) {
		List<CategoryDTO> clist= mainservice.getCategory();
	
		
		List<CategoryDTO> clist2= mainservice.getCategory2();
		model.addAttribute("catelist",clist);
		model.addAttribute("catelist2",clist2);	
		
		return "header2";
		
	}
	
	
	// 상품 상세보기
	@RequestMapping(value = "/detailview", method = RequestMethod.GET)
	public String detailview(@RequestParam(defaultValue = "") String product_code, Model model) {
		if (product_code.equals("")) {
			System.out.println("값이 없습니다.");
			return "redirect:http://localhost:8080/controller/userlogin";
		} else {
			int product_code1 = Integer.parseInt(product_code);
			ProductDTO view = productservice.productview(product_code1);
			model.addAttribute("view", view);
			model.addAttribute("contentpage", "shop/detailview.jsp");
			// System.out.println(view);
		}
		header(model);
		return "home";
	}
	
	
	@RequestMapping(value = "/detailview2_css", method = RequestMethod.GET)
	public String detailview2(@RequestParam(defaultValue = "")  Model model) {
		header(model);
		model.addAttribute("contentpage", "shop/detailview2_css.jsp");
		return "home";
	}
	
	

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
			model.addAttribute("cartList", cartList);
			model.addAttribute("contentpage", "shop/cartList.jsp"); 
	      }else {
	    	  return "redirect:http://localhost:8080/controller/userlogin";
	      }
		header(model);
		return "home";
	}

}
