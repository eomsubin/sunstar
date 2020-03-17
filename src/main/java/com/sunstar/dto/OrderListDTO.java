package com.sunstar.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class OrderListDTO {
	private String order_code;
	private int order_no;
	private int product_code;
	private int quantity;
	private String option1;
	private String option2;
	private int inventory;
	private int add_price;
}
