<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
</head>
<body>
<div class="boardDetail">
	<h1>게시판</h1>
		<form name="modifyForm" id="modifyForm" action="/board/modify" method="post">
			<table>
				<tbody>
					<tr>
						<th>번호</th>
						<td><input name="bno" readonly="readonly" value='<c:out value="${pageInfo.bno}"/>' ></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input name="title"  value='<c:out value="${pageInfo.title}"/>' ></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea style="width:950px;"rows="3" name="content"><c:out value="${pageInfo.content}"/></textarea></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input name="writer" readonly="readonly" value='<c:out value="${pageInfo.writer}"/>' ></td>
					</tr>
					<tr>
						<th>등록일</th>
						<td><input name="regdater" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regdate}"/>' ></td>
					</tr>
					<tr>
						<th>수정일</th>
						<td><input name="updateDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.updateDate}"/>' ><td>
					</tr>	
				</tbody>
			</table>	
			
			<div class="sub_btn_menu">
				<a class="btn_line btn_gray" id="list_btn">목록</a> 
		        <a class="btn_line btn_gray" id="modify_btn" onclick="checkform()">수정</a>
		        <a class="btn_line btn_gray" id="delete_btn">삭제</a>
			</div>
		</form>
		<form id="infoForm" action="/board/modify" method="get">
			<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
			<input type="hidden" name="pageNum" value='<c:out value="${page.pageNum}"/>'>
			<input type="hidden" name="amount" value='<c:out value="${page.amount}"/>'>
			<input type="hidden" name="keyword" value='<c:out value="${page.keyword}"/>'>
		</form>
	</div>
</body>
</html>
<script>
	let form = $("#infoForm");
	let mForm = $("#modifyForm");
	
	//목록 버튼
	$("#list_btn").on("click", function(e){
		form.find("#bno").remove();
		form.attr("action", "/board/list");
		form.submit();
	});
	
	//수정 버튼
	function checkform(){
		if(document.modifyForm.title.value==""){
			alert("제목은 필수입니다.");	
			document.modifyForm.title.focus();
			return false;
		} else if (document.modifyForm.content.value==""){
			alert("내용은 필수입니다. ");
			document.modifyForm.content.focus();
			return false;
		}
		document.modifyForm.submit();
	}
	/* $("#modify_btn").on("click", function(e){
	    mForm.submit();
	});
	*/
	//삭제 버튼
	$("#delete_btn").on("click", function(e){
		form.attr("action","/board/delete");
		form.attr("method","POST");
		form.submit();
	});
</script>
<style>
.sub_btn_menu .btn_line{display:block;float:left;margin:0 3px 3px 0;padding:0 20px;min-width:66px;width:auto;height:30px;line-height:28px;font-size:1.2em}
.sub_btn_menu .btn_line{margin:1.5px 3px 1.5px 0;padding:0 17px;min-width:50px;background:#fff}
.btn_line{text-decoration:none;display:block;width:170px;height:44px;line-height:42px;text-align:center;font-size:1.8em;color:#fff;font-weight:300;border:1px solid #fff;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}
.btn_line:hover{color:#666;background:#fff}
.btn_line.btn_gray{color:#666;border-color:#999}
.btn_line.btn_gray:hover{color:#fff;background:#999}
.boardDetail {
        width: 1100px;
        margin: auto;
        margin-bottom: 300px;
        padding-top: 70px;
    }
.boardDetail table tbody tr th{
    background-color: whitesmoke;
    font-size: 15px;
    font-family: '굴림';
}
.boardDetail table{
    border-collapse: collapse;
    width: 100%;
    margin: auto;
    border-collapse: collapse;
    font-size: 14px;    
}
.boardDetail table tbody tr td{
    border-bottom: 1px solid rgb(224, 224, 224);
    padding: 10px;
}
.boardDetail table tbody tr th{
    border-bottom: 1px solid rgb(224, 224, 224);
    padding: 10px;
    width:100px;
}
.boardDetail input{
	width:950px;
}

</style>