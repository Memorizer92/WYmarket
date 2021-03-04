<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>


<link rel="icon" href="../image/wyfavicon.ico">
<link rel="shortcut icon" href="../image/wyfavicon.ico">


<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#btnWrite").click(function() {
			location.href = "/wymarket/board/write";
		});
	})
</script>
<style>
table {
	border: 1;
	width: 600px;
}
</style>
</head>
<body>
	<h2>공지사항</h2>
 
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>이름</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="vo" items="${list}" step="1" end="9">
			<tr>
				<td><a href="./look?noticeID=${vo.noticeID}">${vo.noticeID}</a></td>
				<td><a href="./view?noticeID=${vo.noticeID}">${vo.ntitle}</a></td>
				<td>${vo.adminNick}</td>
				<td><fmt:formatDate value="${vo.ndate}"
						pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td>${vo.nviewcnt}</td>
			</tr>
		</c:forEach>
	</table>
	<br>
		<button type="button" id="btnWrite">글쓰기</button>
</body>
</html>



