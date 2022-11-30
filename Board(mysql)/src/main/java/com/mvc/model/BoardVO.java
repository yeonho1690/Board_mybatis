package com.mvc.model;

import java.util.Date;

import javax.validation.constraints.NotEmpty;

//import org.apache.ibatis.type.Alias;
import lombok.*;

//@Alias
@Getter @Setter
public class BoardVO {

    // 게시판 번호 
    private int bno;
    
    // 게시판 제목 
    @NotEmpty(message = "제목은 필수입니다!!!")
    private String title;
    
    // 게시판 내용 
    @NotEmpty(message = "내용은 필수입니다!!!")
    private String content;
    
    // 게시판 작성자
    @NotEmpty(message = "작성자는 필수입니다!!!")
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
