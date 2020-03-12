package com.sunstar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.OptionDTO;
import com.sunstar.dto.OrderDTO;
import com.sunstar.dto.ProductDTO;

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




}
