package com.sunstar.dto;

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
public class NoticeDTO {
	private String notice_no ;
	private String notice_category;
	private String notice_title;
	private String notice_content;
	private String notice_date;
}
