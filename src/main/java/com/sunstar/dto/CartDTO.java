package com.sunstar.dto;

import lombok.Setter;
import lombok.ToString;
import lombok.Getter;

@Getter @Setter @ToString
public class CartDTO {

	/*  create table cart( 
	 *   cart_no int(5) not null auto_increment 
	 * , id varchar(30) not null 
	 * , product_code int(9) not null 
	 * , cart_quantity varchar(30) not null
	 * , constraint cart_cart_no_id_pk primary key(cart_no, id) 
	 * , constraint cart_id_fk foreign key(id) references customer(id) ON DELETE CASCADE );
	 */
	private int cart_no;
	private String id;
	private int product_code;
	private String cart_quantity;
}
