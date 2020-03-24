
package com.sunstar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunstar.dto.CustomerDTO;
import com.sunstar.dto.OrderDTO;
import com.sunstar.dto.ShipDTO;
import com.sunstar.mapper.MyPageMapper;

@Service("mpservice")
public class MyPageServiceImple implements MyPageService {
	
	@Autowired
	private MyPageMapper mpmapper;

	@Override
	public void infoUpdate(CustomerDTO info) {
		mpmapper.infoUpdate(info);
		
	}

	@Override
	public CustomerDTO getUserInfo(String id) {
		// TODO Auto-generated method stub
		return mpmapper.getUserInfo(id);
	}

	@Override
	public void addshipaddr(ShipDTO adddata) {
		
		mpmapper.addshipaddr(adddata);
	}

	@Override
	public List<ShipDTO> getShipAddr(String id) {
		// TODO Auto-generated method stub
		return mpmapper.getShipAddr(id);
	}

	@Override
	public void updateShip(ShipDTO sdto) {
		sdto.getShipping_name();
		// to_name으로 addr값 가져오기
		ShipDTO getAddr=mpmapper.getAship(sdto);
		
		// addr값을 customer에 addr로 업데이트
		
		CustomerDTO customer= new CustomerDTO();
		customer.setId(sdto.getId());
		customer.setAddress1(getAddr.getShipping_addr1());
		customer.setAddress2(getAddr.getShipping_addr2());
		customer.setAddress3(getAddr.getShipping_addr3());
		customer.setZip(getAddr.getShipping_zip());
	
		
		mpmapper.updateShip(customer);
		
	}

	@Override
	public void deleteShip(ShipDTO sdto) {
		
		mpmapper.deleteShip(sdto);
		
	}

	@Override
	public List<OrderDTO> orderDetail(String order_code) {
		// TODO Auto-generated method stub
		return mpmapper.orderDetail(order_code);
	}
	
	
	
	
}


