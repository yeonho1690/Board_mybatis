package com.mvc.service;

import java.util.List;

import com.mvc.model.BoardVO;
import com.mvc.model.Paging;

public interface BoardService {

	//등록
    public void enroll(BoardVO board);
    
    //게시판 목록
    public List<BoardVO> getList();
    
    //게시판 조회
    public BoardVO getPage(int bno);
    
    //게시판 수정
    public int modify(BoardVO board);
    
    //게시글 삭제
    public int delete(int bno);
    
    //페이징
    public List<BoardVO> getListPaging(Paging page);
    
    //게시글 총 갯수
    public int getTotal(Paging page);
    
}
