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
	
	// ��� ī�װ�
	public List<CategoryDTO> getcategorylist(); //parkjinwoo 
	// ��ǰ ����Ʈ
	public List<ProductDTO> getproductList(HashMap<String, Object> map); //parkjinwoo
	// ��ǰ �� 
	public String gettotalcount(HashMap<String, Object> map); //parkjinwoo
	// ��ǰ �Ǹ���
	public List<String> getproductsellername(HashMap<String, Object> map);
	// ��ǰ�� ����
	public List<ReviewDTO> reviewList(HashMap<String, String> map);

	public OrderDTO getOrderdetail(String order_no);

	public int customerinsertreview(HashMap<String, String> map);

	public HashMap<String, String> customerdetailreview(String order_no);



	

	
}
