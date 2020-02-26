package com.sunstar.service;

import java.util.List;

import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.ProductDTO;

public interface SellerService {

	List<CategoryDTO> getCategory();

	int getCategoryCount();

	void addProduct(ProductDTO dto);

	List<ProductDTO> list();

}
