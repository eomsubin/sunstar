package com.sunstar.service;

import java.util.List;

import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.OptionDTO;
import com.sunstar.dto.OrderDTO;
import com.sunstar.dto.ProductDTO;

public interface SellerService {

	List<CategoryDTO> getCategory();

	int getCategoryCount();

	void addProduct(ProductDTO dto);

	List<ProductDTO> list();

	void deleteProduct(int pcode);

	List<String> getOptioncolor(int pcode);
	
	void updateinventory(OptionDTO dto);

	List<OrderDTO> orderlist();

	List<OrderDTO> shippinglist();

	OrderDTO theOrderlist(String order_code);

	void changeStep(OrderDTO dto);

	void updateTracking(OrderDTO dto);


}
