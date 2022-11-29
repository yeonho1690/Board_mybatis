package com.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.mapper.BoardMapper;
import com.mvc.model.BoardVO;
import com.mvc.model.Paging;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{

//	@Autowired
//	private BoardMapper mapper;
	private final BoardMapper mapper;
	
	
	@Override
	public void enroll(BoardVO board) {
		mapper.enroll(board);
	}
	
	@Override
	public List<BoardVO> getList(){
		return mapper.getList();
	}
	
	@Override
	public BoardVO getPage(int bno) {
	return mapper.getPage(bno);
	}
	
	@Override
	public int modify(BoardVO board) {
		return mapper.modify(board);
	}
	
	@Override
	public int delete(int bno) {
		return mapper.delete(bno);
	}
	
	@Override
	public List<BoardVO> getListPaging(Paging page){
		return mapper.getListPaging(page);
	}
	
	@Override
	public int getTotal(Paging page) {
		return mapper.getTotal(page);
	}
	
	
}
