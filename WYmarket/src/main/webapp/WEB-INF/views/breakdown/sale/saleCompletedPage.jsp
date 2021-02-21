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
<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/assets/css/breakdown.css">

</head>
<body>

 	<button id = "salebtn" onclick="location.href = '<%=application.getContextPath() %>/param/sale'">판매중</button> <button id ="completedbtn" onclick="location.href = '<%=application.getContextPath() %>/param/salecomplete'">거래완료</button> <button>숨김</button> 
 	거래완료 화면
 	<c:forEach var ="userItem_list" items="${itemvo }">
 		<c:if test="${userItem_list.istate eq 'Completed'}">		 <!--  거래완료 내역 -->	
		<div class ="completed" id ="test"style="background-color: green; ">
		${userItem_list.ititle }	<br>
		${userItem_list.address }<br>
		${userItem_list.price }	<br>
		${userItem_list.istate} <br>
		<button onclick="location.href='<%=application.getContextPath() %>/param/purchase'">후기 작성 하기</button >		
		</div>	
		</c:if> <!-- 거래완료 내역 end -->			
		</c:forEach>
		<button onclick="location.href = '<%=application.getContextPath() %>/param/test01'">My Page</button>		





</body>
</html>