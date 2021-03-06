
package com.sunstar.service;

import java.util.List;

import com.sunstar.dto.CustomerDTO;
import com.sunstar.dto.OrderDTO;
import com.sunstar.dto.OrderListDTO;
import com.sunstar.dto.ShipDTO;

public interface MyPageService {
	
	void infoUpdate(CustomerDTO info);

	CustomerDTO getUserInfo(String id);

	void addshipaddr(ShipDTO adddata);

	List<ShipDTO> getShipAddr(String id);

	void updateShip(ShipDTO sdto);

	void deleteShip(ShipDTO sdto);

	List<OrderDTO> orderDetail(String order_code);

	List<OrderDTO> getPrice(String order_code);

	int getTotalCount(String id);

	void refund(OrderListDTO dto);

	void updatePw(CustomerDTO info);

	void updateTel(CustomerDTO user);

	int userDrop(CustomerDTO cdto);

	void exchange(OrderListDTO odto);
}	

