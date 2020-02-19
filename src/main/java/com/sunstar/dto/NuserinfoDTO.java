package com.sunstar.dto;

import java.util.HashMap;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class NuserinfoDTO {
	
	private String resultcode;
	private String message;
	private HashMap<String, String> response;
	
}
