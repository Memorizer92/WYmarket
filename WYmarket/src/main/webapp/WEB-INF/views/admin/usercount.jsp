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
			<div class="col-sm">연</div>
			<div class="col-sm">월</div>
			<div class="col-sm">
				<select class="form-select" aria-label="Default select example" name="daySelect">
					<option selected>Open this select menu</option>
					<c:forEach var="day" items="${days}">
						<option value=${day. }>${day. }</option>
					</c:forEach>


					<option value="2">Two</option>
					<option value="3">Three</option>
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

</body>
</html>