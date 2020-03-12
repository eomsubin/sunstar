package com.sunstar.service;

import java.util.List;

import org.springframework.ui.Model;

import com.sunstar.dto.CategoryDTO;

public interface MainService {

	List<CategoryDTO> getCategory();

	List<CategoryDTO> getCategory2();

	public String header(Model model);
		
	
	
}
