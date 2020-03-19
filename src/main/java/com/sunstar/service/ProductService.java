package com.sunstar.service;

import java.util.HashMap;
import java.util.List;

import com.sunstar.dao.ProductViewDAO;
import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.ProductDTO;

public interface ProductService {
	public ProductDTO productview(int product_code);
	
	// ��� ī�װ�
	public List<CategoryDTO> getcategorylist(); //parkjinwoo 
	// ��ǰ ����Ʈ
	public List<ProductDTO> getproductList(HashMap<String, Object> map); //parkjinwoo
	// ��ǰ �� 
	public String gettotalcount(HashMap<String, Object> map); //parkjinwoo
	// ��ǰ �Ǹ���
	public List<String> getproductsellername(HashMap<String, Object> map);



	

	
}
