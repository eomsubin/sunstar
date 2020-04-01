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
}
