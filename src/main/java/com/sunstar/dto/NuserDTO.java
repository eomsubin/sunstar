package com.sunstar.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NuserDTO {
	private String access_token;
	private String refresh_token;
	private String token_type;
	private String expires_in;
	private String uniqId;
	private String name;
	private String email;
	private String nickname;
	private String profileImage;
	private String gender;
	private String birthday;
	private String age;
	
}
