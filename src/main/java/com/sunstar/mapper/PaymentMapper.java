package com.sunstar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sunstar.dto.CartDTO;
import com.sunstar.dto.OrderDTO;

@Mapper
public interface PaymentMapper {

	List<OrderDTO> getOrderList();
	
	
	List<CartDTO> viewOrdered(String id);
	
	
}
