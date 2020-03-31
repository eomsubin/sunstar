package com.sunstar.service;

import java.util.List;

import com.sunstar.dto.CartDTO;
import com.sunstar.dto.MakePage;
import com.sunstar.dto.OrderDTO;
import com.sunstar.dto.SellerDTO;

public interface PaymentService {

	List<OrderDTO> getOrderList();
	
	
	CartDTO viewOrdered(CartDTO userinfo);


	int addOrder(OrderDTO allData);


	List<OrderDTO> buylist(MakePage page);


	CartDTO getUserInfo(String id);


	CartDTO productDetail(String product_code, String id);


	CartDTO getProducts(SellerDTO seller_customer);


	int getProductCount(CartDTO userinfo);


	CartDTO getPrices(SellerDTO seller_customer);

	
	
}
