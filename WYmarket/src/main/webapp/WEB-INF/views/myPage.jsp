<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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


<style type="text/css">
* {
	box-sizing: border-box;
}

.mainBar {
	height: 4rem;
	border-bottom: 1px solid rgb(244, 244, 250);
	display: flex;
	-webkit-box-pack: center;
	justify-content: center;
}

.productBarMain {
	width: 1024px;
	display: flex;
	height: 100%;
	font-size: 13px;
}

.productBar:first-child {
	margin-left: -0.5rem;
}

.productBar {
	height: 100%;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	margin-right: 2rem;
}

.productBarAfter::after {
	content: "";
	width: 1px;
	height: 14px;
	border-right: 1px solid rgb(210, 210, 210);
	margin-left: 2rem;
}

.eVZhRI {
	position: inherit;
	display: flex;
	width: 100%;
	height: 100%;
	-webkit-box-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	align-items: center;
	flex-direction: column;
	box-shadow: rgb(4 0 0/ 3%) 0px 5px 10px 0px;
}

.dUuCSp {
	display: flex;
	-webkit-box-pack: center;
	justify-content: center;
	background: rgb(255, 255, 255);
}

.blGbYc {
	width: 1024px;
	margin-top: 30px;
}

.ljEXpd {
	margin-bottom: 30px;
}

.kzAzec {
	display: flex;
	width: 100%;
}

.ffCbsA {
	flex-shrink: 0;
}

.hQlOIQ {
	width: 310px;
	height: 310px;
	position: relative;
	color: rgb(255, 255, 255);
}

.hkaSsp {
	position: absolute;
	top: 0px;
	left: 0px;
	width: 100%;
	height: 100%;
	overflow: hidden;
}

.gVxJlc {
	border: solid 0.5px #e9ecef;
	position: absolute;
	background-size: cover;
	background-repeat: no-repeat;
	z-index: 0;
	width: 100%;
	height: 100%;
	background-image:
		url(data:image/jpeg;base64,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);
	background-color: rgb(181, 181, 181);
}

.eVZhRI {
	position: inherit;
	display: flex;
	width: 100%;
	height: 100%;
	-webkit-box-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	align-items: center;
	flex-direction: column;
	box-shadow: rgb(4 0 0/ 3%) 0px 5px 10px 0px;
}

.eDQHHq {
	border-radius: 50%;
	margin-bottom: 15px;
}

.frZWOr {
	font-size: 16px;
	margin-bottom: 10px;
	color: #231e1ead;
	font-weight: bold;
}

.jVyPTl {
	display: flex;
}

.hGBbhm {
	width: 106px;
	border: 1px solid #0000002b;
	background-color: #80808012;
	font-weight: bold;
	color: #000000d1;
	height: 40px;
	display: flex;
	justify-content: center;
	align-items: center;
	margin-left: 10px;
	font-size: 13px;
	cursor: pointer;
	margin-top: 5px;
}

.hJeYQQ {
	flex: 100%;
	padding: 0px 30px;
	border-top: 1px solid rgb(238, 238, 238);
	border-right: 1px solid rgb(238, 238, 238);
	border-bottom: 1px solid rgb(238, 238, 238);
	display: flex;
	height: 310px;
	flex-direction: column;
}

.dvwUHI {
	font-size: 18px;
	height: 75px;
	font-weight: 600;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	justify-content: space-between;
	flex-shrink: 0;
}

.hxmbLs {
	display: flex;
	-webkit-box-align: center;
	align-items: center;
}

.eyASDB {
	height: 45px;
	display: flex;
	align-items: center;
	border-top: 1px solid rgb(230 223 223/ 65%);
	border-bottom: 1px solid rgb(230 223 223/ 65%);
	margin-bottom: 20px;
	flex-shrink: 0;
	border-bottom: 1px solid rgb(230 223 223/ 65%);
}

.jwtFDB {
	margin-right: 30px;
	font-size: 13px;
	color: rgb(136, 136, 136);
	display: flex;
}

.jwtFDB>svg {
	margin-right: 6px;
	width: 14px;
	height: 13px;
	margin-top: 3px;
}

.hYoLrp {
	flex-grow: 1;
	width: 100%;
	overflow-y: auto;
	line-height: 1.57;
	white-space: pre-wrap;
}

.jUvNko {
	height: 56px;
	display: flex;
	align-items: center;
	flex-shrink: 0;
}

.kQfCqL {
	height: 20px;
	display: flex;
	align-items: center;
	padding: 0px 5px;
	color: rgb(117, 115, 115);
	border: 1px solid rgb(228, 222, 222);
	background-color: white;
	font-size: 11px;
}

.caUMBg {
	flex-grow: 1;
	overflow-y: auto;
	margin-bottom: 20px;
	display: flex;
}

.caUMBg>textarea {
	flex-grow: 1;
	resize: none;
	border: 1px solid rgb(238, 238, 238);
}

.caUMBg>button {
	width: 100px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-top: 1px solid rgb(238, 238, 238);
	border-right: 1px solid rgb(238, 238, 238);
	border-bottom: 1px solid rgb(238, 238, 238);
	background: rgb(250, 250, 250);
	color: rgb(136, 136, 136);
}
</style>

</head>
<body>



	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="include/header.jsp"%>
			</div>
		</header>


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
										<div class="frZWOr">상점댕댕이호</div>
										<div class="jVyPTl">
											<a class="hGBbhm" style="text-decoration: none">내 상점 관리</a>
										</div>

									</div>
								</div>
							</div>
						</div>
						<div class="hJeYQQ">
							<div class="dvwUHI">
								<div class="hxmbLs">상점댕댕이호</div>
							</div>
							<div class="eyASDB">
								<div class="jwtFDB">
									<i class="fas fa-store" style="color: #ffb123b8;"></i>상점 오픈일
								</div>
								<div class="jwtFDB">
									<i class="fas fa-gift" style="color: #6bdc46d1;"></i>상품 판매
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
						
						<form action="<%=application.getContextPath()%>/param/sale"
			method="get">
			<input type="submit" value="판매내역" />
		</form>
		<div>
			<form action="<%=application.getContextPath()%>/param/purchase"
				method="get">
				<input type="submit" value="구매내역" />
			</form>
		</div>
					</div>
					<div class="eqkVCJ">
						<div class="gDUZll"></div>
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

	<script type="text/javascript">
		function modify() {
			var cal = document.getElementsByClassName("caUMBg");
			cal.style.display = 'block';
			var kc = document.getElementsByClassName("kQfCqL");
		}
	</script>
</body>
</html>