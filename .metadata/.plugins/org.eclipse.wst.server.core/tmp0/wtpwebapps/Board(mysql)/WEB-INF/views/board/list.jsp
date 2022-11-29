<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>
</head>
<body>
	<div>
		<div class="board-main">
		<h1>게시판 목록</h1>
		<div class="sub_btn_menu">
			<a href="/board/enroll" class="btn_line btn_gray">게시글 등록</a>
			
			<!-- 엑셀 다운로드 구현 form -->
			<form action="/board/excel/download" method="get">
	            <button type="submit" class="btn_line btn_gray">엑셀</button>
	        </form>
			
			<div class="search_area" style="float:right">
				<select name="selval" value="${pageVo.page.selval}" >
					<!-- select box값 변하지 않게 고정 -->
					<option value="" ${pageVo.page.selval == '0' ? 'selected="selected"' : '' }>선택</option>
					<option value='1' ${pageVo.page.selval == '1' ? 'selected="selected"' : '' }>제목</option>
					<option value='2' ${pageVo.page.selval == '2' ? 'selected="selected"' : '' }>작성자</option>
				</select>
	            <input type="text" name="keyword" value="${pageVo.page.keyword }">
	            <button>검색</button>
	        </div>
	        
		</div>
		<div class="search_wrap">
	        
	    </div>    
			<table>
				<thead style="background-color: #deddd9;">
					<tr >
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>수정일</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="list">
		            <tr>
		                <td><c:out value="${list.bno}"/></td>
		                <td>
		                	<a class="move" href='<c:out value="${list.bno}"/>'>
								<c:out value="${list.title}"/>
							</a>
		                </td>
		                <td><c:out value="${list.writer}"/></td>
		                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.regdate}"/></td>
		                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.updateDate}"/></td>
		            </tr>
		        </c:forEach>
		        </tbody>
			</table>
			<div class="pageInfo_wrap" >
		        <div class="list_page">
		        	<ul id="pageInfo" class="pageInfo">
				        <!-- 이전페이지 버튼 -->
		                <c:if test="${pageVo.prev}">
		                    <li class="pageInfo_btn previous"><a href="${pageVo.startPage-1}"><</a></li>
		                </c:if>
		 				<!-- 각 번호 페이지 버튼 -->
                		<c:forEach var="num" begin="${pageVo.startPage}" end="${pageVo.endPage}">
                    		<li class="pageInfo_btn ${pageVo.page.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
                		</c:forEach>
                		<!-- 다음페이지 버튼 -->
		                <c:if test="${pageVo.next}">
		                    <li class="pageInfo_btn next"><a href="${pageVo.endPage + 1 }">></a></li>
		                </c:if>    
                	</ul>
		        </div>
    		</div>
    		<form id="moveForm" method="get">
				<input type="hidden" name="pageNum" value="${pageVo.page.pageNum}">
        		<input type="hidden" name="amount" value="${pageVo.page.amount}">
        		<input type="hidden" name="keyword" value="${pageVo.page.keyword}">
        		<input type="hidden" name="selval" value="${pageVo.page.selval}">
        	</form>
        	
		</div>
	</div>
</body>
</html>
<script type="text/javascript">

    //알림창 설정
	$(document).ready(function(){
		
		let result = '<c:out value="${result}"/>';
		
		checkAlert(result);
		
		function checkAlert(result){
			if(result === ""){
				return;
			}
			else if(result === "enroll success"){
				alert("등록이 완료되었습니다.");
			}
			else if(result === "modify success"){
				alert("수정이 왼료되었습니다.");
			}
			else if(result === "delete success"){
				alert("삭제가 완료되었습니다.");
			}
		}
	});
	let moveForm = $("#moveForm");
	
	$(".move").on("click",function(e){
		e.preventDefault();
		moveForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+"'>");
		moveForm.attr("action", "/board/get");
		moveForm.submit();
	});

	$(".pageInfo a").on("click", function(e){
        e.preventDefault();
        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
        moveForm.attr("action", "/board/list");
        moveForm.submit();
        
    });
	//검색
	$(".search_area button").on("click", function(e){
		e.preventDefault();
		let val = $("input[name='keyword']").val();
		let sel = $("select[name='selval']").val(); 
		moveForm.find("input[name='keyword']").val(val);
		moveForm.find("input[name='pageNum']").val(1);
		moveForm.find("input[name='selval']").val(sel);
		moveForm.submit();
	});
	
	

</script>
<style>
.sub_btn_menu .btn_line{display:block;float:left;margin:0 3px 3px 0;padding:0 20px;min-width:66px;width:auto;height:30px;line-height:28px;font-size:1.2em}
.sub_btn_menu .btn_line{margin:1.5px 3px 1.5px 0;padding:0 17px;min-width:50px;background:#fff}
.btn_line{text-decoration:none;display:block;width:170px;height:44px;line-height:42px;text-align:center;font-size:1.8em;color:#fff;font-weight:300;border:1px solid #fff;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}
.btn_line:hover{color:#666;background:#fff}
.btn_line.btn_gray{color:#666;border-color:#999}
.btn_line.btn_gray:hover{color:#fff;background:#999}
.board-main {width: 1100px;margin: auto;margin-bottom: 300px;padding-top: 70px}
.board-main table {width: 100%;margin: auto;border-collapse: collapse;font-size: 14px;border-top: 2px solid lightgray;border-bottom: 1px solid lightgray}
.board-main thead {height: 40px;background-color: whitesmoke;}
.board-main tbody tr {height: 60px;}
.board-main tbody tr td {border-top: 1px solid lightgray;}
.board-main tbody tr td:nth-child(1) { width: 10%;text-align: center;}
.board-main tbody tr td:nth-child(2) { width: 40%;text-align: center;padding-top: 15px;padding-bottom: 15px;}
.board-main tbody tr td:nth-child(2) a {text-decoration: none;color: black}
.board-main tbody tr td:nth-child(3) {text-align: center;width: 20%}
.board-main tbody tr td:nth-child(4) {text-align: center}
.board-main tbody tr td:nth-child(5) {text-align: center}    
a{text-decoration:none}
li{list-style:none}
.active{color:#fff;font-weight:700;border-color:#557096;background:#557096;z-index:20}
.pageInfo {display: flex;}
.list_page a.active{color:#fff;font-weight:700;border-color:#557096;background:#557096;z-index:20}
.list_page{margin-top:30px;height:32px;text-align:center}
.list_page a{display:inline-block;margin:0 1px;width:30px;height:30px;line-height:30px;text-align:center;vertical-align:top;font-size:1.3em;color:#666;border:1px solid #d5d5d5;background:#fff;z-index:10;*display:inline;zoom:1}
.list_page a:hover{color:#fff;font-weight:700;border-color:#557096;background:#557096;z-index:20}
.list_page .first .icon{display:block;width:30px;height:30px;background:url("../img/icon/list_page_first.png") no-repeat center center}
.list_page .prev .icon{display:block;width:30px;height:30px;background:url("../img/icon/list_page_prev.png") no-repeat center center}
.list_page .next .icon{display:block;width:30px;height:30px;background:url("../img/icon/list_page_next.png") no-repeat center center}
.list_page .last .icon{display:block;width:30px;height:30px;background:url("../img/icon/list_page_last.png") no-repeat center center}
.list_page .first:hover .icon{background:url("../img/icon/list_page_first_on.png") no-repeat center center}
.list_page .prev:hover .icon{background:url("../img/icon/list_page_prev_on.png") no-repeat center center}
.list_page .next:hover .icon{background:url("../img/icon/list_page_next_on.png") no-repeat center center}
.list_page .last:hover .icon{background:url("../img/icon/list_page_last_on.png") no-repeat center center}
</style>