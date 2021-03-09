<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon"
	href="<%=application.getContextPath()%>/image/salef.ico">
<link rel="shortcut icon"
	href="<%=application.getContextPath()%>/image/salef.ico">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<style>
* {
	box-sizing: border-box;
	user-select: none;
}

.inputArea {
	margin: 10px 0;
}

select {
	width: 100px;
}

label {
	display: inline-block;
	width: 70px;
	padding: 5px;
}

label[for='icontent'] {
	display: block;
}

input {
	width: 150px;
}

textarea#icontent {
	width: 400px;
	height: 180px;
}

.select_img img {
	margin: 20px 0;
}

#cycle {
	
}

#blocker {
	position: absolute;
	z-index: 1;
	width: 100%;
	height: 1000px;
}

#cycleDiv {
	position: absolute;
	left: 50%;
	top: 50%;
	z-index: 2;
}
</style>

<title>로딩 중..</title>
</head>
<body>
	<div id='blocker'></div>
	<div class="d-flex justify-content-center" id='cycleDiv'>
		<div class="spinner-border" style="width: 3rem; height: 3rem;"
			role="status">
			<span class="visually-hidden" id='cycle'>Loading...</span>
		</div>
	</div>

	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp"%>
			</div>
		</header>
		<nav id="nav">
			<div id="nav_box">
				<%@ include file="../include/nav.jsp"%>
			</div>
		</nav>
		<section id="container">
			<div id="container_box">
				<h2>상품 등록</h2>
				<form action="./add" role="form" method="POST" name="form"
					autocomplete="off" enctype="multipart/form-data">

					<div class="inputArea">
						<label for="iimagepath">상품 이미지</label> <input type="file"
							id="iimagepath" name="file" />
						<div class="select_img">
							<img src="" />
						</div>
					</div>

					<div class="inputArea">
						<label for="ititle">상품명</label> <input type="text" id="ititle"
							name="ititle" />
					</div>
					<div class="inputArea">
						<label for="icategory">카테고리</label> <select id="icategory"
							name="icategory">
							<option selected>전체</option>
							<option>여성의류</option>
							<option>패션잡화</option>
							<option>남성의류</option>
							<option>디지털/가전</option>
							<option>도서/티켓/취미/애완</option>
						</select>
					</div>

					<div class="inputArea">
						<label for="price">상품가격</label> <input type="text" id="price"
							name="price" />
					</div>

					<div class="inputArea">
						<label for="icontent">상품소개</label>
						<textarea rows="5" cols="50" id="icontent" name="icontent"></textarea>
					</div>

					<div class="inputArea">
						<input type="button" value="등록" onclick="inputCheck()" />
					</div>
				</form>
			</div>
		</section>
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp"%>
			</div>
		</footer>
	</div>
	<script type="text/javascript">
	$("root").find("input, select, button, textarea").prop("disabled",true);
	setTimeout(() => {
		location.href='<%=application.getContextPath()%>/main';
	}, 5000);
</script>

</body>
</html>