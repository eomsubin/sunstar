package com.sunstar.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class ChartDTO {
	
	private String seller_code;
	
	private String month_name;
	private int month;
	private int yy = 20;
	private int[] mm = {1,2,3,4,5,6,7,8,9,10,11,12};
//	private int[] yyyymm = {202001,202002,202003,202004,202005};
	private int month_data;
	
	private int yyyymm[] = {202001,202002,202003,202004,202005,202006,202007,202008,202009,202010,202011,202012};

}
