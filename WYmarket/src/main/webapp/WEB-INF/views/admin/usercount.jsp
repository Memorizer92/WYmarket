<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수</title>
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
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Do+Hyeon&family=Indie+Flower&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Kanit:ital@1&family=Lobster&display=swap"
	rel="stylesheet">
<style>
* {
	box-sizing: border-box;
}

#outerContainer {
	margin-top: 50px;
}

#tableDiv {
	overflow: auto;
	white-space: nowrap;
}

th {
	text-align: center;
	vertical-align: middle;
}

.page-link {
	background-color: white;
	color: green;
	border-radius: 10%;
}

.page-item {
	margin-left: 10px;
}

.table>:not(caption)>*>* {
	padding: .5rem 25px;
	background-color: var(- -bs-table-bg);
	border-bottom-width: 1px;
	box-shadow: inset 0 0 0 9999px var(- -bs-table-accent-bg);
}

thead>tr>th {
	font-family: 'Kanit', sans-serif;
	font-size: 16px;
}

tbody>tr>th {
	font-family: sans-serif;
	font-size: 14px;
}

.page-item.active .page-link {
	z-index: 3;
	background-image: radial-gradient(at 10% 80px, white, lightgreen 55%, green);
	color: white;
	border-color: lightgreen;
}

.page-link:active, .page-link:hover {
	color: green;
}

.form-select {
	width: 120px;
	height: 40px;
}

#datecontainer {
	display: flex;
	flex-direction: row;
}

#datecontainer>form {
	display: flex;
	flex-direction: row;
}

#totalCount {
	text-align: center;
}

#countPart {
	height: 40px;
}

.card-text {
	margin-top: -8px;
}
</style>
</head>
<body>
	<div class="container" id='outerContainer'>
		<div class="container" id='leftHandContainer'>
			<div class="container" id='tableDiv'>
				<table class="table table-responsive table-striped">
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
							<th scope="col"></th>
							<th scope="col"></th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${users}">
							<c:set var="i" value="${i+1}" />
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
								<th scope="col" id='banTF${i }'>${user.ban}</th>
								<th scope="col">
									<button class="btn btn-primary"
										onclick="banUnban(this,'${user.userNick }',${i })"
										data-btn-type="ban">정지</button>
								</th>
								<th scope="col">
									<button class="btn btn-primary"
										onclick="banUnban(this,'${user.userNick }',${i })"
										data-btn-type="unban">정지 해제</button>
								</th>
								<th scope="col">
									<button class="btn btn-primary"
										onclick="toMyPage('${user.userNick}')">마이 페이지</button>
								</th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<hr>
			<div class="container">
				<h5 id='rowCount'>
					검색 결과 : <b>${accessCount } 개</b>
				</h5>
			</div>
			<c:url var="firstHref"
				value="./admin?pageNum=1&amount=${pagination.amount }" />
			<c:url var="previousHref2"
				value="./admin?pageNum=${pageService.startPage - 1}&amount=${pagination.amount }" />
			<c:url var="nextHref2"
				value="./admin?pageNum=${pageService.endPage + 1}&amount=${pagination.amount }" />
			<c:url var="previousHref1"
				value="./admin?pageNum=${pagination.pageNum - 1 }&amount=${pagination.amount }" />
			<c:url var="nextHref1"
				value="./admin?pageNum=${pagination.pageNum + 1 }&amount=${pagination.amount }" />
			<c:url var="lastHref"
				value="./admin?pageNum=${pageService.lastPage }&amount=${pagination.amount }" />

			<nav aria-label="...">
				<ul class="pagination justify-content-center">
					<li
						class="page-item<c:if test="${pagination.pageNum eq 1}"> disabled</c:if>">
						<a class="page-link" href="${firstHref }" tabindex="-1"
						aria-disabled="true">처음으로</a>
					</li>
					<li
						class="page-item<c:if test="${not pageService.previous }"> disabled</c:if>">
						<a class="page-link" href="${previousHref2 }" tabindex="-1"
						aria-disabled="true">&lt;&lt;</a>
					</li>
					<li
						class="page-item<c:if test="${pagination.pageNum eq 1}"> disabled</c:if>">
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
					<li
						class="page-item<c:if test="${pagination.pageNum eq pageService.lastPage }"> disabled</c:if>">
						<a class="page-link" href="${lastHref }" tabindex="-1"
						aria-disabled="true">끝으로</a>
					</li>
				</ul>
			</nav>

		</div>
		<div class="container" id='datecontainer'>

			<form action="/wymarket/admin/accessUserCount" id='accessForm'>

				<select class="form-select" aria-label="Default select example"
					name="yearSelect" id='year' onchange="yearChange()"
					form='accessForm'>
					<option selected>연도 선택</option>
					<c:forEach var="i" begin="2018" end="${currentYear }">
						<option value=${i }>${i }</option>
					</c:forEach>
				</select> <select class="form-select" aria-label="Default select example"
					name="monthSelect" onchange="monthChange()" id='month'>
					<option selected>월 선택</option>
					<c:forEach var="i" begin="1" end="12">
						<option value=${i }>${i }</option>
					</c:forEach>
				</select> <select class="form-select" aria-label="Default select example"
					name="daySelect" id='day'>
					<option selected>일 선택</option>
					<c:forEach var="i" begin="1" end="${dayOfMonth}">
						<option value="${i }">${i }</option>
					</c:forEach>
				</select>

			</form>

			<div class="card border-dark mb-3" style="max-width: 18rem;"
				id='totalCount'>
				<div class="card-header">누적 접속자 수</div>
				<div class="card-body text-dark" id='countPart'>
					<p class="card-text">${userCountTotal }</p>
				</div>
			</div>

		</div>
	</div>
	<div class="container">
		<button id='userAccessCntBtn' class="btn btn-primary" type="button"
			onclick="userAccessCount()">접속자 수 보기</button>
		<button id='userSignUpCntBtn' class="btn btn-primary" type="button"
			onclick="userSignUpCount()">가입자 수 보기</button>

		<button class="btn btn-primary" onclick="searchAll()">전체 리스트
			보기</button>

	</div>
	</div>
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/usercount.js"></script>


	<script>
		const yearCon = document.getElementById('year');
		const monthCon = document.getElementById('month');
		const dayCon = document.getElementById('day');
			
		if("${selectedYear}" == ""){
			yearCon.value = '연도 선택';
			monthCon.value = '월 선택';
			dayCon.value = '일 선택';
		} else{
			yearCon.value = "${selectedYear}";
			console.log("${selectedYear}")
			monthCon.value = "${selectedMonth}";
			if("${selectedDay}" == ""){
				dayCon.value = '일 선택';
			} else{
				dayCon.value = "${selectedDay}";
			}

		}

		if(monthCon.value == '월 선택'){
			dayCon.disabled = true;
			dayCon.value = '일 선택';
		}
		
 		if (window.performance.navigation.type == 1) {
			yearCon.value = '연도 선택';
			monthCon.value = '월 선택';
			dayCon.value = '일 선택';
		} 

		if (yearCon.value != '연도 선택') {
			monthCon.disabled = false;
		} else {
			monthCon.disabled = true;
			dayCon.disabled = true;
		}


		function yearChange() {
			if (yearCon.value != '연도 선택') {
				monthCon.disabled = false;
			} else {
				monthCon.disabled = true;
				
			}
			monthCon.value = '월 선택';
			dayCon.value = '일 선택';
			dayCon.disabled = true;
		}
		function monthChange() {
			if (monthCon.value != '월 선택') {
				dayCon.disabled = false;

				const prefix = "/wymarket";
				let uri = prefix + "/admin/dayCheck/" + yearCon.value + "/"
						+ monthCon.value;
				location.href = uri;
			} else {
				dayCon.disabled = true;
			}
			dayCon.value = '일 선택';

		}

		function userAccessCount() {
			if(yearCon.value == '연도 선택'){
				alert("연도를 반드시 선택해주세요");
			} else{
				document.getElementById(yearCon.getAttribute('form')).submit();
			}
		}
		
		function searchAll() {
			var form = document.createElement("form");
			form.setAttribute("method", "get");
			form.setAttribute("action", "/wymarket/admin/usercount/all");
			document.body.appendChild(form);
			form.submit();
		}
		
		<%session.removeAttribute("accessCount");
session.removeAttribute("selectedYear");
session.removeAttribute("selectedMonth");
session.removeAttribute("selectedDay");%>

	function userSignUpCount(){
		if(yearCon.value == '연도 선택'){
			alert("연도를 반드시 선택해주세요");
		} else{
			document.getElementById('accessForm').action = '/wymarket/admin/signupUserCount';
			document.getElementById(yearCon.getAttribute('form')).submit();
		}
	}
	
	function toMyPage(userNick){
		location.href='/wymarket/param/test02/' + userNick;
	}
	</script>


</body>
</html>