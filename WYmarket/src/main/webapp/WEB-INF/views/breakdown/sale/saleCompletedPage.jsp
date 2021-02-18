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
 테스트 화면! <br>
 <c:choose>
 
 	<c:when test="${empty vo }">닉네임 식별 불가</c:when>
 	<c:when test="${not empty vo}">
 	<button id = "salebtn" onclick="location.href = '<%=application.getContextPath() %>/param/sale'">판매중</button> <button id ="completedbtn" onclick="location.href = '<%=application.getContextPath() %>/param/salecomplete'">거래완료</button> <button>숨김</button> 
 	<c:forEach var ="test" items="${vo }">
 		<c:if test="${test.istate eq 'completed'}">		 <!--  거래완료 내역 -->	
		<div class ="completed" id ="test"style="background-color: green; ">
		${test.ititle }	<br>
		${test.address }<br>
		${test.price }	<br>
		${test.istate} <br>
		<button onclick="location.href='<%=application.getContextPath() %>/param/purchase'">후기 작성 하기</button >		
		</div>	
		</c:if> <br> <!-- 거래완료 내역 end -->	
		
		</c:forEach>
		<button onclick="location.href = '<%=application.getContextPath() %>/param/test01'">My Page</button>		
 	</c:when>
 </c:choose>





</body>
</html>