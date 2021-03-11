<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/taglib.jspf"%>

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

section#content div.refreshtime1 {
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
									<a href="goods/view2?n=${goods.itemid}"> 
									<img
										 src="${pageContext.request.contextPath}${goods.iimagepath}">

									</a>
								</div>
								
								<div class="ititle"> ${goods.ititle}<c:if
									test="${goods.ireservationstate eq 'Yreservation'}">
									<span style="font-weight: bold; color: darkorange;">[
										예약중 ]</span>										
									<br>
								</c:if></div>
								<div class="icategory">${goods.icategory}</div>
								<div class="price">
									<fmt:formatNumber value="${goods.price}" pattern="###,###,###" />
									원
								</div>
								<div class="refreshtime1"> 
									<c:choose>
                           <c:when
                              test="${goods.refreshtime >= 0 && goods.refreshtime < 60}">
                              <span>${goods.refreshtime}초 전</span>
                              <br>
                           </c:when>

                           <c:when
                              test="${goods.refreshtime >= 60 && goods.refreshtime < 3600}">
                              <fmt:parseNumber var="percent"
                                 value="${((goods.refreshtime) / 60)}"
                                 integerOnly="true" />
                              <span>${percent}분 전</span>
                              <br>
                           </c:when>

                           <c:when
                              test="${goods.refreshtime >= 3600 && goods.refreshtime < 86400}">
                              <fmt:parseNumber var="percent"
                                 value="${((goods.refreshtime) / 3600)}"
                                 integerOnly="true" />
                              <span>${percent}시간 전</span>
                              <br>
                           </c:when>

                           <c:when
                              test="${goods.refreshtime >= 86400 && goods.refreshtime < 2764800} ">
                              <fmt:parseNumber var="percent"
                                 value="${((goods.refreshtime) / 86400)}"
                                 integerOnly="true" />
                              <span>${percent }일 전</span>
                              <br>
                           </c:when>


                           <c:when
                              test="${goods.refreshtime >= 86400 && goods.refreshtime < 2764800}">
                              <fmt:parseNumber var="percent"
                                 value="${((goods.refreshtime) / 86400)}"
                                 integerOnly="true" />
                              <span>${percent}일 전</span>
                              <br>
                           </c:when>

                           <c:when
                              test="${goods.refreshtime >= 2678400 && goods.refreshtime < 32140800}">
                              <fmt:parseNumber var="percent"
                                 value="${((goods.refreshtime) / 2678400)}"
                                 integerOnly="true" />
                              <span>${percent }달 전</span>
                              <br>
                           </c:when>
                           <c:when test="${goods.refreshtime >= 32140800}">
                              <fmt:parseNumber var="percent"
                                 value="${((goods.refreshtime) / 32140800)}"
                                 integerOnly="true" />
                              <span>${percent }년 전 </span>
                              <br>
                           </c:when>
                        </c:choose>
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