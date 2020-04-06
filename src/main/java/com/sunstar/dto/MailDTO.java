package com.sunstar.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter @AllArgsConstructor @NoArgsConstructor @ToString
public class MailDTO {
	private String no;
	private String id;
	private String email ;
	private String category;
	private String title;
	private String content;
	private String order_code;
	private String date;
	
	private String reply;
	private String rep_state;
}
