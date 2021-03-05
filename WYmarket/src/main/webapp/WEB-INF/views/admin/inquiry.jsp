<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inquiry</title>
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
	<div class="container">
		<ul class="list-group">
		<p>받은 문의</p>
			<c:forEach var="inquiry" items="${inquiries }">
				<li class="list-group-item"
					onclick="ajaxInquiry('${inquiry.inquiryID }','${inquiry.userNick }',
			' ${inquiry.inquiryCategory }', '${inquiry.inquiryContent }')">문의
					번호 : ${inquiry.inquiryID } <br> 닉네임 : ${inquiry.userNick } <br>
					카테고리 : ${inquiry.inquiryCategory }
				</li>
			</c:forEach>
		</ul>
		<ul class="list-group">
		<p>보낸 문의</p>
			<c:forEach var="inquiry" items="${inquiries }">
				<li class="list-group-item"
					onclick="ajaxInquiry('${inquiry.inquiryID }','${inquiry.userNick }',
			' ${inquiry.inquiryCategory }', '${inquiry.inquiryContent }')">문의
					번호 : ${inquiry.inquiryID } <br> 닉네임 : ${inquiry.userNick } <br>
					카테고리 : ${inquiry.inquiryCategory }
				</li>
			</c:forEach>
		</ul>
	</div>

	<div class="modal fade" id="inquiryModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body" id='modalContent'></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>

	<script
		src="<%=application.getContextPath()%>/resources/assets/js/inquiry.js"></script>

</body>
</html>