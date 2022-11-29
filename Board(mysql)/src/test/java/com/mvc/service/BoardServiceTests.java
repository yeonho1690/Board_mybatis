package com.mvc.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mvc.model.BoardVO;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardServiceTests {
    
    @Autowired
    private BoardService service;
    
//    @Test
//    public void testEnroll() {
//        
//        BoardVO vo = new BoardVO();
//        
//        vo.setTitle("service test");
//        vo.setContent("service test");
//        vo.setWriter("service test");
//        
//        service.enroll(vo);
//        
//    }
    
    //게시판 목록 테스트
//    @Test
//    public void testGetList() {
//        
//        service.getList().forEach(board -> log.info("-->" + board));        
//        
//    }
    //게시글 조회
//    @Test
//    public void testGETPage() {
//        
//        int bno = 2;
//        
//        log.info("" + service.getPage(bno));
//        
//    }
 
    //수정 테스트
//    @Test
//    public void testModify() {
//        
//        BoardVO board = new BoardVO();
//        board.setBno(2);
//        board.setTitle("수정 제목3");
//        board.setContent("수정 내용3");
//        
//        int result = service.modify(board);
//        log.info("result : " +result);
//        
//    }
    //페이징 테스트
    
}
 
