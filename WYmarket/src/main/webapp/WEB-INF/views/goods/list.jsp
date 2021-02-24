<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<style>
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
</style>

</head>
<body>
	<div>
		<section id="container">
			<div id="container_box">
				<table>
					<thead>
						<tr>
							<th>상품 이미지</th>
							<th>상품명</th>
							<th>카테고리</th>
							<th>상품 가격</th>
							<th>등록날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${goods}" var="goods">
							<tr>
								<td>
								<a href="goods/view?n=${goods.itemid}">
								<img src="${pageContext.request.contextPath}${goods.iimagepath}" width="194" height="194"/>
								</a></td>		
								<td>${goods.ititle}</td>
								<td>${goods.icategory}</td>
								<td>
								<fmt:formatNumber value="${goods.price}" pattern="###,###,###"/>
								</td>
								<td>
								<fmt:formatDate value="${goods.refreshtime}" pattern="yyyy-MM-dd"/>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</section>
		
	</div>

</body>
</html>