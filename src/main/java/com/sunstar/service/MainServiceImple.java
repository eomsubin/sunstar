package com.sunstar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.ProductDTO;
import com.sunstar.mapper.Homemapper;

@Service("mainservice")
public class MainServiceImple implements MainService {
	@Autowired
	private Homemapper homemapper;
	
	@Override
	public List<CategoryDTO> getCategory() {
		

		return homemapper.getCategory();
	}

	@Override
	public List<CategoryDTO> getCategory2() {
		
		return homemapper.getCategory2();
	}
	@Override
	public String header(Model model) {
		List<CategoryDTO> clist=getCategory();
		List<CategoryDTO> clist2=getCategory2();
		
		
		model.addAttribute("catelist",clist);
		model.addAttribute("catelist2",clist2);	
		
		return "header2";
		
	}

	@Override
	public List<ProductDTO> getProductList() {
		
		return homemapper.getProductList();
	}
	
	
}
