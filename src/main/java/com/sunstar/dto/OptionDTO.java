package com.sunstar.dto;
import lombok.Setter;
import lombok.ToString;
import lombok.Getter;

@Getter @Setter @ToString
public class OptionDTO {
	private int product_code;
	private String option1;
	private String option2;
	private int inventory;
	private int add_price;
}
