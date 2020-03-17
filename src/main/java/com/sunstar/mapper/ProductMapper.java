package com.sunstar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sunstar.controller.ProductController;
import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.ProductDTO;

@Mapper
public interface ProductMapper {

	ProductDTO productview(int product_code);

	List<ProductDTO> productListCategorylv2(String lv2); //parkjinwoo

	List<ProductDTO> productListCategorylv3(CategoryDTO cdto); //parkjinwoo
	
	List<CategoryDTO> productlv3bylv2(String lv2); //parkjinwoo

	List<CategoryDTO> productlv2bylv1(String lv1); //parkjinwoo

	
}
