package com.mvc.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mvc.model.BoardVO;
import com.mvc.model.Paging;

import lombok.RequiredArgsConstructor;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@RequiredArgsConstructor
@SuppressWarnings("all")
public class BoardMapperTests {
 
     private static final Logger log = LoggerFactory.getLogger(BoardMapperTests.class);
     
     private final BoardMapper mapper;
 
//     @Test
//     public void testEnroll() {
//         
//         BoardVO vo = new BoardVO();
//         
//         vo.setTitle("mapper test");
//         vo.setContent("mapper test");
//         vo.setWriter("mapper test");
//         
//         mapper.enroll(vo);
//         
//     }
//     
     //게시판 목록 테스트
//     @Test
//     public void testGetList() {
//         
//         
//         List list = mapper.getList();
//        /* 일반적 for문 */
//         for(int i = 0; i < list.size();i++) {
//             log.info("" + list.get(i));
//         }
//         
//        /* foreach문(향상된 for문) */
//         for(Object a : list) {
//             log.info("" + a);
//         }
//         
//        /* foreach문 & 람다식 */
//         list.forEach(board -> log.info("" + board));
//         
//     }
     
     //게시글 조회 테스트
//     @Test
//     public void testGetPage() {
//        
//        int bno = 2;
//        
//        log.info("" + mapper.getPage(bno));
//    }
     
     //게시글 수정 테스트
//     @Test
//     public void testModify() {
//         
//         BoardVO board = new BoardVO();
//         board.setBno(2);
//         board.setTitle("수정 제목1");
//         board.setContent("수정 내용1");
//         
//         int result = mapper.modify(board);
//         log.info("result : " +result);
//         
//     }
//     
     //페이징 테스트
     @Test
     public void testGetListPaging() {
    	 
    	 Paging page = new Paging();
    	 
    	 page.setPageNum(1);
    	 
    	 List list = mapper.getListPaging(page);
    	 
    	 list.forEach(board -> log.info("" + board));
     }
     
 
}