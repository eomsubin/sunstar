package com.sunstar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunstar.dto.OrderDTO;
import com.sunstar.mapper.PaymentMapper;

@Service("paymentserivce")
public class PaymentServiceImple implements PaymentService {

	@Autowired
	private PaymentMapper pm;
	
	@Override
	public List<OrderDTO> getOrderList() {
	
		return pm.getOrderList();
	}
	
	
	
}
