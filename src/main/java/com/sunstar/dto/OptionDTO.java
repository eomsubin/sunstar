package com.sunstar.dto;
import lombok.Setter;

import lombok.Getter;

@Getter @Setter
public class OptionDTO {
	private int product_code;
	private String color;
	private String size;
	private int inventory;
	private int add_price;
}
