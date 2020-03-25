package com.sunstar.dto;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ReviewDTO {
	private String order_code;
	private int order_no;
	private int review_no;
	private int review_star;
	private String review_writedate;
	private String review_content;
	
	private String id;
	private int reviewgood_no;
	private boolean review_goodck;
	
	private String review_img;
	
	private String product_code;
	private String option1;
	private String option2;
	
}
