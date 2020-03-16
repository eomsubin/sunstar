package com.sunstar.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class OrderDTO {
	private String order_code;
	private String id;
	private String name;
	private String tel;
	private String shipping_addr1;
	private String shipping_addr2;
	private String shipping_addr3;
	private String shipping_zip;
	private String order_way;
	private String delivery_state;
	private String tracking_no;
	private String shipping_company;
	private String non_tel;
	
	private int order_no;
	private int product_code;
	private int quantity;
	private String option1;
	private String option2;
	private int inventory;
	private int add_price;
	private int price;
	private String product_name;
	private String to_name;
	
	private String message;
	
	private String shipping_name;
}
