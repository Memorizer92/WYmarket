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

</head>
<body>

	<div class="container" id='outer'>
		<div class="row">
			<div class="col-sm">
				<div class="card border-dark mb-3" style="max-width: 18rem;">
					<div class="card-header">현재 접속자 수</div>
					<div class="card-body text-dark">
						<p class="card-text">현재</p>
					</div>
				</div>
			</div>
			<div class="col-sm">
				<select class="form-select" aria-label="Default select example"
					name="yearSelect" id='year' onchange="yearChange()">
					<option selected>연도 선택</option>
					<c:forEach var="i" begin="2018" end="${currentYear }">
						<option value=${i }>${i }</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-sm">
				<select class="form-select" aria-label="Default select example"
					name="monthSelect" onchange="monthChange()" id='month'>
					<option selected>월 선택</option>
					<c:forEach var="i" begin="1" end="12">
						<option value=${i }>${i }</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-sm">
				<select class="form-select" aria-label="Default select example"
					name="daySelect" id='day'>
					<option selected>일 선택</option>
					<c:forEach var="i" begin="1" end="${dayOfMonth}">
						<option value="${i }">${i }</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-sm">
				<div class="card border-dark mb-3" style="max-width: 18rem;">
					<div class="card-header">누적 접속자 수</div>
					<div class="card-body text-dark">
						<p class="card-text">${userCountTotal }</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>

	
		const yearCon = document.getElementById('year');
		const monthCon = document.getElementById('month');
		const dayCon = document.getElementById('day');

		yearCon.value = "${selectedYear}";
		monthCon.value = "${selectedMonth}";

		if(window.performance.navigation.type == 1){
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
		if (monthCon.value != '월 선택') {

		}

		function yearChange() {
			if (yearCon.value != '연도 선택') {
				monthCon.disabled = false;
			} else {
				monthCon.disabled = true;
				dayCon.disabled = true;
			}
			monthCon.value = '월 선택';
			dayCon.value = '일 선택';
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
	</script>

</body>
</html>