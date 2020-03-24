package com.sunstar.service;

import java.util.List;

import com.sunstar.dto.CustomerDTO;
import com.sunstar.dto.OrderDTO;
import com.sunstar.dto.ShipDTO;

public interface MyPageService {
	
	void infoUpdate(CustomerDTO info);

	CustomerDTO getUserInfo(String id);

	void addshipaddr(ShipDTO adddata);

	List<ShipDTO> getShipAddr(String id);

	void updateShip(ShipDTO sdto);

	void deleteShip(ShipDTO sdto);

	List<OrderDTO> orderDetail(String order_code);
}	
