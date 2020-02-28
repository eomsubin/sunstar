package com.sunstar.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.OptionDTO;
import com.sunstar.dto.ProductDTO;
import com.sunstar.service.SellerService;

@Controller
public class SellerController {

	@Autowired
	private SellerService sellerservice;
	
	@RequestMapping("/seller")
	public String seller(Model model) {
		
		model.addAttribute("sellerpage", "temp_main.jsp");
		return "sellers/temp";
	}
	
	//상품 목록 보기
	@RequestMapping("/productlist")
	public String product(Model model) {
		
		List<ProductDTO> plist = sellerservice.list();		
		
		model.addAttribute("plist", plist);
		
		//
		//페이지에 카테고리 표시
		List<CategoryDTO> clist = sellerservice.getCategory();
		List<CategoryDTO> dlist = new ArrayList<>();
		for(CategoryDTO dto : clist) {
			dto.setLv123(dto.getLv1()+" - "+dto.getLv2()+" - "+dto.getLv3()); 
			dlist.add(dto);
		}
		model.addAttribute("dlist", dlist);
		//
		
		
		model.addAttribute("sellerpage", "productlist.jsp");
		return "sellers/temp";
	}
	
	//상품 추가 하기
	@RequestMapping("/addproduct")
	public String addproduct(Model model) {
	
		//페이지에 카테고리 표시
		List<CategoryDTO> clist = sellerservice.getCategory();
		List<CategoryDTO> dlist = new ArrayList<>();
		for(CategoryDTO dto : clist) {
			dto.setLv123(dto.getLv1()+" - "+dto.getLv2()+" - "+dto.getLv3()); 
			dlist.add(dto);
		}
		model.addAttribute("dlist", dlist);
		
		model.addAttribute("sellerpage", "addsproduct.jsp");
		return "sellers/temp";
	}
	
	@RequestMapping("/addproductresult")
	public String addproductresult(ProductDTO dto) {
		sellerservice.addProduct(dto);
		return "redirect:/productlist";
	}
	
	@RequestMapping("/deleteproduct/{pcode}")
	public String deleteproduct(@PathVariable int pcode ) {
		
		sellerservice.deleteProduct(pcode);
		return "redirect:/productlist";
	}
	
	private List<Integer> plist = new ArrayList<>();

	@RequestMapping("/updateinventory/{pcode}/{gesu}")
	public String updateinventory(@PathVariable int pcode, @PathVariable int gesu){

		Object a = (Object)pcode;
		
		if(!plist.contains(a)) {
			plist.add(pcode);
			System.out.println("성공" + pcode);
		}else {
			System.out.println("실패" + pcode);
		}
		
		
		System.out.println("size: "+plist.size());
		
		for(int i=0;i<plist.size();i++) {
			System.out.println("index  -------- "+i);
			System.out.println("value ----------"+plist.get(i));
		}

		/*System.out.println("////");
		System.out.println(plist);
		System.out.println("////");
		for(int i=0;i<plist.size();i++) {

			int product = plist.get(i);		
			List<String> color = sellerservice.getOptioncolor(product);
			
			for(String aaa : color) {
				System.out.println("--------------시작--");
				System.out.println(pcode);
				System.out.println(aaa);
				System.out.println("---------------끝-");
				OptionDTO dto = new OptionDTO();
				dto.setProduct_code(pcode);
				dto.setInventory(gesu);
				dto.setColor(aaa);
				sellerservice.updateinventory(dto);
			}
		}*/
		
		//	System.out.println("-----------pcode---시작--");
	//	System.out.println(pcode);
	//	System.out.println("-----------pcode----끝-");
		
		
	//	List<String> color = sellerservice.getOptioncolor(pcode);
	
	//	System.out.println("color 출력" + color);	*/
	/*	for(String a : color) {
			System.out.println("--------------시작--");

			System.out.println(pcode);
			System.out.println(a);
			System.out.println("---------------끝-");
			OptionDTO dto = new OptionDTO();
			dto.setProduct_code(pcode);
			dto.setInventory(gesu);
			dto.setColor(a);
			sellerservice.updateinventory(dto);
		}*/

		return "redirect:/productlist";
	}
}
