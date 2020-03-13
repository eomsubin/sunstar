package com.sunstar.service;

import java.util.List;

import com.sunstar.dao.ProductViewDAO;
import com.sunstar.dto.ProductDTO;

public interface ProductService {
	public ProductDTO productview(int product_code);

	public List<ProductDTO> productListCategory(String lv2); //parkjinwoo
}
