package com.sunstar.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.jstl.core.IteratedExpression;

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

import com.mysql.cj.util.DnsSrv.SrvRecord;
import com.sunstar.dao.ProductViewDAO;
import com.sunstar.dto.AuthDTO;
import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.CustomerDTO;
import com.sunstar.dto.CustomerUserDetail;
import com.sunstar.dto.MakePage;
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

	@Autowired
	private MainService mainservice;	
	
	public String header(Model model) {
		List<CategoryDTO> clist= mainservice.getCategory();
		List<CategoryDTO> clist2= mainservice.getCategory2();
		model.addAttribute("catelist",clist);
		model.addAttribute("catelist2",clist2);	
		
		return "header2";
	}
	
	@RequestMapping("/list")
	public String productListlv1(Model model, HttpServletRequest httpServletRequest, @RequestParam HashMap<String, Object> map) {
		header(model);
		//param
		Iterator<String> ita = map.keySet().iterator();
		while(ita.hasNext())
		{
			String key = ita.next();
			System.out.println(key+", "+map.get(key));
		}
		//check category lv
		String category = (String)map.get("category");
		List<CategoryDTO> categorylist = productservice.getcategorylist();
		HashMap<String, String> categorymap = new HashMap<>();
		for(CategoryDTO dto : categorylist)
		{
			if(dto.getCategory_code().equals(category))
			{
				map.put("where", "lv3");
				map.put("lv1", dto.getLv1());
				map.put("lv2", dto.getLv2());
				map.put("lv2code", dto.getLv2code());
				map.put("lv3", dto.getLv3());
				categorymap.put(dto.getLv3(), dto.getCategory_code());
				break;
			}
			if(dto.getLv2code().equals(category))
			{
				map.put("where", "lv2");
				map.put("lv1", dto.getLv1());
				map.put("lv2", dto.getLv2());
				map.put("lv2code", dto.getLv2code());
				categorymap.put(dto.getLv3(), dto.getCategory_code());
			}
			if(dto.getLv1().equals(category))
			{
				map.put("where", "lv1" );
				map.put("lv1", dto.getLv1());
				categorymap.put(dto.getLv2(), dto.getLv2code());
			}
		}
		map.put("categorymap", categorymap);
		// end category
		
		
		// paging
		int totalCount = Integer.parseInt(productservice.gettotalcount(map));
		
		String curr =(String)map.get("curr");
		if(curr == null) 
			curr="1";
		int currpage = Integer.parseInt(curr);
		int sizePerPage=9;
		int blockSize=10;
		MakePage page = new MakePage(currpage, totalCount, sizePerPage, blockSize);
		map.put("page", page);
		// end pagin
				
		// select productlist
		List<ProductDTO> productlist = productservice.getproductList(map);
		model.addAttribute("productlist", productlist);
		// end select productlist
		
		// seller name
		List<String> seller_name = new ArrayList<>();//seller name
		for(ProductDTO dto : productlist)
		{
			if(!seller_name.contains(dto.getSeller_name()))
				seller_name.add(dto.getSeller_name());
		}
		map.put("sellername", seller_name);
		// end seller name
		
		model.addAttribute("page", page);
		model.addAttribute("map", map);
		model.addAttribute("contentpage", "ProductList/productList.jsp");
		return "/home";
	}
	/*@RequestMapping("/category/{lv1}")
	public String productListlv1(Model model, @PathVariable String lv1, HttpServletRequest httpServletRequest, @RequestParam HashMap<String, Object> map) {
		header(model);
		//param
		Iterator<String> ita = map.keySet().iterator();
		while(ita.hasNext())
		{
			String key = ita.next();
			System.out.println(key+", "+map.get(key));
		}
		

		//lv1 카테고리 상품 list, seller name
		List<ProductDTO> productlistlv1 =productservice.productListCategorylv1(lv1);//lv1 카테고리 상품 list
		List<String> seller_name = new ArrayList<>();//seller name
				for(ProductDTO dto : productlistlv1)
				{
					if(!seller_name.contains(dto.getSeller_name()))
						seller_name.add(dto.getSeller_name());
				}
		//model.addAttribute("sellerlist",seller_name);
		//end 

		//lv1  카테고리 list
		List<CategoryDTO> categorylistlv1 =productservice.productlv1(lv1);
		model.addAttribute("categorylistlv1", categorylistlv1);
		
		//lv1 > lv2 카테고리 list
		List<CategoryDTO> categorylistlv2 =productservice.productlv2bylv1(lv1);
		model.addAttribute("categorylistlv2", categorylistlv2);

		
		//lv1 카테고리 상품 search list
		List<ProductDTO> productlist =productservice.productListCategorylv1(map);
		model.addAttribute("productlist", productlist);
		
		

		
		model.addAttribute("contentpage", "ProductList/productList.jsp");
		return "/home";
	}*/
	/*@RequestMapping("/category/{lv1}/{lv2}")
	public String productListlv2(Model model, @PathVariable String lv1 ,@PathVariable String lv2, Principal principal) {
		header(model);
		// security id, name
		if(principal!=null)
		{
		System.out.println(principal);
		CustomerUserDetail detail = (CustomerUserDetail)((Authentication)principal).getPrincipal();
		System.out.println(detail.getUsername());
		System.out.println(detail.getId());
		}
		
		//lv1 > lv2 카테고리 list
		List<CategoryDTO> categorylistlv2 =productservice.productlv2bylv1(lv1);
		model.addAttribute("categorylistlv2", categorylistlv2);

		//lv2 > lv3 카테고리 list
		List<CategoryDTO> categorylistlv3 =productservice.productlv3bylv2(lv2); 
		model.addAttribute("categorylistlv3", categorylistlv3);
		
		//lv2 카테고리 상품 list
		List<ProductDTO> productlist =productservice.productListCategorylv2(lv2);
		model.addAttribute("productlist", productlist);
		
		//seller_name
		List<String> seller_name = new ArrayList<>();
		for(ProductDTO dto : productlist)
		{
			if(!seller_name.contains(dto.getSeller_name()))
				seller_name.add(dto.getSeller_name());
		}
		model.addAttribute("sellerlist",seller_name);
		
		model.addAttribute("contentpage", "ProductList/productList.jsp");
		return "/home";
	}
	
	@RequestMapping("/category/{lv1}/{lv2}/{lv3}")
	public String productListlv3(Model model, @PathVariable String lv1 ,@PathVariable String lv2,@PathVariable String lv3) {
		header(model);
		//lv1 > lv2 카테고리 list
		List<CategoryDTO> categorylistlv2 =productservice.productlv2bylv1(lv1);
		model.addAttribute("categorylistlv2", categorylistlv2);

		//lv2 > lv3 카테고리 list
		List<CategoryDTO> categorylistlv3 =productservice.productlv3bylv2(lv2); 
		model.addAttribute("categorylistlv3", categorylistlv3);

		//lv3 카테고리 상품 list
		CategoryDTO cdto = new CategoryDTO();
		cdto.setLv2(lv2);
		cdto.setLv3(lv3);
		List<ProductDTO> productlist =productservice.productListCategorylv3(cdto);
		model.addAttribute("productlist", productlist);
		
		//seller_name
		List<String> seller_name = new ArrayList<>();
		for(ProductDTO dto : productlist)
		{
			if(!seller_name.contains(dto.getSeller_name()))
				seller_name.add(dto.getSeller_name());
		}
		model.addAttribute("sellerlist",seller_name);
		
		model.addAttribute("contentpage", "ProductList/productList.jsp");
		return "/home";
	}*/
	
	// 상품 상세보기
	@RequestMapping(value = "/detailview2", method = RequestMethod.GET)
	public String detailview(@RequestParam(defaultValue = "") String product_code, Model model) {
		if (product_code.equals("")) {
			System.out.println("값이 없습니다.");
			return "redirect:http://localhost:8080/controller/userlogin";
		} else {
			int product_code1 = Integer.parseInt(product_code);
			ProductDTO view = productservice.productview(product_code1);
			
			model.addAttribute("view", view); // detail, option detail --> 장바구니 또는 결제 가야하는게 목표  
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
