package com.sunstar.dto;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

@Setter @Getter @ToString
public class ShipDTO {
	private String id;
	private String shipping_name;
	private String shipping_addr1;
	private String shipping_addr2;
	private String shipping_addr3;
	private String shipping_zip;
	private String to_name; 
}
