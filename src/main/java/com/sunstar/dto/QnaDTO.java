package com.sunstar.dto;

import lombok.Setter;
import lombok.ToString;
import lombok.Getter;

@Getter @Setter @ToString
public class QnaDTO {

	private int qna_no;
	private String qna_title;
	private String qna_content;
	private String qna_attach;
	private String qna_state;
	private String id;
	//private int product_code;
	private String product_code;
	private String write_date;
	
	private String qna_reply;
	private String reply_date;
}
