package com.sunstar.service;

import java.util.HashMap;
import java.util.List;

import com.sunstar.dao.ProductViewDAO;
import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.ProductDTO;

public interface ProductService {
	public ProductDTO productview(int product_code);
	
	// 葛电 墨抛绊府
	public List<CategoryDTO> getcategorylist(); //parkjinwoo 
	// 力前 府胶飘
	public List<ProductDTO> getproductList(HashMap<String, Object> map); //parkjinwoo
	// 力前 荐 
	public String gettotalcount(HashMap<String, Object> map); //parkjinwoo
	// 力前 魄概磊
	public List<String> getproductsellername(HashMap<String, Object> map);



	

	
}
