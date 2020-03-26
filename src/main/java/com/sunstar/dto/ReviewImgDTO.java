package com.sunstar.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString @AllArgsConstructor @NoArgsConstructor
public class ReviewImgDTO {
	private int img_no;
	private int review_no;
	private String review_img;
}
