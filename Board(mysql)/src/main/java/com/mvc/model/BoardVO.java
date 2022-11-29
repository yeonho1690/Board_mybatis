package com.mvc.model;

import java.util.Date;

//import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

//@Alias
@Getter @Setter
public class BoardVO {

    // 게시판 번호 
    private int bno;
    
    // 게시판 제목 
    private String title;
    
    // 게시판 내용 
    private String content;
    
    // 게시판 작성자
    private String writer;
    
    // 등록 날짜
    private Date regdate;
    
    // 수정 날짜 
    private Date updateDate;
    
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regdate="
				+ regdate + ", updateDate=" + updateDate + "]";
	}
	
}
