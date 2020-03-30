package com.sunstar.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class OrderDTO {
	private String order_code;
	private String id;
	private String name;
	private String tel;
	private String shipping_addr1;
	private String shipping_addr2;
	private String shipping_addr3;
	private String shipping_zip;
	private String order_way;
	private String delivery_state;
	private String tracking_no;
	private String shipping_company;
	private String non_tel;
	private int shipping_cost;
	private int order_no;
	private int product_code;
	private int quantity;
	private String option1;
	private String option2;
	private int inventory;
	private int add_price;
	private int price;
	private String product_name;
	private String to_name;
	
	private String message;
	
	
	private List<String> delivery_states;
	private String shipping_name;
	private String cart_no;
	private String seller_name;
	private List<Integer> product_codes;
	private List<Integer> quantities;
	private List<String> options1;
	private List<String> options2;
	private List<Integer> add_prices;
	private String seller_code;
	private int total_price;
	private int shipping_cost_per_seller;
	private List<Integer> shipping_costs;
	private String thumb_img;
	private List<String> seller_codes;
	private List<Integer> total_prices;
	private List<Integer> shipping_cost_per_sellers;
	private List<String> cart_nos;
	
}
