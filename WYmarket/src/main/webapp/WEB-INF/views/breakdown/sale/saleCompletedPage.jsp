<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/views/include/taglib.jspf"%>
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

 	거래완료 화면 <br>
 	<button id = "salebtn" onclick="location.href = '<%=application.getContextPath() %>/param/sale'">판매중</button> <button id ="completedbtn" onclick="location.href = '<%=application.getContextPath() %>/param/salecomplete'">거래완료</button> <button onclick="location.href = '<%=application.getContextPath() %>/param/salehidden'">숨김</button>	 
 	<c:choose>
 	<c:when test="${not empty usernick}"> 
 	
 		
 		<c:forEach var ="SellerPhVO_list" items="${SellerPhVO }">				
		<div class ="completed" id ="test"style="background-color: green;">
		현재날짜와 등록된 날짜 차 값(초):${SellerPhVO_list.refreshTime} <br>
		<c:choose>
			<c:when test="${SellerPhVO_list.refreshTime < 60}">
				${SellerPhVO_list.refreshTime}초 전 <br>
			</c:when>
			<c:when test="${SellerPhVO_list.refreshTime >= 60 && SellerPhVO_list.refreshTime < 3600}">				
				<fmt:parseNumber var="percent" value="${((SellerPhVO_list.refreshTime) / 60)}" integerOnly="true" />
				${percent}분 전 <br>
			</c:when>
			<c:when test="${SellerPhVO_list.refreshTime >= 3600 && SellerPhVO_list.refreshTime < 86400}">
			<fmt:parseNumber var="percent" value="${((SellerPhVO_list.refreshTime) / 3600)}" integerOnly="true" />
			${percent }시간 전 <br>
			</c:when>
			<c:when test="${SellerPhVO_list.refreshTime >= 86400 && SellerPhVO_list.refreshTime < 2764800} ">
			<fmt:parseNumber var="percent" value="${((SellerPhVO_list.refreshTime) / 86400)}" integerOnly="true" />
			${percent }일 전 <br>
			</c:when>
			<c:when test="${SellerPhVO_list.refreshTime >= 2678400 && SellerPhVO_list.refreshTime < 32140800}">
			<fmt:parseNumber var="percent" value="${((SellerPhVO_list.refreshTime) / 2678400)}" integerOnly="true" />
			${percent }달 전 <br>
			</c:when>
			<c:when test="${SellerPhVO_list.refreshTime >= 32140800}">
			<fmt:parseNumber var="percent" value="${((SellerPhVO_list.refreshTime) / 32140800)}" integerOnly="true" />
			${percent }년 전 <br>
			</c:when>	
		</c:choose>	
		<span>거래완료</span> 제목: ${SellerPhVO_list.ititle}	<br>	
		지역: ${SellerPhVO_list.address } <br>
		가격: ${SellerPhVO_list.price }
		<input type="text" value="${SellerPhVO_list.ititle}" id ="ititle" name = "ititle" style="display: none"/>
		</div><br>
		
		 <!-- 판매중 내역 end -->			
		</c:forEach>			
 	</c:when>
 	</c:choose>
 		<br>
		<button id ="reviewBtn" onclick="location.href='<%=application.getContextPath() %>/param/purchase'">후기 작성 하기</button >		
		<button onclick="location.href = '<%=application.getContextPath() %>/param/test01'">My Page</button>		



		<script type="text/javascript">
		var ititle = document.getElementsByName("ititle");
		if(ititle.length == 0){
			document.getElementById("reviewBtn").style.display = 'none';	
		}
		</script>
</body>
</html>