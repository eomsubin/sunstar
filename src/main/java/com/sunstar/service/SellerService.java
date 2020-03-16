package com.sunstar.service;

import java.util.List;

import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.MakePage;
import com.sunstar.dto.OptionDTO;
import com.sunstar.dto.OrderDTO;
import com.sunstar.dto.ProductDTO;
import com.sunstar.dto.SellerDTO;

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

	SellerDTO sellerInfo();

	void changePublicState(ProductDTO dto);
	
	void changeReviewState(ProductDTO dto);

	void changeInfo(SellerDTO dto);

	int totalCount(String category, String txt);

	List<ProductDTO> productlist(MakePage page);



}
