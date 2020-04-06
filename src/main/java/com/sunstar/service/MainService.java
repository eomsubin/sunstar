package com.sunstar.service;

import java.util.List;

import org.springframework.ui.Model;

import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.ProductDTO;
import com.sunstar.dto.SellerDTO;

public interface MainService {

	List<CategoryDTO> getCategory();

	List<CategoryDTO> getCategory2();

	public String header(Model model);

	List<ProductDTO> getProductList();

	List<ProductDTO> getDigital();

	List<ProductDTO> getFurniture();

	List<ProductDTO> getFood();

	List<ProductDTO> getAnimal();

	List<ProductDTO> getRecommend();

	
	
}
