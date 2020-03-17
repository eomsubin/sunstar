package com.sunstar.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.MakePage;
import com.sunstar.dto.OptionDTO;
import com.sunstar.dto.OrderDTO;
import com.sunstar.dto.ProductDTO;
import com.sunstar.dto.SellerDTO;

@Mapper
public interface SellerMapper {

	List<CategoryDTO> getCategory();

	int getCategoryCount();

	void addProduct(ProductDTO dto);

	int aProduct();
	
	void addOptions(OptionDTO dto);

	List<ProductDTO> list();

	void deleteProductOptions(int pcode);
	void deleteProduct(int pcode);

	List<String> getOptionColor(int pcode);
	void updateInventory(OptionDTO dto);

	List<OrderDTO> orderlist();

	List<OrderDTO> shippinglist();

	OrderDTO theOrderlist(String order_code);

	void changeStep(OrderDTO dto);

	void updateTracking(OrderDTO dto);

	SellerDTO sellerInfo();

	void changePublicState(ProductDTO dto);

	void changeReviewState(ProductDTO dto);

	void changeInfo(SellerDTO dto);

	int getCount(HashMap<String, Object> hm);

	List<ProductDTO> productlist(MakePage page);

	void update_seller_info(SellerDTO dto);




}
