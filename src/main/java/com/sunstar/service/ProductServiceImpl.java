package com.sunstar.service;



import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunstar.dao.ProductViewDAO;
import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.OptionDTO;
import com.sunstar.dto.OrderDTO;
import com.sunstar.dto.ProductDTO;
import com.sunstar.dto.QnaDTO;
import com.sunstar.dto.ReviewDTO;
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
	
	@Override // 모든 카테고리 parkjinwoo
	public List<CategoryDTO> getcategorylist() {
		return productmapper.getcategorylist();
	}

	@Override // 상품 리스트 parkjinwoo
	public List<ProductDTO> getproductList(HashMap<String, Object> map) {
		return productmapper.getproductList(map);
	}

	@Override // 자료 수 parkjinwoo
	public String gettotalcount(HashMap<String, Object> map) {
		return productmapper.gettotalcount(map);
	}

	@Override // 제품 판매자 parkjinwoo
	public List<String> getproductsellername(HashMap<String, Object> map) {
		return productmapper.getproductsellername(map);
	}

	@Override
	public List<ReviewDTO> reviewList(HashMap<String, String> map) {
		return productmapper.reviewList(map);
	}

	@Override
	public OrderDTO getOrderdetail(String order_no) {
		return productmapper.getOrderdetail(order_no);
	}

	@Override
	public int customerinsertreview(HashMap<String, String> map) {
		return productmapper.customerinsertreview(map);
	}

	@Override
	public HashMap<String, String> customerdetailreview(String order_no) {
		return productmapper.customerdetailreview(order_no);
	}

	@Override
	public List<QnaDTO> qnaList(String product_code) {
		return productmapper.qnaList(product_code);
	}

	@Override
	public void insert_qna(QnaDTO dto) {
		 productmapper.insert_qna(dto);
	}
	
}
