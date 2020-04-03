package com.sunstar.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class CustomerDTO {
	private String id;
	private String name;
	private String tel;
	private String email;
	private String password;
	private String address1;
	private String address2;
	private String address3;
	private String zip;
	private boolean enable;
	private String join_date;
	private List<AuthDTO> authlist;
	private String updatepw;
	private String seller_code;
	private String seller_name;
	private String seller_tel;
	private String seller_email;
	private String seller_address1;
	private String seller_address2;
	private String seller_address3;
	private String seller_zip;
	private String bank;
	private String bank_no;
	private String business_license;
	private String seller_deadline;
	private String shipping_company;
	private String basic_shipping_cost;
	private String free_shipping_cost;
}
