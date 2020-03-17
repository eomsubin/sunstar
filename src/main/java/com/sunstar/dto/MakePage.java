package com.sunstar.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
@ToString
public class MakePage {
	private int currPage;
	private int totalCount;
	private int sizePerPage;
	private int blockSize;

	private int startRow;
	private int endRow;

	private int startBlock;
	private int endBlock;
	
	private boolean prev;
	private boolean next;
	

	public MakePage(int currPage, int totalCount, int sizePerPage, int blockSize) {
		super();
		this.currPage 	= currPage;
		this.totalCount = totalCount;
		this.sizePerPage = sizePerPage;
		this.blockSize 	= blockSize;
		calData();
	}
	private void calData() {
		
		startRow = (currPage-1)*sizePerPage+1;
		endRow	 = startRow + sizePerPage-1;
		if(endRow > totalCount) {
			endRow = totalCount;
		}
		
		int totalPage = (int)Math.ceil(totalCount/(float)sizePerPage);
		startBlock = ((currPage-1) / blockSize) * blockSize+1;
		endBlock =  startBlock + blockSize-1;
		
		if(endBlock > totalPage) {
			endBlock = totalPage;
		}
		
		//이전, 다음
		prev = (startBlock == 1)? 		false : true;
		next = (endBlock < totalPage)?	true  : false;
			
	}
	
	
	String categori ="";
	String txt = "";
	
}
