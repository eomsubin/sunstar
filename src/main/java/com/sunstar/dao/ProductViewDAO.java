package com.sunstar.dao;

import org.apache.ibatis.annotations.Mapper;

import com.sunstar.dto.CustomerDTO;
import com.sunstar.dto.ProductDTO;

@Mapper
public interface ProductViewDAO {
	
	//��ǰ��ȸ
	public ProductDTO productview(int product_code);
	
	
}
