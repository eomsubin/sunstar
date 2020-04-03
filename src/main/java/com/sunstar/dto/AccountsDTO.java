package com.sunstar.dto;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

@Getter @Setter @ToString
public class AccountsDTO {
	private String seller_code;
	private String yyyymm;
	private int total_profit;
	private int commission;
	private int balance_accounts;
	private String account_state;
}
