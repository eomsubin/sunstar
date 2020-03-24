
package com.sunstar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sunstar.dto.CustomerDTO;
import com.sunstar.dto.OrderDTO;
import com.sunstar.dto.ShipDTO;

@Mapper
public interface MyPageMapper {
	
	void infoUpdate(CustomerDTO info);

	CustomerDTO getUserInfo(String id);

	void addshipaddr(ShipDTO adddata);

	List<ShipDTO> getShipAddr(String id);

	void updateShip(CustomerDTO customer);

	ShipDTO getAship(ShipDTO sdto);

	void deleteShip(ShipDTO sdto);

	List<OrderDTO> orderDetail(String order_code);
}

