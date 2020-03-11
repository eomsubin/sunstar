package com.sunstar.dao;

import org.apache.ibatis.annotations.Mapper;

import com.sunstar.dto.CustomerDTO;
import com.sunstar.dto.ProductDTO;

@Mapper
public interface ProductViewDAO {
	
	//상품조회
	public ProductDTO productview(int product_code);
	
	
}
