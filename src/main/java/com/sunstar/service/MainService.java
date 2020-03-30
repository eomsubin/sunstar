package com.sunstar.service;

import java.util.List;

import org.springframework.ui.Model;

import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.ProductDTO;

public interface MainService {

	List<CategoryDTO> getCategory();

	List<CategoryDTO> getCategory2();

	public String header(Model model);

	List<ProductDTO> getProductList();
		
	
	
}
