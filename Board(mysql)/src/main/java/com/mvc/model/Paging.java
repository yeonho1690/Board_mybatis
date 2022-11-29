package com.mvc.model;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Paging {

	private int pageNum;

	private int amount;

	private int skip;
	
	//검색 키워드
	private String keyword;
	
	private String selval;

	public Paging() {

		this(1, 10);
		this.skip = 0;

	}

	public Paging(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.skip = (pageNum - 1) * amount;
	}

	public void setPageNum(int pageNum) {

		this.skip = (pageNum - 1) * this.amount;
		this.pageNum = pageNum;
	}

	public void setAmount(int amount) {

		this.skip = (this.pageNum - 1) * amount;
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "Paging [pageNum=" + pageNum + ", amount" + amount + ", skip=" + skip + ", "
				+ "keyword= " + keyword + "]";
	}
}
