package com.sunstar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.ProductDTO;

@Mapper
public interface ProductMapper {

	List<CategoryDTO> getCategory();

	List<ProductDTO> list();

	ProductDTO productview(int product_code);
}
