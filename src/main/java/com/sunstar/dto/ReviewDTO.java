package com.sunstar.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class ReviewDTO {
	// review table
	private int review_no;
	private int order_no;
	private int review_star;
	private String review_writedate;
	private String review_content;
	
	// order_list  .. order_code = > ´Ù¼öÀÇ order_no
	private String order_code;
	private String product_code;
	private String quantity;
	private String option1;
	private String option2;
	
	// ordered
	private String delivery_state;
	
	// review_godd
	private String id;
	private int reviewgood_no;
	private boolean review_goodck;
	
	// review_img
	private String review_img;
	private List<ReviewImgDTO> imgdto;

	
	
}
