package com.sunstar.service;

import java.util.HashMap;
import java.util.List;

import com.sunstar.dao.ProductViewDAO;
import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.OrderDTO;
import com.sunstar.dto.ProductDTO;
import com.sunstar.dto.ReviewDTO;

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
	// 力前喊 府轰
	public List<ReviewDTO> reviewList(HashMap<String, String> map);

	public OrderDTO getOrderdetail(String order_no);

	public int customerinsertreview(HashMap<String, String> map);

	public HashMap<String, String> customerdetailreview(String order_no);



	

	
}
