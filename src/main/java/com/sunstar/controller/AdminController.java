package com.sunstar.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sunstar.dto.CategoryDTO;
import com.sunstar.service.AdminService;
import com.sunstar.service.FileUploadService;

@Controller @RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private AdminService adminservice;
	
	public String getId( Model model, Principal principal) {
		String id = "";
		if(principal!=null) {
			id= principal.getName();
			System.out.println(id);
		}
		return id;
	}

	
	@RequestMapping("/index")
	public String index(Model model) {
		
		model.addAttribute("adminpage", "temp_main.jsp");
		return "admin/temp";
	}
	
	@RequestMapping("/seller_apply")
	public String seller_apply(Model model) {
		model.addAttribute("adminpage", "seller_apply.jsp");
		return "admin/temp";
	}
	
	@RequestMapping("/seller_list")
	public String seller_list(Model model) {
		model.addAttribute("adminpage", "seller_list.jsp");
		return "admin/temp";
	}
	
	@RequestMapping("/category")
	public String category(Model model) {
		
		List<CategoryDTO> lv1 = adminservice.getLv1();
		
		
		model.addAttribute("adminpage", "category.jsp");
		return "admin/temp";
	}
	
	@RequestMapping("/oneforone")
	public String oneforone(Model model) {
		model.addAttribute("adminpage", "oneforone.jsp");
		return "admin/temp";
	}
	
	@RequestMapping("/settings")
	public String settings(Model model) {
		
		
		model.addAttribute("adminpage", "settings.jsp");
		return "admin/temp";
	}
	
	
	

	
	
	
}
