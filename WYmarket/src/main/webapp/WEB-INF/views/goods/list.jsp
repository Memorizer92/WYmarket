<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon"
	href="<%=application.getContextPath()%>/image/salef.ico">
<link rel="shortcut icon"
	href="<%=application.getContextPath()%>/image/salef.ico">
<title>리스트</title>

<style>
section#content ul {
	margin: 0px 100px 0px 190px;
}

section#content ul li {
	display: inline-block;
	margin: 0px 10px 10px 0px;
	border-style: solid;
	border-width: 1px;
	border-color: silver;
}

section#content div.iimagepath img {
	width: 200px;
	height: 200px;
}

section#content div.ititle {
	padding: 10px 0;
	text-align: center;
	font-weight: 500;
	border-top-style: solid;
	border-top-width: 1px;
	border-top-color: silver;
}

section#content div.ititle a {
	color: #000;
}

section#content div.price {
	font-weight: bold;
	padding-left: 15px;
	font-size: 16px
}

section#content div.refreshtime {
	text-align: right;
	padding: 0px 15px 10px 0px;
	color: silver;
	font-size: 13px
}

</style>

</head>
<body>
	<div id="root">

		<section id="container">
			<div id="container_box">

				<section id="content">

					<ul>
						<c:forEach items="${goods}" var="goods">
							<li>
								<div class="iimagepath">
									<a href="goods/view?n=${goods.itemid}"> <img
										src="${pageContext.request.contextPath}${goods.iimagepath}">
									</a>
								</div>
								<div class="ititle">${goods.ititle}</div>
								<div class="icategory">${goods.icategory}</div>
								<div class="price">
									<fmt:formatNumber value="${goods.price}" pattern="###,###,###" />
									원
								</div>
								<div class="refreshtime">
									<fmt:formatDate value="${goods.refreshtime}"
										pattern="yyyy-MM-dd" />
								</div>
							</li>
						</c:forEach>
					</ul>
					<c:set var="list" value="${goods}" />
					<c:if test="${empty goods}">
						<div style="text-align: center; height: 300px">
							<div style="margin-top: 10%">검색 결과가 없습니다.</div>
						</div>
					</c:if>
				</section>


			</div>
		</section>

	</div>

</body>
</html>