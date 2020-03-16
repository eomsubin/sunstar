package com.sunstar.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunstar.dao.ProductViewDAO;
import com.sunstar.dto.OptionDTO;
import com.sunstar.dto.ProductDTO;
import com.sunstar.mapper.ProductMapper;

@Service("productservice")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productmapper;

	@Override
	public ProductDTO productview(int product_code) {
		// TODO Auto-generated method stub
		ProductDTO dto = productmapper.productview(product_code) ;
		
		
		List<OptionDTO> option = productmapper.getOptions(product_code);
		dto.setOptions(option);
		System.out.println(dto);
		
		return dto;
	}

	@Override //parkjinwoo
	public List<ProductDTO> productListCategory(String lv2) {
		
		return productmapper.productListCategory(lv2);
	}
	
	

}
