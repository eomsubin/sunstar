package com.sunstar.service;

import java.util.List;

import com.sunstar.dto.OrderDTO;

public interface PaymentService {

	List<OrderDTO> getOrderList();
	
}
