<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>

<style type="text/css">
* {
	box-sizing: border-box;
}

.mainBar {
	height: 4rem;
	border-bottom: 1px solid rgb(244, 244, 250);
	display: flex;
	-webkit-box-pack: center;
	justify-content: center;
}

.productBarMain {
	width: 1024px;
	display: flex;
	height: 100%;
	font-size: 13px;
}

.productBar:first-child {
	margin-left: -0.5rem;
}

.productBar {
	height: 100%;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	margin-right: 2rem;
}

.productBarAfter::after {
	content: "";
	width: 1px;
	height: 14px;
	border-right: 1px solid rgb(210, 210, 210);
	margin-left: 2rem;
}
</style>

</head>
<body>



	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="include/header.jsp"%>
			</div>
		</header>

		<div class="mainBar">
			<nav class="productBarMain">

				<div class="productBar productBarAfter">상품등록</div>
				<div class="productBar productBarAfter">상품관리</div>
				<div class="productBar">구매/판매내역</div>
			</nav>
		</div>


		<form action="<%=application.getContextPath()%>/param/sale"
			method="get">
			<input type="submit" value="판매내역" />
		</form>
		<div>
			<form action="<%=application.getContextPath()%>/param/purchase"
				method="get">
				<input type="submit" value="구매내역" />
			</form>
		</div>
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="include/footer.jsp"%>
			</div>
		</footer>
	</div>


</body>
</html>