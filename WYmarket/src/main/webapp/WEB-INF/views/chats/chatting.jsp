<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<title>Insert title here</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
        crossorigin="anonymous"></script>
</head>
<body>
<h1>당근톡</h1>
${user}님의 채팅방 목록
<hr>
<c:forEach var="vo" items="${sellerList}" >
		  
			<button type="button" onclick="location.href='./room?roomId=${vo.roomId }&item=${vo.item}&price=${vo.price}&sellerName=${vo.sellerName}&buyerName=${vo.buyerName}&check=1'" class="btn btn-primary">
 					구매자 : ${vo.buyerName}<br>
					판매상품 : ${vo.item}<br>
					연락 시간 : ${vo.chatDate} 
			<span class="badge bg-secondary">${vo.buyerCount}</span>
			</button>
			
		</c:forEach>
		<br>
	<hr>
<c:forEach var="vo" items="${buyerList}" >
			<button type="button" onclick="location.href='./room?roomId=${vo.roomId }&item=${vo.item}&price=${vo.price}&sellerName=${vo.sellerName}&buyerName=${vo.buyerName}&check=0'" class="btn btn-primary">
 					판매자 : ${vo.sellerName}<br>
					판매상품 : ${vo.item}<br>
					연락 시간 : ${vo.chatDate} 
			<span class="badge bg-secondary">${vo.sellerCount}</span>
			</button>
		</c:forEach>	
		
					 
</body>
</html>