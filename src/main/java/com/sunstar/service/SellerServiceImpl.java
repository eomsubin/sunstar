package com.sunstar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.OptionDTO;
import com.sunstar.dto.OrderDTO;
import com.sunstar.dto.ProductDTO;
import com.sunstar.mapper.SellerMapper;

@Service("sellerservice")
public class SellerServiceImpl implements SellerService {

	@Autowired
	private SellerMapper mapper;

	@Override
	public List<CategoryDTO> getCategory() {
		return mapper.getCategory();
	}

	@Override
	public int getCategoryCount() {
		// TODO Auto-generated method stub
		return mapper.getCategoryCount();
	}

	@Override
	public void addProduct(ProductDTO dto) {
		//상품코드 생성
		mapper.addProduct(dto);
		
		//옵션 수만큼 반복
		for(int i =0; i<dto.getOptions().size(); i++) {
			//상품코드 불러와서
		//	ProductDTO dto2 = mapper.aProduct();
			//그 상품코드에 맞는 옵션 추가
			System.out.println("****");
			
			OptionDTO dto2 = new OptionDTO();
			dto2.setProduct_code(mapper.aProduct());
			dto2.setOption1(dto.getOptions().get(i).getOption1());
			dto2.setOption2(dto.getOptions().get(i).getOption2());
			dto2.setInventory(dto.getOptions().get(i).getInventory());
			dto2.setAdd_price(dto.getOptions().get(i).getAdd_price());
			mapper.addOptions(dto2);
		}

	}

	@Override
	public List<ProductDTO> list() {
		// TODO Auto-generated method stub
		return mapper.list();
	}

	@Override
	public void deleteProduct(int pcode) {
		//옵션즈 테이블에서 먼저 삭제
		mapper.deleteProductOptions(pcode);
		
		//상품리스트 테이블에서 삭제
		mapper.deleteProduct(pcode);
		
	}
	@Override
	public List<String> getOptioncolor(int pcode) {
		List<String> list = mapper.getOptionColor(pcode);
		

		return list;
	}
	
	@Override
	public void updateinventory(OptionDTO dto) {
		mapper.updateInventory(dto);
	}

	@Override
	public List<OrderDTO> orderlist() {
		return mapper.orderlist();
	}
	
	@Override
	public List<OrderDTO> shippinglist() {
		return mapper.shippinglist();
	}

	@Override
	public OrderDTO theOrderlist(String order_code) {
		return mapper.theOrderlist(order_code);
	}
	
	


	
	
	
	
	
	
}
