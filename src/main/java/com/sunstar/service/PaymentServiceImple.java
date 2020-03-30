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
import com.sunstar.dto.SellerDTO;
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
				order.setDelivery_state(odto.getDelivery_state());
				//System.out.println("2        "+order);
				//list.add(order);
				
				pm.addOrderList(order);
				pm.declineInventory(order);
			}
			
			for(int i=0; i<odto.getSeller_codes().size();i++) {
				OrderDTO price = new OrderDTO();
				price.setOrder_code(odto.getOrder_code());
				price.setSeller_code(odto.getSeller_codes().get(i));
				/*price.setTotal_price(odto.getTotal_prices().get(i));*/
				price.setShipping_cost_per_seller(odto.getShipping_cost_per_sellers().get(i));
				System.out.println(price);
				pm.addPrice(price);
			}
				
			for(int i=0;i<odto.getCart_nos().size();i++) {
				OrderDTO cart = new OrderDTO();
				cart.setCart_no(odto.getCart_nos().get(i));
				
				pm.deleteCart(cart);
			}
		
			return 0;
		 
	}

	@Override
	public List<OrderDTO> buylist(String id) {
		
		
		return pm.buylist(id);
	}

	@Override
	public CartDTO getUserInfo(String id) {
		
		return pm.getUserInfo(id);
	}

	@Override
	public CartDTO productDetail(String product_code,String id) {
		// TODO Auto-generated method stub
		
		return pm.productDetail(product_code,id);
	}

	@Override
	public CartDTO getProducts(SellerDTO seller_customer ) {
		// TODO Auto-generated method stub
		return pm.getProducts(seller_customer);
	}

	@Override
	public int getProductCount(CartDTO userinfo) {
		// TODO Auto-generated method stub
		return pm.getProductCount(userinfo);
	}
	
	

	
	
	
	
	
	
}
