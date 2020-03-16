package com.sunstar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunstar.dto.CartDTO;
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

	@Override
	public CartDTO viewOrdered(CartDTO userinfo) {
		
		
		return pm.viewOrdered(userinfo);
	}
	
	@Override
	public int addOrder(OrderDTO odto) {
		
		return pm.addOrder(odto);
	}

	
	
	
	
}
