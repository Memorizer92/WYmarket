<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
 <link rel="icon" href="<%=application.getContextPath() %>/image/wyfavicon.ico">
    <link rel="shortcut icon" href="<%=application.getContextPath() %>/image/wyfavicon.ico">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/main.css">
<style type="text/css">
* {
	box-sizing: border-box;
}

  #kakaoLogout {
/* 	text-decoration: none;
	text-align: center;
	padding-top: 14px; */
	background-color: #fef01b;
	color: #3A1D1D;
	border-radius: 5px;
	font-weight: bold;
/* 	display: block;
	margin-left: auto;
	margin-right: 5%;
	width: 20%;
	margin-top: 25px;
	height: 50px; */
	cursor: pointer;
}
/*
#logoutheader {
	display: flex;
	justify-content: flex-end;
} */
</style>
</head>
 
<body>

	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="include/header.jsp"%>
			</div>
		</header>
		 
		<section id="container">
			<div id="container_box"> 
				<%@ include file="goods/list.jsp"%>
			</div>
		</section>
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="include/footer.jsp"%>
			</div>
		</footer>
	</div>


	<script>
	
/* 	console.log("AdminNick in Main.jsp" + "${Admin.adminNick}");
	if("${Admin.adminNick}" != ""){
			var form = document.createElement("form");
		    form.setAttribute("method", "get");
		    form.setAttribute("action", "/wymarket/admin");
			document.body.appendChild(form);
		    form.submit();
	} */
	
/* 		if (window.performance.navigation.type == 1) {
			window.location.href = '/wymarket/login';
		} */

		/* F5, Ctrl+r, Ctrl+F5 */
		/* document.onkeydown = function(e){
		 if(e.keyCode == 116 || e.ctrlKey == true && (e.keyCode == 82)){
		 e.cancelBubble = true; 
		 e.returnValue = false; 
		 setTimeout(function(){
		 window.location.href = '/wymarket/login';
		 }, 1000);
		 return false;
		 }
		 } */
		 
	 
		 
	</script>

</body>
</html>