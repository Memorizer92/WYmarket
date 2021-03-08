<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
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
	text-decoration: none;
	text-align: center;
	padding-top: 14px;
	background-color: #fef01b;
	color: #3A1D1D;
	border-radius: 5px;
	font-weight: bold;
	display: block;
	margin-left: auto;
	margin-right: 5%;
	width: 20%;
	margin-top: 25px;
	height: 50px;
	cursor: pointer;
}

#logoutheader {
	display: flex;
	justify-content: flex-end;
}
</style>
</head>
<header id='logoutheader'>
	<a id='kakaoLogout'>로그아웃</a>
</header>
<body>

	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="include/header.jsp"%>
			</div>
		</header>
		<nav id="nav">
			<div id="nav_box">
				<%@ include file="include/nav.jsp"%>
			</div>
		</nav>
		<section id="container">
				<span>1:${user}</span>
				<li><a href="goods/register">상품등록</a></li>
				<%@ include file="goods/list.jsp"%>
			</div>
		</section>
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="include/footer.jsp"%>
			</div>
		</footer>
	</div>





	<script
		src="<%=application.getContextPath()%>/resources/assets/js/main.js"></script>

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
		 
		 document.getElementById('kakaoLogout').addEventListener('click',()=>{
				ajaxLogOut();
 				setTimeout(function(){
					window.location.href = "https://kauth.kakao.com/oauth/logout?client_id=f5c99e47d61ce4b7e521d120e1f04199&logout_redirect_uri=http://localhost:8080/wymarket/login";
		        }, 1000); 
			});
		 
	</script>

</body>
</html>