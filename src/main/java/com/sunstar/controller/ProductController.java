package com.sunstar.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunstar.dao.ProductViewDAO;
import com.sunstar.dto.AuthDTO;
import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.CustomerDTO;
import com.sunstar.dto.CustomerUserDetail;
import com.sunstar.dto.ProductDTO;
import com.sunstar.service.AuthService;
import com.sunstar.service.MainService;
import com.sunstar.service.ProductService;
import com.sunstar.service.UserService;

import com.sunstar.dto.AuthDTO;
import com.sunstar.dto.CustomerDTO;
import com.sunstar.service.AuthService;
import com.sunstar.service.UserService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productservice;
	
/*	@Autowired @Qualifier("userservice")
	private UserService service;
	
	@Autowired @Qualifier("AuthService")
	private AuthService service2;*/
	
	@Autowired
	private MainService mainservice;	
	
	public String header(Model model) {
		List<CategoryDTO> clist= mainservice.getCategory();
		List<CategoryDTO> clist2= mainservice.getCategory2();
		model.addAttribute("catelist",clist);
		model.addAttribute("catelist2",clist2);	
		
		return "header2";
	}
	
	@RequestMapping("/category/{lv2}")
	public String productList(Model model, @PathVariable String lv2, Principal principal) {
		header(model);
		if(principal!=null)
		{
		System.out.println(principal);
		CustomerUserDetail detail = (CustomerUserDetail)((Authentication)principal).getPrincipal();
		System.out.println(detail.getUsername());
		System.out.println(detail.getId());
		}
		List<ProductDTO> list =productservice.productListCategory(lv2);
		//lv2 카테고리 상품 list
		model.addAttribute("productlist", list);
		model.addAttribute("contentpage", "ProductList/productList.jsp");
		return "/home";
	}
	
	
	// 상품 상세보기
	@RequestMapping(value = "/detailview2", method = RequestMethod.GET)
	public String detailview(@RequestParam(defaultValue = "") String product_code, Model model) {
		if (product_code.equals("")) {
			System.out.println("값이 없습니다.");
			return "redirect:http://localhost:8080/controller/userlogin";
		} else {
			int product_code1 = Integer.parseInt(product_code);
			ProductDTO view = productservice.productview(product_code1);
			
			model.addAttribute("view", view);
			model.addAttribute("contentpage", "shop/detailview2.jsp");
			// System.out.println(view);
		}
		mainservice.header(model);
		return "home";
	}
	
	
/*	@RequestMapping("/RegistrationBuyer")
	public String RegistrationBuyer(Model model) {
		model.addAttribute("contentpage", "registercustomer.jsp");
		return "Registration/register";
	}
		
	@RequestMapping("/registercustomer/insertcustomer")
	public String insertcustomer(Model model, @ModelAttribute CustomerDTO dto, String tel1,  String tel2,  String email1) {
		dto.setEnable(true);
		dto.setTel(dto.getTel()+"-"+tel1+"-"+tel2);
		dto.setEmail(dto.getEmail()+"@"+email1);
		
		ArrayList<AuthDTO> arr = new ArrayList<AuthDTO>();
		arr.add(new AuthDTO(dto.getId(),"ROLE_USER"));
		dto.setAuthlist(arr);
		
		service.join_Customer(dto);
		
		return "redirect:http://localhost:8080/controller/userlogin";
	}
	
	@RequestMapping("/registercustomer/customeridcheck/{id}")
	@ResponseBody
	public int customerIdCheck(@PathVariable String id) {
		int result = service.customeridcheck(id);
			return result;
	}
	
	@RequestMapping("/registercustomer/customeremailcheck")
	@ResponseBody
	public int customerEmailCheck(@RequestParam String email) {
		System.out.println(email);
		int result = service.customeremailcheck(email);
		System.out.println(result);
			return result;
	}*/
}
