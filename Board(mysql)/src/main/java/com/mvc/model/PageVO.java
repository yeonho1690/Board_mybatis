package com.mvc.model;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class PageVO {

	private int startPage;
	
	private int endPage;
	
	private boolean prev,next;
	
	private int total;
	
	private Paging page;
	
	public PageVO(Paging page, int total) {
		
		this.page = page;
		this.total = total;
		
		//마지막 페이지
		this.endPage = (int)(Math.ceil(page.getPageNum()/10.0)) * 10;
		//시작 페이지
		this.startPage = this.endPage - 9;
		//전체 마지막 페이지
		int realEnd = (int)(Math.ceil(total * 1.0 / page.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < realEnd;
		
	}

	@Override
	public String toString() {
		return "PageVO [startPage=" +startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + ", page=" + page + "]";
	}
	
	
}
