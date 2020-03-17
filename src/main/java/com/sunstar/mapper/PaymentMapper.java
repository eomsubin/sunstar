package com.sunstar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sunstar.dto.CartDTO;
import com.sunstar.dto.OrderDTO;
import com.sunstar.dto.OrderListDTO;

@Mapper
public interface PaymentMapper {

	List<OrderDTO> getOrderList();
	
	
	CartDTO viewOrdered(CartDTO userinfo);


	int addOrder(OrderDTO odto);


	int addOrderList(OrderListDTO order);
	
	
}
