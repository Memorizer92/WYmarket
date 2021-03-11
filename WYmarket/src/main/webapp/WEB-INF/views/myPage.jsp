<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/6421ed9b05.js"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/myPage.css" />

<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

</head>
<body>

	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="include/header.jsp"%>
			</div>
		</header>

		<div class="iucOgr">
			<div class="jzWWEx">
				<div class="fydKsO">
					<div class="fhuBVg">찜한상품</div>
					<div class="bfcPkn">
						<a><span style="color: #ff1919d1;"><i
								class="fas fa-heart"></i> 0</span></a>
					</div>
				</div>

				<div class="fydKsO">
					<div class="fhuBVg">최근 본상품</div>
					<div class="bSguym">
						<div class="dewxp"></div>
					</div>
					<div class="hOrrVQ">
						<i class="far fa-eye-slash" style="width: 28px; height: 16px;"></i>

						<div>
							최근 본 상품이 <br>없습니다.
						</div>
					</div>
				</div>
				<div class="fydKsO">
					<button class="hwmeKQ">TOP</button>
				</div>
			</div>
		</div>

		<div class="dUuCSp">
			<div class=" blGbYc">
				<div class="ljEXpd">
					<div class="kzAzec">
						<div class="ffCbsA">
							<div class="hQlOIQ">
								<div class="hkaSsp">
									<div class=" gVxJlc"></div>
									<div class="eVZhRI">
										<img alt="" src="/wymarket/image/myPage_logo01.png"
											class="eDQHHq" style="width: 120px; height: 120px;">
										<div class="frZWOr">${usernick }</div>
										<div class="jVyPTl">
											<a class="hGBbhm" style="text-decoration: none"
												href="<%=application.getContextPath()%>/mypage/Productmanagement">내
												상점 관리</a>
										</div>

									</div>
								</div>
							</div>
						</div>
						<div class="hJeYQQ">
							<div class="dvwUHI">

								<div class="hxmbLs">${usernick }
									Store
									<button class="kQfCqL" style="margin: 26px;"
										onclick="modifyStore()">상점명 수정</button>
								</div>
								<div
									style="    padding: 1px;
    display: none;
    display: flex;
    border: 1px solid rgb(35 34 34);
    height: 42px;
    width: 256px;
    /* padding: 7px 0; */
    border-radius: 5px;">
									<input id="storeNick" type="text" value=${usernick } />
									<button class="storecheck">확인</button>
								</div>
							</div>
							<div class="eyASDB">
								<div class="jwtFDB">
									<i class="fas fa-store" style="color: #ffb123b8;"></i>상점 오픈일
									<div class="hxYQyc">
										<c:choose>
											<c:when test="${userTime >= 0 && userTime < 60}">
												<span>${userTime}초 전</span>
											</c:when>

											<c:when test="${userTime >= 60 && userTime < 3600}">
												<fmt:parseNumber var="percent" value="${((userTime) / 60)}"
													integerOnly="true" />
												<span>${percent}분 전</span>

											</c:when>

											<c:when test="${userTime >= 3600 && userTime < 86400}">
												<fmt:parseNumber var="percent"
													value="${((userTime) / 3600)}" integerOnly="true" />
												<span>${percent}시간 전</span>
												<br>
											</c:when>

											<c:when test="${userTime > 86400}">
												<fmt:parseNumber var="percent"
													value="${((userTime) / 86400)}" integerOnly="true" />
												<span>${percent }일 전</span>
											</c:when>

										</c:choose>
									</div>
								</div>
								<div class="jwtFDB">
									<i class="fas fa-gift" style="color: #6bdc46d1;"></i>상품 판매
									<div class="hxYQyc">
										<span>${saleCount }회</span>
									</div>
								</div>
							</div>
							<div class="hYoLrp">
								<div class="caUMBg" style="display: none;">
									<textarea rows="" cols="">									
									</textarea>
									<button type="button">확인</button>
								</div>
							</div>
							<div class="jUvNko">
								<button class="kQfCqL" onclick="modify()">소개글 수정</button>
							</div>
						</div>
					</div>
				</div>
				<div class="eqkVCJ">
					<div class="flHVbU">
						<div class="bQbzFF">
							<a href="<%=application.getContextPath()%>/mypage/products"
								class="eTKvNd" id="productsA">상품 <span class="hfhszj">${shitemCount }</span></a>
							<a href="<%=application.getContextPath()%>/mypage/comments"
								class="eTKvNd" id="commentsA">상점문의 <span class="hfhszj">0</span></a>
							<a href="<%=application.getContextPath()%>/mypage/favorites"
								class="eTKvNd" id="favoritesA">찜 <span class="hfhszj">0</span></a>
							<a href="<%=application.getContextPath()%>/mypage/reviews"
								class="eTKvNd" id="reviewsA">상점후기 <span class="hfhszj">0</span></a>
						</div>
					</div>
					<div class="jLofof">
						<div class=" eXbIiL" id="products">
							<div class="cqysTx">
								<div>
									상품 <span class="kGPYka">${shitemCount }</span>
								</div>
							</div>
							<div>
								<c:choose>

									<c:when test="${shitemCount eq 0}">
										<div class="iOnkn">등록된 상품이 없습니다.</div>
									</c:when>
									<c:when test="${shitemCount != 0 }">
										<div class="khixbV">

											<c:forEach var="shitem_List" items="${pageList }">
												<c:if test="${shitem_List.istate eq 'Onsale'}">
													<div class="fwledp">

														<div class="jJGnAY">
															<div class="cFzedp">
																<a
																	href="<%=application.getContextPath()%>/goods/view?n=${shitem_List.itemid}">
																	<img alt=""
																	src="${pageContext.request.contextPath}${shitem_List.iimagepath}"
																	style="width: 100%; height: 194px;">
																</a>
															</div>
															<div class="jFyxuP">
																<div class="dPZorb">${shitem_List.ititle }
																	<c:if
																		test="${shitem_List.ireservationstate eq 'Yreservation'}">
																		<span style="font-weight: bold; color: darkorange;">[
																			예약중 ]</span>
																		<br>
																	</c:if>
																</div>
																<div class="clniGs">
																	<div class="hxBDFe">
																		<c:set var="money" value="${shitem_List.price }" />
																		<fmt:formatNumber value="${money }" type="number" />
																		원


																	</div>
																	<div class="dfsKyK">
																		<c:choose>
																			<c:when
																				test="${shitem_List.refreshTime >= 0 && shitem_List.refreshTime < 60}">
																				<span>${shitem_List.refreshTime}초 전</span>
																				<br>
																			</c:when>

																			<c:when
																				test="${shitem_List.refreshTime >= 60 && shitem_List.refreshTime < 3600}">
																				<fmt:parseNumber var="percent"
																					value="${((shitem_List.refreshTime) / 60)}"
																					integerOnly="true" />
																				<span>${percent}분 전</span>
																				<br>
																			</c:when>

																			<c:when
																				test="${shitem_List.refreshTime >= 3600 && shitem_List.refreshTime < 86400}">
																				<fmt:parseNumber var="percent"
																					value="${((shitem_List.refreshTime) / 3600)}"
																					integerOnly="true" />
																				<span>${percent}시간 전</span>
																				<br>
																			</c:when>

																			<c:when
																				test="${shitem_List.refreshTime >= 86400 && shitem_List.refreshTime < 2764800} ">
																				<fmt:parseNumber var="percent"
																					value="${((shitem_List.refreshTime) / 86400)}"
																					integerOnly="true" />
																				<span>${percent }일 전</span>
																				<br>
																			</c:when>


																			<c:when
																				test="${shitem_List.refreshTime >= 86400 && shitem_List.refreshTime < 2764800}">
																				<fmt:parseNumber var="percent"
																					value="${((shitem_List.refreshTime) / 86400)}"
																					integerOnly="true" />
																				<span>${percent}일 전</span>
																				<br>
																			</c:when>

																			<c:when
																				test="${shitem_List.refreshTime >= 2678400 && shitem_List.refreshTime < 32140800}">
																				<fmt:parseNumber var="percent"
																					value="${((shitem_List.refreshTime) / 2678400)}"
																					integerOnly="true" />
																				<span>${percent }달 전</span>
																				<br>
																			</c:when>
																			<c:when test="${shitem_List.refreshTime >= 32140800}">
																				<fmt:parseNumber var="percent"
																					value="${((shitem_List.refreshTime) / 32140800)}"
																					integerOnly="true" />
																				<span>${percent }년 전 </span>
																				<br>
																			</c:when>
																		</c:choose>
																	</div>
																</div>
															</div>
															<div class="lkXrFk">
																<i class="fas fa-map-marker-alt"
																	style="width: 15px; height: 17px; position: relative; bottom: 1px;"></i>
																<span class="address"
																	style="position: relative; top: -4px;"> <input
																	name="addressinput" type="text" style="display: none;"
																	value="${shitem_List.address }" />
																	${shitem_List.address }
																</span>
															</div>
														</div>
													</div>
												</c:if>
											</c:forEach>
										</div>
									</c:when>
								</c:choose>

								<div class="ePdYoP"></div>

							</div>
						</div>
						<div>
							<c:url var="previousHref"
								value="./myPage?pagenum=${page.startPage - page.size}&amount=${page.amount }&usernick=${usernick }" />
							<c:url var="nextHref"
								value="./myPage?pagenum=${page.endPage + 1}&amount=${page.amount }&usernick=${usernick }" />

							<c:url var="onego"
								value="./myPage?pagenum=${page.currPage + 1}&amount=${page.amount }&usernick=${usernick }" />
							<c:url var="oneback"
								value="./myPage?pagenum=${page.currPage - 1}&amount=${page.amount }&usernick=${usernick }" />
							<nav aria-label="...">
								<ul class="pagination" style="display: flex; list-style: none;">

									<li
										class="page-item<c:if test="${not page.previous }"> disabled</c:if>">
										<a class="page-link" href="${previousHref }" tabindex="-1"
										aria-disabled="true">&lt;&lt;</a>
									</li>

									<li
										class="page-item <c:if test="${page.currPage eq 1}">disabled</c:if>">
										<a class="page-link" href="${oneback }" tabindex="-1"
										aria-disabled="true">&lt;</a>
									</li>

									<c:forEach var="i" begin="${page.startPage }"
										end="${page.endPage }">
										<li
											class="page-item<c:if test="${page.currPage eq i }"> active</c:if>"
											aria-current="page"><a class="page-link"
											href="./myPage?pagenum=${i }&amount=${page.amount }&usernick=${usernick }">${i }</a>
										</li>
									</c:forEach>

									<li
										class="page-item <c:if test ="${page.currPage eq page.lastPage}">disabled</c:if>">
										<a class="page-link" href="${onego }" tabindex="-1"
										aria-disabled="true">&gt;</a>

									</li>
									<li
										class="page-item<c:if test="${not page.next }"> disabled</c:if>">
										<a class="page-link" href="${nextHref }" tabindex="-1"
										aria-disabled="true">&gt;&gt;</a>
									</li>
								</ul>
							</nav>
						</div>
					</div>
				</div>

			</div>

		</div>



		<footer id="footer">
			<div id="footer_box">
				<%@ include file="include/footer.jsp"%>
			</div>
		</footer>
	</div>

	<input type="text" name="products" id="products1" value="${products }"
		style="" />
	<input type="text" name="comments" id="comments" value="${comments }"
		style="" />
	<input type="text" name="favorites" id="favorites"
		value="${favorites }" style="" />
	<input type="text" name="reviews" id="reviews" value="${reviews }"
		style="" />
	<input type="text" name="usernick" id="usernick" value="${usernick }"
		style="" />

	<script type="text/javascript"
		src="<%=application.getContextPath()%>/resources/assets/js/myPage.js">
		
	</script>
	<script type="text/javascript">
		function modifyStore() {
			const storeNick = document.getElementById("storeNick");
			
			$(document).ready(function() {				
				$(".hxmbLs").hide();
			})
			storeNick.style.display = 'block';
		}

		
	</script>


</body>
</html>