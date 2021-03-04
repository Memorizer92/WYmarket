<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<title>header</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"
	crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<style>
* {
	box-sizing: border-box;
}

.content {
	width: 300px;
	border: black solid 1px;
}

.vv {
	border-bottom: rgb(237, 239, 246) solid 2px;
}

.ma {
	margin-left: 30px;
	margin-right: 30px;
}

.cen {
	text-align: center;
}

.navi {
	margin-top: 5%;
	width: 1130px;
	margin-left: auto;
	margin-right: auto;
	display: flex;
	flex-direction: row;
	flex-wrap: nowrap;
	justify-content: center;
}

.contents {
	width: 1130px;
	height: 1000px;
	margin-left: auto;
	margin-right: auto;
}

a {
	position: relative;
	z-index: 1;
}

.sm {
	font-size: 14px;
	color: gray;
}

.pp {
	margin-top: 4px;
}

.cent {
	justify-content: center;
}

.hori {
	width: 300px;
}

.lim>* {
	list-style: none;
	height: 60px;
	border-bottom: 1px solid gray;
	padding: 25px;
	padding-bottom: 45px;
	text-align: left;
}

.lim>li>span {
	float: left;
	margin-right: 20px;
}

#inquiryContainer {
	border: solid 1px white;
	width: 480px;
	border-radius: 10%;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

#inquiryContainer>#inquiryContainerInner>* {
	margin-left: auto;
	margin-right: auto;
	width: 85%;
}

#inquiryContainerInner {
	margin: 10% 0px;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

#inquiryContainerInner>p {
	text-align: left;
}

#inquiryContainerInner>p:nth-of-type(2) {
	font-size: 13px;
	color: gray;
}

#inquiryContainerInner>[class*='form-'] {
	margin-bottom: 15px;
}

#inquiryContainerInner>textarea {
	height: 180px;
}

#inquirybtn {
	background: radial-gradient(at 10% 30px, #FF8A3D, white);
	border-color: white;
}

#inquirybtn:hover {
	background: radial-gradient(at 10% 30px, white, #FF8A3D);
}
</style>



</head>

<body>

	<div class="cen container-xl">
		<nav class="navi">
			<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
				<li class="nav-item vv" role="presentation">
					<button class="nav-link content " id="pills-home-tab"
						data-bs-toggle="pill" data-bs-target="#pills-home" type="button"
						role="tab" aria-controls="pills-home" aria-selected="">
						공지사항</button>
				</li>
				<li class="nav-item ma vv" role="presentation">
					<button class="nav-link content" id="pills-profile-tab"
						data-bs-toggle="pill" data-bs-target="#pills-profile"
						type="button" role="tab" aria-controls="pills-profile"
						aria-selected="false">운영정책</button>
				</li>
				<li class="nav-item vv" role="presentation">
					<button class="nav-link content" id="pills-contact-tab"
						data-bs-toggle="pill" data-bs-target="#pills-contact"
						type="button" role="tab" aria-controls="pills-contact"
						aria-selected="false">자주묻는질문</button>
				</li>
			</ul>
		</nav>



		<div class="tab-content contents" id="pills-tabContent">

			<div class="tab-pane fade show active" style="padding: 60px"
				id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
				<div class="accordion" id="accordionExample">
					<c:forEach var="vo" items="${list}" varStatus="vs" step="1" end="9">
						<c:set var="i" value="${i+30}" />

						<div class="accordion-item">
							<h2 class="accordion-header" id="heading${i}">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapse${i}"
									aria-expanded="false" aria-controls="collapse${i}">
									<div>
										<div>${vo.ntitle}</div>
										<div class="sm pp">
											<fmt:formatDate value="${vo.ndate}" pattern="yyyy-MM-dd" />
										</div>
									</div>
								</button>
							</h2>
							<div id="collapse${i}" class="accordion-collapse collapse"
								aria-labelledby="heading${i}" data-bs-parent="#accordionExample">
								<div class="accordion-body">${vo.ncontent}</div>
							</div>
						</div>

					</c:forEach>



				</div>



			</div>

			<div class="tab-pane fade  " id="pills-profile" role="tabpanel"
				aria-labelledby="pills-profile-tab">


				<div>
					<div
						style="margin-left: 20px; margin-right: 20px; height: 470px; border-bottom: 2px solid black; padding: 40px">
						<div
							style="float: left; height: 400px; width: 30%; text-align: left; padding-top: 10px;">
							<div style="font-size: 30px;">
								<small>이용 제재 / 3아웃 정책</small><br> "WY마켓 운영정책"
							</div>
						</div>
						<div style="float: left; height: 400px; width: 70%;">
							<ul class="lim">
								<li><span class="material-icons"> block </span>
									<div>"금지 품목 거래 시, 제재 받을 수 있어요"</div></li>
								<li><span class="material-icons"> sell </span>
									<div>"적절하지 않은 상품명, 이미지, 가격 등록 시에 제재 받을 수 있어요"</div></li>
								<li><span class="material-icons"> logout </span>
									<div>"외부 채널로의 연락 유도, 타 사이트로의 결제 유도 시 제재 받을 수 있어요"</div></li>
								<li><span class="material-icons">
										sentiment_very_dissatisfied </span>
									<div>"욕설, 성희롱 등 비매너 행위는 타인을 불쾌하게 해요"</div></li>
								<li><span class="material-icons"> chat </span>
									<div>"상품, 댓글, 번개톡에 도배는 안돼요"</div></li>

							</ul>
						</div>
					</div>

					<div
						style="margin-left: 20px; margin-right: 20px; height: 470px; padding: 40px; padding-top: 50px;">
						<div
							style="float: left; height: 400px; width: 30%; text-align: left;">
							<div style="font-size: 30px;">서비스 이용제한</div>
						</div>
						<div style="float: left; width: 70%;">
							<li
								style="list-style: none; padding-left: 55px; padding-bottom: 50px">
								<span class="material-icons"
								style="float: left; padding-right: 25px;">warning_amber</span>
								<div style="text-align: left;">위의 약속을 위배하는 경우 3아웃 정책으로 이용을
									제한합니다.</div>
							</li>

							<div>
								<div>
									<div
										style="padding-top: 20px; float: left; padding-left: 55px;">3아웃
										정책</div>
									<div
										style="padding-top: 20px; margin-left: 32px; padding-bottom: 20px; border-top: solid 1px black; border-bottom: solid 1px black;">제재
										내용</div>
								</div>

								<div>
									<div
										style="padding-top: 20px; float: left; padding-left: 80px;">
										<b>1차</b>
									</div>
									<div style="padding-top: 20px; padding-bottom: 30px;">물품
										삭제 / &nbsp;3일 이용제한</div>
								</div>
								<div>
									<div
										style="float: left; padding-left: 55px; padding-left: 80px;">
										<b>2차</b>
									</div>
									<div style="padding-bottom: 30px;">물품 삭제 / 15일 이용제한</div>
								</div>
								<div>
									<div
										style="float: left; padding-left: 55px; padding-left: 80px;">
										<b>3차</b>
									</div>
									<div style="padding-bottom: 30px;">물품 삭제 / 30일 이용제한</div>
								</div>
								<p
									style="padding-left: 45px; padding-top: 40px; text-align: left; color: orange; font-size: 15px;">
									※ 항목에 따라 사전 안내 없이 영구적으로 제한될 수 있습니다.</p>
							</div>

						</div>

					</div>
				</div>


			</div>



			<div class="tab-pane fade" style="padding: 60px" id="pills-contact"
				role="tabpanel" aria-labelledby="pills-contact-tab">
				<div class="" style="height: 150px;">
					<div class="nav nav-tabs cent" id="nav-tab" role="tablist">

						<button class="nav-link active hori" id="nav-1-tab"
							data-bs-toggle="tab" data-bs-target="#nav-1" type="button"
							role="tab" aria-controls="nav-1" aria-selected="true">상점/상품</button>
						<button class="nav-link hori" id="nav-2-tab" data-bs-toggle="tab"
							data-bs-target="#nav-2" type="button" role="tab"
							aria-controls="nav-2" aria-selected="false">거래</button>
						<button class="nav-link hori" id="nav-3-tab" data-bs-toggle="tab"
							data-bs-target="#nav-3" type="button" role="tab"
							aria-controls="nav-3" aria-selected="false">회원정보</button>
						<button class="nav-link hori" id="nav-4-tab" data-bs-toggle="tab"
							data-bs-target="#nav-4" type="button" role="tab"
							aria-controls="nav-4" aria-selected="false">제재정책</button>
						<button class="nav-link hori" id="nav-5-tab" data-bs-toggle="tab"
							data-bs-target="#nav-5" type="button" role="tab"
							aria-controls="nav-5" aria-selected="false">판매팁</button>
						<button class="nav-link hori" id="nav-6-tab" data-bs-toggle="tab"
							data-bs-target="#nav-6" type="button" role="tab"
							aria-controls="nav-6" aria-selected="false">분쟁해결기준</button>
						<button class="nav-link hori" id="nav-7-tab" data-bs-toggle="tab"
							data-bs-target="#nav-7" type="button" role="tab"
							aria-controls="nav-7" aria-selected="false">구매팁</button>
						<button class="nav-link hori" id="nav-8-tab" data-bs-toggle="tab"
							data-bs-target="#nav-8" type="button" role="tab"
							aria-controls="nav-8" aria-selected="false">광고서비스</button>
						<button class="nav-link hori" id="nav-9-tab" data-bs-toggle="tab"
							data-bs-target="#nav-9" type="button" role="tab"
							aria-controls="nav-9" aria-selected="false">기타</button>
					</div>


				</div>

				<div class="tab-content" id="nav-tabContent">

					<div class="tab-pane fade show active" id="nav-1" role="tabpanel"
						aria-labelledby="nav-1-tab">
						<div class="accordion" id="accordionExample">
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingOne">
									<button class="accordion-button" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseOne"
										aria-expanded="true" aria-controls="collapseOne">
										Accordion Item #1</button>
								</h2>
								<div id="collapseOne" class="accordion-collapse collapse show"
									aria-labelledby="headingOne" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<strong>This is the first item's accordion body.</strong> It
										1231
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingTwo">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo">
										Accordion Item #2</button>
								</h2>
								<div id="collapseTwo" class="accordion-collapse collapse"
									aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<strong>This is the second item's accordion body.</strong> It
										1234
									</div>
								</div>
							</div>
						</div>

					</div>
					<div class="tab-pane fade" id="nav-2" role="tabpanel"
						aria-labelledby="nav-2-tab">

						<div class="accordion" id="accordionExample">
							<div class="accordion-item">
								<h2 class="accordion-header" id="heading3">
									<button class="accordion-button" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapse3"
										aria-expanded="true" aria-controls="collapse3">
										Accordion Item #1</button>
								</h2>
								<div id="collapse3" class="accordion-collapse collapse show"
									aria-labelledby="heading3" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<strong>This is the first item's accordion body.</strong> It
										521
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="heading4">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapse4"
										aria-expanded="false" aria-controls="collapse4">
										Accordion Item #2</button>
								</h2>
								<div id="collapse4" class="accordion-collapse collapse"
									aria-labelledby="heading4" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<strong>This is the second item's accordion body.</strong> It
										5125
									</div>
								</div>
							</div>
						</div>


					</div>
					<div class="tab-pane fade" id="nav-3" role="tabpanel"
						aria-labelledby="nav-3-tab">

						<div class="accordion" id="accordionExample">
							<div class="accordion-item">
								<h2 class="accordion-header" id="heading5">
									<button class="accordion-button" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapse5"
										aria-expanded="true" aria-controls="collapse5">
										Accordion Item #1</button>
								</h2>
								<div id="collapse5" class="accordion-collapse collapse show"
									aria-labelledby="heading5" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<strong>This is the first item's accordion body.</strong> It
										5125
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="heading6">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapse6"
										aria-expanded="false" aria-controls="collapse6">
										Accordion Item #2</button>
								</h2>
								<div id="collapse6" class="accordion-collapse collapse"
									aria-labelledby="heading6" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<strong>This is the second item's accordion body.</strong> It
										5215
									</div>
								</div>
							</div>
						</div>


					</div>
					<div class="tab-pane fade" id="nav-4" role="tabpanel"
						aria-labelledby="nav-4-tab">444</div>
					<div class="tab-pane fade" id="nav-5" role="tabpanel"
						aria-labelledby="nav-5-tab">555</div>
					<div class="tab-pane fade" id="nav-6" role="tabpanel"
						aria-labelledby="nav-6-tab">666</div>
					<div class="tab-pane fade" id="nav-7" role="tabpanel"
						aria-labelledby="nav-7-tab">777</div>
					<div class="tab-pane fade" id="nav-8" role="tabpanel"
						aria-labelledby="nav-8-tab">888</div>
					<div class="tab-pane fade" id="nav-9" role="tabpanel"
						aria-labelledby="nav-9-tab">
						<div class="container" id='inquiryContainer'>
							<div class="container" id='inquiryContainerInner'>
								<p>검색과 관련된 궁금한 점이나 불편사항 개선할 점이 있으면 자유롭게 이야기해주세요. 소중한 의견
									감사합니다. &#128522</p>
								<p>※ 답변에는 시간이 소요됩니다. 조금만 기다려주세요 :)</p>
								<select class="form-select" id="inputGroupSelect01"
									name="inquirySelect">
									<option selected>문의 카테고리 검색</option>
									<option value="transaction">거래 환불/분쟁 및 사기 신고</option>
									<option value="account">계정 문의 (로그인, 인증, 제재, 탈퇴 등)</option>
									<option value="sale">판매 금지/거래 품목 문의</option>
									<option value="manner">매너평가, 매너온도, 거래후기 관련 문의</option>
									<option value="board">게시글 노출, 미노출 문의</option>
									<option value="chat">채팅, 알림</option>
									<option value="search">검색 문의</option>
									<option value="etc">기타 문의</option>
									<option value="error">오류 제보</option>
								</select>
								<textarea class="form-control" aria-label="With textarea"
									placeholder="문의하실 내용을 여기에 입력해주세요 :)"></textarea>
								<button class="btn btn-primary" type="submit" id='inquirybtn'>당근마켓팀에게
									보내기</button>
							</div>
						</div>
					</div>
				</div>




			</div>

		</div>


	</div>
	<hr>
	footer
	<script>
		var home = document.getElementById("pills-home-tab");
		var profile = document.getElementById("pills-profile-tab");
		var contact = document.getElementById("pills-contact-tab");

		<c:choose>

		<c:when test="${category eq 'a' }">
		home.click();
		</c:when>

		<c:when test="${category eq 'b' }">
		profile.click();
		</c:when>

		<c:otherwise>
		contact.click();
		</c:otherwise>

		</c:choose>
	</script>

</body>

</html>