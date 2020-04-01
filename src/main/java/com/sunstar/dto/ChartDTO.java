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
	private int month_data;
	
	private int yyyymm[] = {202001,202002,202003,202004,202005,202006,202007,202008,202009,202010,202011,202012};

	private String dd[] =  {"01","02","03","04","05","06","07","08","09","10",
							"11","12","13","14","15","16","17","18","19","20",
							"21","22","23","24","25","26","27","28","29","30","31"};
	
	private String yyyymmdd;
	
	
	//대시보드 top5 items
	private int product_code;
	private String product_name;
	private int accumulation;
	
	//대시보드 파이차트
	private String category_code;
	private int top5count;
	private String lv1;
	private String lv2;
	private String lv3;
	
	
	private String today;
	private String ten_days;
	
	
	
}

