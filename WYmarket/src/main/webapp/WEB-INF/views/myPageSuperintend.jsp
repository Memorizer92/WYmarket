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


.eXqDQY{
background: rgb(255, 255, 255);
    font-size: 16px;
}

.dhPrXG{
    width: 1024px;
    margin: auto;
}

.dhPrXG > table{
width: 100%;
    text-align: center;
    table-layout: fixed;
}

.dhPrXG > table > thead{
    font-weight: 500;
    border-top: 1px solid rgb(30, 29, 41);
    border-bottom: 1px solid rgb(30, 29, 41);
}

.dhPrXG table thead > tr {
    height: 2.5rem;
}

.dhPrXG table tr > :first-child {
    width: 10.5rem;
}

.dhPrXG table tr > :nth-child(2) {
    width: 8rem;
}
.dhPrXG table tr > :nth-child(3) {
    width: 21rem;
}

.dhPrXG table tr > :nth-child(4) {
    width: 6.5rem;
}

.dhPrXG table tr > :nth-child(5) {
    width: 4.5rem;
}

.dhPrXG table tr > :nth-child(6) {
    width: 9.5rem;
}

.dhPrXG table tr > :nth-child(7) {
    width: 4rem;
}
.dzcnmr{
    display: flex;
    margin: 2.5rem 0px 2rem;
}



.frGPEd{
    width: 400px;
    height: 3rem;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    position: relative;
}
.frGPEd > input{
    height: 100%;
    width: 100%;
    padding: 0px 68px 0px 1rem;
    border: 1px solid rgb(195, 194, 204);
    border-radius: 2px;
}

.fQvnGB{
    position: absolute;
    top: 0px;
    right: 0px;
    background-position: center center;
    background-repeat: no-repeat;
    background-size: 20px 20px;
    width: 52px;
    height: 100%;
    background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld0JveD0iMCAwIDIwIDIwIj4KICAgIDxwYXRoIGZpbGw9IiMxRTFEMjkiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTIuMTUyIDguNjA4QTYuNDYzIDYuNDYzIDAgMCAxIDguNjEgMi4xNTJhNi40NjMgNi40NjMgMCAwIDEgNi40NTYgNi40NTYgNi40NjMgNi40NjMgMCAwIDEtNi40NTYgNi40NTYgNi40NjMgNi40NjMgMCAwIDEtNi40NTctNi40NTZtMTMuMjQ5IDUuMjdhOC41NSA4LjU1IDAgMCAwIDEuODE2LTUuMjdDMTcuMjE3IDMuODYyIDEzLjM1NSAwIDguNjEgMCAzLjg2MiAwIDAgMy44NjIgMCA4LjYwOGMwIDQuNzQ3IDMuODYyIDguNjA4IDguNjA5IDguNjA4YTguNTYgOC41NiAwIDAgMCA1LjI3LTEuODE2bDQuMjg0IDQuMjg0YTEuMDczIDEuMDczIDAgMCAwIDEuNTIxIDAgMS4wNzUgMS4wNzUgMCAwIDAgMC0xLjUyMmwtNC4yODMtNC4yODR6Ii8+Cjwvc3ZnPgo=);
}
.jAXfuM{
width: 7rem;
}

.cont{
    position: relative;
    box-sizing: border-box;
}
.eAMYPo{
    width: 100%;
    height: 3rem;
    display: flex;
    border: 1px solid rgb(195, 194, 204);
    border-radius: 2px;
}

.hwfws3{
    -webkit-box-align: center;
    align-items: center;
    display: flex;
    flex: 1 1 0%;
    flex-wrap: wrap;
    padding: 2px 8px;
    position: relative;
    overflow: hidden;
    box-sizing: border-box;
}

.iOnkn {
    width: 100%;
    text-align: center;
    background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI2MCIgaGVpZ2h0PSI2MCIgdmlld0JveD0iMCAwIDYwIDYwIj4KICAgIDxwYXRoIGZpbGw9IiNEQ0RCRTQiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTU3IDBhMyAzIDAgMCAxIDMgM3YyN2MwIC43OTUtLjMxNCAxLjU2LS44NzggMi4xMjFsLTI3IDI3YTIuOTkxIDIuOTkxIDAgMCAxLTQuMjQyIDBsLTI3LTI3YTIuOTk3IDIuOTk3IDAgMCAxIDAtNC4yNDJsMjctMjdBMy4wMDUgMy4wMDUgMCAwIDEgMzAgMGgyN3pNMzAgNTIuNzU4TDM0Ljc2IDQ4IDEyIDI1LjI0MiA3LjI0MyAzMCAzMCA1Mi43NTh6bTI0LTI0VjZIMzEuMjQ0bC0xNSAxNUwzOSA0My43NThsMTUtMTV6TTQ1IDE4YTMgMyAwIDEgMSAwLTYgMyAzIDAgMCAxIDAgNnoiLz4KPC9zdmc+Cg==);
    background-position: center center;
    background-repeat: no-repeat;
    background-size: 5rem;
    height: 21rem;
    padding-top: 14rem;
    color: rgb(155, 153, 169);
}

.breakdown{
border: 0;
outline: 0;
background-color: white;
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
		
		
		<div class ="gPdUna">
		<div class="mainBar">
			<nav class="productBarMain">

				<div class="productBar productBarAfter"><button class ="breakdown" onclick="location.href ='<%=application.getContextPath()%>/goods/getGoodsRegister' ">상품등록</button></div>
				<div class="productBar productBarAfter"><button class ="breakdown" onclick="location.href ='<%=application.getContextPath()%>/mypage/Productmanagement'">상품관리</button></div>
				<div class="productBar"> <button class ="breakdown" onclick="location.href ='<%=application.getContextPath()%>/param/purchase'">구매</button> / <button class ="breakdown" onclick="location.href = '<%=application.getContextPath()%>/param/sale'">판매내역</button> </div>
			</nav>
		</div>
		
		<div class ="eXqDQY">
			<main class ="dhPrXG">
				<header class ="dzcnmr">
					<form action="" class ="frGPEd">
						<input type="text" placeholder="상품명을 입력해주세요."/>
						<button type="submit" class = "fQvnGB"></button>
					</form>
					
					<div class ="jAXfuM">
						<div class ="cont">
							<div class ="eAMYPo">
								<div class ="hwfws3">
									개수정하기
								</div>
								<div class = "kyyRgV"> 화살표 방향</div>
							</div>
						</div>
					</div>
					<div class ="jAXfuM">
						<div class = "cont">
							<div class ="eAMYPo">
								<div class ="hwfws3"></div>
								<div class = "kyyRgV"> 화살표 방향</div>
							</div>
						</div>
					</div>
				</header>
				<table>
					<thead>
						<tr>
							<th>사진</th>
							<th>판매상태</th>
							<th>상품명</th>
							<th>가격</th>
							<th>찜/댓글</th>
							<th>최근 수정일</th>
							<th>기능</th>	
						</tr>
					</thead>
					<tbody></tbody>
				</table>
				<div class ="iOnkn">등록된 상품이 없습니다.</div>
			</main>
		</div>
		</div>


		<footer id="footer">
			<div id="footer_box">
				<%@ include file="include/footer.jsp"%>
			</div>
		</footer>
	</div>


</body>
</html>