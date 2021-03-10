<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="icon"
	href="<%=application.getContextPath()%>/image/salef.ico">
<link rel="shortcut icon"
	href="<%=application.getContextPath()%>/image/salef.ico">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/view.css">
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

<title>상품조회</title>
</head>
<body>
	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp"%>
			</div>
		</header>
		<section id="container">
			<div class="container_box">
				<form role="form" method="post" autocomplete="off">
					<input type="hidden" name="n" value="${goods.itemID}" />
				<div class="sc-GDiEgd ffhRs">
					<!-- 왼쪽 이미지 -->
					<div class="sc-dfRKBO dHlrrk">
						<img src="${pageContext.request.contextPath}${goods.simagePath }" 
						class="sc-FGdgdS eqrak" width="430px" height="430px"/>
					</div>

					<!-- 오른쪽 상품 정보 -->

					<div class="sc-jiTwWT efsCcW">
						<div class="sc-cXHFlN lihcCo">
							<div class="sc-gJTSre jpBJTK">
								<div class="sc-fdqjUm bYWuXd">
									<div class="sc-cLmFfZ keaVUW">${goods.stitle}</div>
									<div class="sc-eAyhxF ioSadU">
										<span><fmt:formatNumber value="${goods.price}"
												pattern="###,###,###" /> 원</span>
									</div>
								</div>
								<div class="sc-iNovjJ fIhcXL">
									<div class="sc-kyCyAI kbnbuz"></div>
									<!-- 좋아요,조회수,날짜 -->
									<div class="sc-fqC010 ePujpv">
										<div class="sc-BOulX hnYMWw">
											<div class="sc-hAcydR cMqzFd">
											카테고리
											</div>
											<div class="sc-eomEcv eAimDN">${goods.scategory}</div>
										</div>
										<div class="sc-BOulX hnYMWw">
											<div class="sc-hAcydR cMqzFd">판매자</div>
											<div class="sc-eomEcv eAimDN">${goods.userNick}</div>
										</div>
										<div class="sc-BOulX hnYMWw">
											<div class="sc-hAcydR cMqzFd">거래지역</div>
											<div class="sc-eomEcv eAimDN">${goods.address}</div>
										</div>
									</div>
								</div>

								<!-- 오른쪽 하단 버튼 -->
								<div class="sc-iBfVdv gaaKji">
									
									<c:set var="sellerId" value="${sellerId}" />
									<c:set var="buyerId" value="${buyerId}" />
		
									<c:choose>
										<c:when test="${sellerId ne buyerId}">
											<%-- 자신이 올린 판매글에 들어가면 채팅 거래하기 없음 --%>
											<button type="button" id="chat_Btn"
											onclick="window.open('<%=application.getContextPath()%>/chats/room?roomId=${sellerId}${buyerId}&buyerName=${buyerName}&sellerName=${goods.userNick}&item=${goods.stitle}&price=${goods.price}&check=0','채팅방','width=650,height=800,left=650,top=130,status=no,scrollbars=yes')">
											채팅으로 거래하기</button>
										</c:when>
										<c:otherwise>
											<button type="button" id="modify_Btn" class="btn btn-warning">수정</button>
											<button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>
										</c:otherwise>
									</c:choose>
									
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="sc-buGlAa WhGFK">
					<div class="sc-bCCsHx eozLFC">
						<div class="sc-cBOTKl iLsYdV"><!-- icontent -->
							<div class="sc-hkHFWD hFnNtf">상품 정보</div>
							<div class="sc-iUVpnZ kjiQPu">
								<div class="sc-feWbDf fWwWem"></div>
								<div class="sc-goFBvh dkfMql">${goods.scontent}</div>
							</div>
						</div>
						<div class=""><!-- 댓글 -->
						</div>
					</div>
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
	<script>
		var formObj = $("form[role='form']");

		$("#modify_Btn").click(function() {
			formObj.attr("action", "./modify");//action
			formObj.attr("method", "get")
			formObj.submit();[]
		});

		$("#delete_Btn").click(function() {
			formObj.attr("action", "./delete");
			formObj.submit();
		});
	</script>
</body>
</html>