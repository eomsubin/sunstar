package com.sunstar.dto;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter @Setter
public class ProductDTO {
	private int product_code;
	private String product_name;
	private int price;
	private int cost;
	private int shipping_cost;
	private MultipartFile athumb_img;
	private MultipartFile acomm_img1;
	private MultipartFile acomm_img2;
	private MultipartFile acomm_img3;
	private MultipartFile adetail_img1; 
	private MultipartFile adetail_img2;
	private MultipartFile adetail_img3;
	
	private String thumb_img;
	private String comm_img1;
	private String comm_img2;
	private String comm_img3;
	private String detail_img1;
	private String detail_img2;
	private String detail_img3;
	
	
	private String explains;
	private boolean public_state;
	private boolean review_state;
	private String category_code;
	private String seller_code;
	
	private List<OptionDTO> options;
		  
	private String option1;
	private String option2;
	private int inventory;
	private int add_price;
	
	private List<CategoryDTO> categorydto;
	private String lv1;
	private String lv2;
	private String lv2code;
	private String lv3;
	
	//seller
	private String seller_name;
	private String shipping_company;
	private int basic_shipping_cost;
	
	
	
}
