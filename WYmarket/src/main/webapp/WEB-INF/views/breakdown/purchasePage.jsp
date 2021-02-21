<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</head>
<body>
 구매내역 화면 <br>

<c:choose>
 
 	<c:when test="${not empty vo}"> <!-- 로그인 정보 세션 -->			
 		<c:forEach var ="phvo_list" items="${phvo }"> 		
 		 <!--  판매중 내역 -->	
 		<c:if test="${empty phvo_list.ititle }">
 			구매하신 상품이 없습니다.
 		</c:if>
 		
		<div class ="Purchasedetails" id ="test"style="background-color: green; border: solid black 1px; ">
		${phvo_list.address }<br>	
		구매자: ${phvo_list.purchaser} <br>
		판매자: ${phvo_list.usernick} <br>	
		<span style="background-color: red;">거래완료</span> ${phvo_list.price }	<br>
		<button><span>작성한 후기 보기</span></button>
		</div>	
		<!-- 판매중 내역 end -->			
		</c:forEach>
		
		</c:when>		
</c:choose>
				<button onclick="location.href = '<%=application.getContextPath() %>/param/test01'">My Page</button>



</body>
</html>