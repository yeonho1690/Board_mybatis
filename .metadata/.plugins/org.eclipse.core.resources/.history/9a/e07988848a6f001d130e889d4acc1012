<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

	<form name="enrollform" action="/board/enroll" method="post">
		<div class="board">
			<h1>게시판 등록</h1>
			<table>
				<tbody>
					<tr>
						<th>제목</th>
						<td><input name="title"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="3" name="content" style="width: 950px;"></textarea></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input name="writer"></td>
					</tr>
				</tbody>
			</table>

			<div class="sub_btn_menu">
				<a class="btn_line btn_gray" onclick="check()">등록
					</button> <a class="btn_line btn_gray" href="/board/list">취소</a>
			</div>
		</div>
	</form>
</body>
</html>
<script type="text/javascript">
	function check() {
		if (document.enrollform.title.value == "") {
			alert("제목은 필수입니다.");
			document.enrollform.title.focus();
			return false;
		} else if (document.enrollform.content.value == "") {
			alert("내용은 필수입니다.");
			document.enrollform.content.focus();
			return false;
		} else if (document.enrollform.writer.value == "") {
			alert("작성자는 필수입니다.");
			document.enrollform.writer.focus();
			return false;
		}
		document.enrollform.submit();
	}
</script>
<style>
.sub_btn_menu .btn_line {
	display: block;
	float: left;
	margin: 0 3px 3px 0;
	padding: 0 20px;
	min-width: 66px;
	width: auto;
	height: 30px;
	line-height: 28px;
	font-size: 1.2em
}

.sub_btn_menu .btn_line {
	margin: 1.5px 3px 1.5px 0;
	padding: 0 17px;
	min-width: 50px;
	background: #fff
}

.btn_line {
	text-decoration: none;
	display: block;
	width: 170px;
	height: 44px;
	line-height: 42px;
	text-align: center;
	font-size: 1.8em;
	color: #fff;
	font-weight: 300;
	border: 1px solid #fff;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box
}

.btn_line:hover {
	color: #666;
	background: #fff
}

.btn_line.btn_gray {
	color: #666;
	border-color: #999
}

.btn_line.btn_gray:hover {
	color: #fff;
	background: #999
}

.board table tbody tr th {
	background-color: whitesmoke;
	font-size: 15px;
	font-family: '굴림';
}

.board table {
	border-collapse: collapse;
	width: 100%;
	margin: auto;
	border-collapse: collapse;
	font-size: 14px;
}

.board table tbody tr td {
	border-bottom: 1px solid rgb(224, 224, 224);
	padding: 10px;
}

.board table tbody tr th {
	border-bottom: 1px solid rgb(224, 224, 224);
	padding: 10px;
	width: 100px;
}

.board {
	width: 1100px;
	margin: auto;
	margin-bottom: 300px;
	padding-top: 70px;
}

.board input {
	width: 950px;
}
</style>