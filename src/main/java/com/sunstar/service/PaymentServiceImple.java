package com.sunstar.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sunstar.dto.CartDTO;
import com.sunstar.dto.OrderDTO;
import com.sunstar.dto.OrderListDTO;
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
	@Transactional(rollbackFor= {Exception.class},propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
	@Override
	public int addOrder(OrderDTO odto) {
		pm.addOrder(odto);
		
		
			for(int i=0; i<odto.getProduct_codes().size();i++) {
				OrderListDTO order = new OrderListDTO();
				order.setOrder_code(odto.getOrder_code());
				order.setProduct_code(odto.getProduct_codes().get(i));
				order.setOption1(odto.getOptions1().get(i));
				order.setOption2(odto.getOptions2().get(i));
				order.setQuantity(odto.getQuantities().get(i));
				order.setAdd_price(odto.getAdd_prices().get(i));
				//System.out.println("2        "+order);
				//list.add(order);
				
				pm.addOrderList(order);
			}
			
			pm.addShip(odto);
		
			return 0;
		 
	}

	@Override
	public List<OrderDTO> buylist(String id) {
		
		
		return pm.buylist(id);
	}
	
	

	
	
	
	
	
	
}
