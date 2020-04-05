package com.sunstar.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter @AllArgsConstructor @NoArgsConstructor @ToString
public class FaqDTO {
	private String faq_no;
	private String faq_category;
	private String faq_title;
	private String faq_content;
	private String faq_head;
}

