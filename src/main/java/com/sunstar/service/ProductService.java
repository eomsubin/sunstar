package com.sunstar.service;

import java.util.List;

import com.sunstar.dao.ProductViewDAO;
import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.ProductDTO;

public interface ProductService {
	public ProductDTO productview(int product_code);

	public List<ProductDTO> productListCategorylv2(String lv2); //parkjinwoo

	public List<ProductDTO> productListCategorylv3(CategoryDTO cdto); //parkjinwoo
	
	public List<CategoryDTO> productlv3bylv2(String lv2);//parkjinwoo

	public List<CategoryDTO> productlv2bylv1(String lv1); //parkjinwoo

	

	
}
