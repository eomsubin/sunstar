package com.sunstar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.ProductDTO;

@Mapper
public interface Homemapper {

	// 검색 카테고리
	List<CategoryDTO> getCategory(); 
	
	List<CategoryDTO> getCategory2();

	List<ProductDTO> getProductList();
	
	
}
