package com.sunstar.dto;
import lombok.Setter;
import lombok.ToString;
import lombok.Getter;

@Getter @Setter @ToString
public class OptionDTO {
	private int product_code;
	private String color;
	private String size;
	private int inventory;
	private int add_price;
}
