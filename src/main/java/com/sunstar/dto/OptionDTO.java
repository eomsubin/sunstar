package com.sunstar.dto;
import lombok.Setter;
import lombok.ToString;
import lombok.Getter;

@Getter @Setter @ToString
public class OptionDTO {
	private int product_code;
	private String option1; //可记1 = color 
	private String option2; //可记2 = size
	private int inventory;
	private int add_price;
}
