package com.sunstar.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sunstar.controller.ProductController;
import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.OptionDTO;
import com.sunstar.dto.ProductDTO;
import com.sunstar.dto.ReviewDTO;

@Mapper
public interface ProductMapper {

	ProductDTO productview(int product_code);

	List<OptionDTO> getOptions(int product_code);

	List<CategoryDTO> getcategorylist(); // 모든 카테고리 parkjinwoo

	List<ProductDTO> getproductList(HashMap<String, Object> map); // 상품 리스트 parkjinwoo

	String gettotalcount(HashMap<String, Object> map);// 자료 수 parkjinwoo

	List<String> getproductsellername(HashMap<String, Object> map); // 상품 판매자 parkjinwoo

	List<ReviewDTO> reviewList(HashMap<String, String> map); // 상품별 리뷰 parkjinwoo

	
}
