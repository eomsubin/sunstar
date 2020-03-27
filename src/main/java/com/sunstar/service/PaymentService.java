package com.sunstar.service;

import java.util.List;

import com.sunstar.dto.CartDTO;
import com.sunstar.dto.OrderDTO;

public interface PaymentService {

	List<OrderDTO> getOrderList();
	
	
	CartDTO viewOrdered(CartDTO userinfo);


	int addOrder(OrderDTO allData);


	List<OrderDTO> buylist(String id);


	CartDTO getUserInfo(String id);


	CartDTO productDetail(String product_code, String id);


	CartDTO getProducts(CartDTO cpdto);


	List<String> getProductCount(String id);

	
	
}
