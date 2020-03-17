package com.sunstar.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunstar.dao.ProductViewDAO;
import com.sunstar.dto.CategoryDTO;
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
	public List<ProductDTO> productListCategorylv1(String lv1) {
		// TODO Auto-generated method stub
		return productmapper.productListCategorylv1(lv1);
	}
	
	@Override //parkjinwoo
	public List<ProductDTO> productListCategorylv2(String lv2) {
		
		return productmapper.productListCategorylv2(lv2);
	}
	
	@Override //parkjinwoo
	public List<ProductDTO> productListCategorylv3(CategoryDTO cdto) {

		return productmapper.productListCategorylv3(cdto);
	}

	@Override //parkjinwoo
	public List<CategoryDTO> productlv3bylv2(String lv2) {

		return productmapper.productlv3bylv2(lv2);
	}

	@Override //parkjinwoo
	public List<CategoryDTO> productlv2bylv1(String lv1) {
 
		return productmapper.productlv2bylv1(lv1);
	}

	@Override //parkjinwoo
	public List<CategoryDTO> productlv1(String lv1) {
		// TODO Auto-generated method stub
		return productmapper.productlv1(lv1);
	}
}
