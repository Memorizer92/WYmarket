<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
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

<style type="text/css">
* {
	box-sizing: border-box;
}

body {
	background-image: url("/wymarket/image/carrotbg.jpg");
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

#outerContainer {
	display: flex;
	flex-direction: row;
}

#rightHandContainer {
	display: flex;
	flex-direction: column;
	max-width: 30%;
}

#adminProfile {
	display: flex;
	flex-direction: column;
	background-color: white;
}

.profileP {
	
}

#adminHeader {
	
}

img {
	border-radius: 50%;
	object-fit: cover;
}

#img1 {
	width: 100px;
	height: 100px;
	margin-left: auto;
	margin-right: auto;
	display: block;
}

#nick {
	text-align: center;
}

#adminMemo {
	border: 1px solid #ddd;
	background-color: #feffdd;
	box-shadow: 7px 7px 7px rgba(0, 0, 0, .1);
	width: 100%;
}

#img2 {
	width: 70px;
	height: 70px;
}

#adminBtn, #memoBtn {
	background-color: rgba(70, 70, 85, 1);
	border-color: rgba(70, 70, 85, 1);
}

#memoInput {
	border: none;
	background-color: rgba(254, 255, 221, 0);
	width: 300px;
}

.textarea {
	background-color: rgba(254, 255, 221, 0);
	border-bottom: 1px solid #ccc;
	font-family: inherit;
	font-size: inherit;
	padding: 1px 6px;
	display: block;
	width: 100%;
	overflow: hidden;
	resize: both;
	min-height: 40px;
	line-height: 20px;
}

.textarea[contenteditable]:empty::before {
	content: "Placeholder still possible";
	color: gray;
}

#tableDiv {
	overflow: auto;
	white-space: nowrap;
}

th {
	text-align: center;
}
</style>
</head>
<header id='logoutheader'>
	<a id='kakaoLogout'>로그아웃</a>
</header>
<body>

	<h2>Admin Page</h2>

	<div class="container" id='outerContainer'>
		<div class="container" id='leftHandContainer'>
			<div class="container" id='tableDiv'>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">회원 번호</th>
							<th scope="col">전화 번호</th>
							<th scope="col">카카오 이메일</th>
							<th scope="col">닉네임</th>
							<th scope="col">위도</th>
							<th scope="col">경도</th>
							<th scope="col">주소</th>
							<th scope="col">매너온도</th>
							<th scope="col">생성일</th>
							<th scope="col">구매완료 횟수</th>
							<th scope="col">판매완료 횟수</th>
							<th scope="col">받은 리뷰 수</th>
							<th scope="col">키워드</th>
							<th scope="col">정지 여부</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${users}">
							
							<tr>
								<th scope="col">${user.userID }</th>
								<th scope="col">${user.phoneNumber}</th>
								<th scope="col">${user.kakaoMail}</th>
								<th scope="col">${user.userNick}</th>
								<th scope="col">${user.latitude}</th>
								<th scope="col">${user.longitude}</th>
								<th scope="col">${user.address}</th>
								<th scope="col">${user.manner}</th>
								<th scope="col"><fmt:formatDate
										value="${user.userCreateDate}" pattern="yy/MM/dd" /></th>
								<th scope="col">${user.buyItemCnt}</th>
								<th scope="col">${user.saleItemCnt}</th>
								<th scope="col">${user.reviewCnt}</th>
								<th scope="col">${user.keyWord}</th>
								<th scope="col">${user.ban}</th>
								<th scope="col">
									<button onclick="ban(${user.userNick })">정지</button>
								</th>
								<th scope="col">
									<button onclick="unban(${user.userNick })">정지 해제</button>
								</th>
								<th scope="col">
								
								</th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<hr>

			<c:url var="previousHref2"
				value="./admin?pageNum=${pageService.startPage - 1}&amount=${pagination.amount }" />
			.
			<c:url var="nextHref2"
				value="./admin?pageNum=${pageService.endPage + 1}&amount=${pagination.amount }" />

			<c:url var="previousHref1"
				value="./admin?pageNum=${pagination.pageNum - 1 }&amount=${pagination.amount }" />
			<c:url var="nextHref1"
				value="./admin?pageNum=${pagination.pageNum + 1 }&amount=${pagination.amount }" />

			<nav aria-label="...">
				<ul class="pagination justify-content-center">
					<li
						class="page-item<c:if test="${not pageService.previous }"> disabled</c:if>">
						<a class="page-link" href="${previousHref2 }" tabindex="-1"
						aria-disabled="true">&lt;&lt;</a>
					</li>
					<li
						class="page-item<c:if test="${pagination.pageNum eq 1 or pagination.pageNum eq 0 }"> disabled</c:if>">
						<a class="page-link" href="${previousHref1 }" tabindex="-1"
						aria-disabled="true">&lt;</a>
					</li>
					<c:forEach var="i" begin="${pageService.startPage }"
						end="${pageService.endPage }">
						<li
							class="page-item<c:if test="${pagination.pageNum eq i }"> active</c:if>"
							aria-current="page"><a class="page-link"
							href="./admin?pageNum=${i }&amount=${pagination.amount }
							">${i }</a></li>
					</c:forEach>
					<li
						class="page-item<c:if test="${pagination.pageNum eq pageService.lastPage }"> disabled</c:if>">
						<a class="page-link" href="${nextHref1 }" tabindex="-1"
						aria-disabled="true">&gt;</a>
					</li>
					<li
						class="page-item<c:if test="${not pageService.next }"> disabled</c:if>">
						<a class="page-link" href="${nextHref2 }" tabindex="-1"
						aria-disabled="true">&gt;&gt;</a>
					</li>
				</ul>
			</nav>
			<div class="container">
				<form action="/wymarket/admin/board">
					<select name="list">
						<option value="userId"
							<c:if test="${list eq 'userId'}">selected</c:if>>회원번호</option>
						<option value="userNick"
							<c:if test="${list eq 'userNick'}">selected</c:if>>닉네임</option>
						<option value="address"
							<c:if test="${list eq 'address'}">selected</c:if>>주소</option>
						<input type="text" name="search" />
						<%-- <input name="text" value="${fn:escapeXml(user.userId)}"> --%>

					</select> <input type="submit" />
				</form>
			</div>

		</div>
		<div class="container" id='rightHandContainer'>
			<div class="container" id='adminProfile'>
				<div class="container" id='adminHeader'>
					<img src="/wymarket/image/carrotcharacter.png" alt="" id='img1' />
					<p class='profileP' id='nick'>${Admin.adminNick }</p>
				</div>
				<p class='profileP'>생성일 : ${Admin.adminCreateDate }</p>
				<p class='profileP'>관리자 등급 : ${Admin.adminGrade }</p>
			</div>
			<button type="button" class="btn btn-primary" id='adminBtn'>공지사항
				쓰기</button>
			<div class="container" id='adminMemo'>
				<img src="/wymarket/image/carrotcharacter.png" alt="" id='img2' />
				<p>${Admin.adminNick }</p>
				<p>
					<span id='memo' class="textarea" role="textbox"
						<c:if test="${Admin.adminGrade eq '부'}">readonly</c:if>
						contenteditable></span>
				</p>

				<button type="button" class="btn btn-primary" id='memoBtn'
					onclick="ajaxSaveMemo()">메모</button>
			</div>
		</div>
	</div>

	<script
		src="<%=application.getContextPath()%>/resources/assets/js/admin.js"></script>

	<script>
	
	document.getElementById('memo').innerHTML = "${Admin.adminMemo}";
	
	console.log("${Admin.phoneNumber}");
	console.log("${Admin.adminNick}");
	console.log("${Admin.adminCreateDate}");
	console.log("${Admin.adminGrade }");
	console.log("${Admin.adminMemo }");

	
	document.getElementById('kakaoLogout').addEventListener('click',()=>{
			ajaxLogOut();
			setTimeout(function(){
				window.location.href = "https://kauth.kakao.com/oauth/logout?client_id=f5c99e47d61ce4b7e521d120e1f04199&logout_redirect_uri=http://localhost:8080/wymarket/login";
	        }, 1000); 
		});
	
	function ajaxSaveMemo() {
		console.log("${Admin.adminGrade }");
		if ("${Admin.adminGrade }" == '정') {
			var data = {
				adminGrade: "${Admin.adminGrade}",
				adminMemo: document.getElementById('memo').innerHTML
			}

			console.log(document.getElementById('memo').innerHTML);
			
			var xhttp = new XMLHttpRequest();

			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == XMLHttpRequest.DONE) {
					if (xhttp.status == 200) {

					} else {

					}
				}
			}

			xhttp.open('POST', '/wymarket/saveMemo', true);
			xhttp.setRequestHeader('content-type', 'application/json');
			xhttp.send(JSON.stringify(data));

			console.log('여기오나?')
/* 			var form = document.createElement("form");
			form.setAttribute("method", "post");
			form.setAttribute("action", "/wymarket/admin");
			document.body.appendChild(form);
			form.submit(); */

		} else {
			alert("'정' 관리자만 사용할 수 있는 기능입니다.")
		}

	}
	

</script>

</body>
</html>