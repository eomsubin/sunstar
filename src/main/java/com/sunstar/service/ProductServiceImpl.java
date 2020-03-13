package com.sunstar.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunstar.dao.ProductViewDAO;
import com.sunstar.dto.ProductDTO;
import com.sunstar.mapper.ProductMapper;

@Service("productservice")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productmapper;

	@Override
	public ProductDTO productview(int product_code) {
		// TODO Auto-generated method stub
		return productmapper.productview(product_code) ;
	}

	@Override //parkjinwoo
	public List<ProductDTO> productListCategory(String lv2) {
		
		return productmapper.productListCategory(lv2);
	}
	
	

}
