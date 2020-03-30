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

	List<CategoryDTO> getcategorylist(); // ��� ī�װ� parkjinwoo

	List<ProductDTO> getproductList(HashMap<String, Object> map); // ��ǰ ����Ʈ parkjinwoo

	String gettotalcount(HashMap<String, Object> map);// �ڷ� �� parkjinwoo

	List<String> getproductsellername(HashMap<String, Object> map); // ��ǰ �Ǹ��� parkjinwoo

	List<ReviewDTO> reviewList(HashMap<String, String> map); // ��ǰ�� ���� parkjinwoo

	
}
