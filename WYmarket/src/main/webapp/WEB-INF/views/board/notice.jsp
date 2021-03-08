<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<title>header</title>
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
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"
	crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<style>
* {
	box-sizing: border-box;
}
.dropbtn {
            background-color: rgb(224, 123, 40);
            color: white;
            padding: 16px;
            font-size: 16px;
            border: none;
            cursor: pointer;
            width: 100px;

        }

        .dropdown {
            position: relative;
            float: left;
            margin-right: 20px;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color: rgb(231, 149, 149);
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown:hover .dropbtn {
            background-color: #1b5ac2;
        }

        .logo {
            float: left;
            margin-right: 20px;
            margin-top: 20px;
        }

        .search {
            height: 48px;
            width: 450px;
            border: 2px solid #1b5ac2;
            background: #ffffff;
            margin-right: 0px;
            float: left;
            margin-right: 20px;
            margin-top: 20px;
        }

        .searchinput {
            font-size: 16px;
            width: 370px;
            padding: 10px;
            border: 0px;
            outline: blue;
            float: left;

        }

        .searchbtn {
            margin-left: 18px;
            width: 60px;
            height: 45px;
            border: 0px;
            background: #1b5ac2;
            outline: none;
            float: right;
            color: #ffffff;
            ;

        }

        .sale {
            color: #1b5ac2;;
            float: left;
            margin-top: 20px;
            margin-right: 20px;
        }

        .mypage {
            color: #1b5ac2;;
            float: left;
            margin-top: 20px;
              margin-right: 20px;
        }
	.chat{
	color: #1b5ac2;;
            float: left;
            margin-top: 20px;
	
	}
        .mid {
            font-size: 20px;
        }

        .big {
            font-size: 30px;
        }

        .biggest {
            font-size: 40px;
        }

        .navis { 
            width: 1130px;
            margin-left: auto;
            margin-right: auto;
            display: flex;
            flex-direction: row;
            flex-wrap: nowrap;
            justify-content: center; 
        }

        .head1 {
            width: 100%;
            background-color: rgb(241, 239, 235);
        }

        menu {
            margin: 0px;
            list-style: none;

        }

        .nick {
            position: relative;
            float: left;
            padding-right: 9px;
            width: 80px;
        }

        .search {
            display: flex;
            flex-direction: row;
            flex-wrap: nowrap;
        }

        .head2 {
            width: 1130px;
            display: flex;
            flex-direction: row;
            flex-wrap: nowrap;
            justify-content: flex-end; 
        }

         
        a{ 
            text-decoration: none;
            color: black;
        }

        .tt{
            
         padding: 15px;
             
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

#seeReplyBtn {
	margin-top: 30px;
	color: #fff;
	background-color: rgba(70, 70, 85, 1);
	border-color: rgba(70, 70, 85, 1);
}
 .foot{
          
            padding-top: 12px;
            width: 1130px;
            height: 50px;
            text-align: center; 
        }
</style>



</head>

<body>
  <article class="head1">
        <menu>
            <div class="head2 container-xl">
                <li class="nick"><strong>${userNick}</strong>님</li>
              
                <li id="kakaoLogout" class="logout">로그아웃</li>
            </div>
        </menu>
    </article>

    <div class="navis container-xl">

        <div class="dropdown">
            <button class="dropbtn"><i class="fas fa-bars fontsize big"></i><br>카테고리</button>
            <div class="dropdown-content">
                <a href="/wymarket/main?category=전체">전체</a>
                <a href="/wymarket/main?category=남성의류">남성의류</a>
                <a href="/wymarket/main?category=전자기기">전자기기</a>
                <a href="/wymarket/main?category=기타">기타</a>
            </div>
        </div>

        <a class="logo" href="/wymarket/main">
            <img src="<%=application.getContextPath() %>/image/wylogo.jpg" alt="" width="160" height="45">
        </a>
        
  <form action="/wymarket/main" method="get">
        <div class="search">
            <input class="searchinput" type="text" name="search" placeholder="검색어 입력">
            <button class="searchbtn"><i class="fas fa-search mid"></i></button>
        </div>
  </form>
  
        <a class="sale" href="/wymarket/goods/register"><i class="fas fa-won-sign biggest"></i></a>
        <a class="mypage" href=""><i class="fas fa-user biggest"></i></a>
		<a class="chat" href="/wymarket/chats/chatting"><i class="far fa-comments biggest"></i></a>
    </div>
<hr>
 
 
</body>
<script>
	 document.getElementById('kakaoLogout').addEventListener('click',()=>{
				ajaxLogOut();
 				setTimeout(function(){
					window.location.href = "https://kauth.kakao.com/oauth/logout?client_id=f5c99e47d61ce4b7e521d120e1f04199&logout_redirect_uri=http://localhost:8080/wymarket/login";
		        }, 1000); 
			});
		 
	</script>
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
							role="tab" aria-controls="nav-1" aria-selected="true">상품</button>
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

				<div style="text-align: left; "class="tab-content" id="nav-tabContent">

					<div class="tab-pane fade show active" id="nav-1" role="tabpanel"
						aria-labelledby="nav-1-tab">
						<div class="accordion" id="accordionExample">
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingOne">
									<button class="accordion-button" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseOne"
										aria-expanded="true" aria-controls="collapseOne">
										상품 판매는 어떻게 하나요?</button>
								</h2>
								<div id="collapseOne" class="accordion-collapse collapse show"
									aria-labelledby="headingOne" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										우측 상당에 원화 표시 선택 후 상품 등록하기
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingTwo">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo">
										내 상품이 판매완료 / 삭제 처리 됐어요</button>
								</h2>
								<div id="collapseTwo" class="accordion-collapse collapse"
									aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<strong>1. 상품 삭제 기준</strong> <br>
										- 거래금지품목(술,전자담배,계정,의약품 등)을 판매 등록한 경우<br>
										- 타 사이트 홍보 및 외부 url이 있는 경우<br>
										<strong>2. 상품 판매 완료 기준</strong> <br>
										- 운영정책 위반으로 상점이 차단된 경우 판매중인 상품은 판매완료로 변경<br>
										 
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingThree">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseThree"
										aria-expanded="false" aria-controls="collapseThree">
										좋아요는 무엇이고, 어떻게 하나요?</button>
								</h2>
								<div id="collapseThree" class="accordion-collapse collapse"
									aria-labelledby="headingThree" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										1. 찜이란<br>

- 관심 상품을 확인할 수 있도록 보관하는 기능으로서 상품페이지 > 찜하기 가능<br>


 

2. 찜한 상품을 보는 방법<br>


-앱 > 우측 상단의 하트 아이콘 > 찜리스트 확인 가능<br>


 

3. 찜 취소 방법<br>


- 찜한 상품의 상세페이지 > 찜 버튼을 한번 더 눌러 찜 해제 가능<br>

									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingFour">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseFour"
										aria-expanded="false" aria-controls="collapseFour">
										좋아요 취소는 어떻게 하나요?</button>
								</h2>
								<div id="collapseFour" class="accordion-collapse collapse"
									aria-labelledby="headingFour" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										찜하신 것을 취소하고 싶으신가요?<br>

찜 취소는 찜한 상품을 들어가 찜을 한 번 더 눌러주면 찜하신 것이 해제됩니다.
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingFive">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseFive"
										aria-expanded="false" aria-controls="collapseFive">
										사진 업로드 시 최적 사이즈</button>
								</h2>
								<div id="collapseFive" class="accordion-collapse collapse"
									aria-labelledby="headingFive" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<strong>[사진 업로드 시 최적 사이즈]</strong> 
									 

- 640*640 사이즈로 사진 등록 시 보다 깨끗한 사진 등록이 가능합니다.
									</div>
								</div>
							</div>
							
						</div>

					</div>
					<div class="tab-pane fade" id="nav-2" role="tabpanel"
						aria-labelledby="nav-2-tab">

						 	<div class="accordion" id="accordionExample">
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingOne">
									<button class="accordion-button" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseOne"
										aria-expanded="true" aria-controls="collapseOne">
										거래를 하면 안되는 것들은 어떤 것이 있나요?</button>
								</h2>
								<div id="collapseOne" class="accordion-collapse collapse show"
									aria-labelledby="headingOne" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										거래금지품목은 이용약관 및 현행 법률에 따라 즉시 삭제 및 계정 차단이 될 수 있으므로 운영정책을 참고하셔서 이용 부탁 드립니다.  

 

개인정보 : 개인정보를 사고파는 행위와 면허증, 허가증, 등록증 등을 위, 변조하는 행위는 형법에 따라 처벌받을 수 있습니다.<br>

예시) 주민등록증, 여권, 학생증, 수험표, 운전면허증, 대포통장, 듀얼폰, 듀얼넘버 등 <br>

 

온라인 개인 계정 : 개인 계정 및 인증번호를 통해 각종 피해가 발생되고 있어 번개장터 운영정책에 따라 제재 됩니다.<br>
예시) 카톡계정, 인스타 계정, 페이스북 계정, 네이버 계정, 카카오톡, 네이버, 페이스북 인증번호 등<br>



불법현금융통 : 정보통신망 이용촉진 및 정보보호등의 관한 법률 제 72조 통신과금을 이용해 매입하는 행위는 불법현금융통으로 제재 됩니다. <br>
예시) 불법 현금융통을 목적으로 한 모든 상품 (불법대출, 돈구해요, 개인돈빌려요, 리니지M등)<br>


허위매물 : 실물을 확보하지 않은 판매하는 행위는 번개장터 운영정책에 따라 제재 됩니다.  (※ 자동차 허위매물의 경우 증빙 시 해제 가능합니다.)<br>
예시) 백화점/문화 상품권 예약판매, 타 사이트 대리구매(배송지변경), 알바를 통한 상품 대리판매, 자동차 <br>

        
 
사행성 : 불법 도박 및 사행성 상품은 번개장터 운영정책에 따라 제재 됩니다.<br>
예시)토토, 카지노, 바카라, 화투, 포커, 한게임, 섯다, 바둑이, 홀덤, 세븐등 머니쿠폰, 전용장비, 라이브스코어인증 등

									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingTwo">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo">
										교환이나 환불은 어떻게 하나요?</button>
								</h2>
								<div id="collapseTwo" class="accordion-collapse collapse"
									aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<strong>교환/반품은 판매자와 협의 필요</strong> <br>
									중고상품은 개인간의 거래이므로 전자상거래법, 소비자보호법등이 적용되지 않습니다.<br>
										물품을 받으신 후 단순변심 또는 전달 받지 못한 하자가 확인되어 교환/반품을 원하실 경우, 판매자와 협의를 통해 진행 해 주시기 바랍니다. <br>
										 
										 
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingThree">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseThree"
										aria-expanded="false" aria-controls="collapseThree">
										반드시 체크해야할 거래사기 유형</button>
								</h2>
								<div id="collapseThree" class="accordion-collapse collapse"
									aria-labelledby="headingThree" data-bs-parent="#accordionExample">
									<div class="accordion-body">
									사기거래 패턴2. “안전 거래 링크 전달”<br>
판매자가 ‘링크’ 형태로 전달하는 안전거래(네이버페이, 번개페이 등)는 모두 피싱 사이트입니다.<br>
최근 사기범들이 즐겨 쓰는 수법은 카카오톡을 통해 안전거래 사칭 링크를 보내고 결제를 유도하는 것입니다.<br>
아래 사칭 링크 예시를 참고하시고, 절대 클릭하지 마세요!<br>

▶번개페이 사칭 링크: pay.bunjang123 등의 형태<br>
※ 번개페이 정상 거래 시 예금주 명은 '번개장터 주식회사' 입니다. (그 외 예금주는 모두 사칭 입니다.)<br>

									</div>
								</div>
							</div> 
							
						</div>


					</div>
					<div class="tab-pane fade" id="nav-3" role="tabpanel"
						aria-labelledby="nav-3-tab">

						 	<div class="accordion" id="accordionExample">
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingOne">
									<button class="accordion-button" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseOne"
										aria-expanded="true" aria-controls="collapseOne">
										본인인증 시 인증번호가 안와요</button>
								</h2>
								<div id="collapseOne" class="accordion-collapse collapse show"
									aria-labelledby="headingOne" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										우측 상당에 원화 표시 선택 후 상품 등록하기
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingTwo">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo">
										내 상품이 판매완료 / 삭제 처리 됐어요</button>
								</h2>
								<div id="collapseTwo" class="accordion-collapse collapse"
									aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<strong>1. 상품 삭제 기준</strong> <br>
										- 거래금지품목(술,전자담배,계정,의약품 등)을 판매 등록한 경우<br>
										- 타 사이트 홍보 및 외부 url이 있는 경우<br>
										<strong>2. 상품 판매 완료 기준</strong> <br>
										- 운영정책 위반으로 상점이 차단된 경우 판매중인 상품은 판매완료로 변경<br>
										 
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingThree">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseThree"
										aria-expanded="false" aria-controls="collapseThree">
										좋아요는 무엇이고, 어떻게 하나요?</button>
								</h2>
								<div id="collapseThree" class="accordion-collapse collapse"
									aria-labelledby="headingThree" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										1. 찜이란<br>

- 관심 상품을 확인할 수 있도록 보관하는 기능으로서 상품페이지 > 찜하기 가능<br>


 

2. 찜한 상품을 보는 방법<br>


-앱 > 우측 상단의 하트 아이콘 > 찜리스트 확인 가능<br>


 

3. 찜 취소 방법<br>


- 찜한 상품의 상세페이지 > 찜 버튼을 한번 더 눌러 찜 해제 가능<br>

									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingFour">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseFour"
										aria-expanded="false" aria-controls="collapseFour">
										개인정보 설정은 어떻게 하나요?</button>
								</h2>
								<div id="collapseFour" class="accordion-collapse collapse"
									aria-labelledby="headingFour" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										찜하신 것을 취소하고 싶으신가요?<br>

찜 취소는 찜한 상품을 들어가 찜을 한 번 더 눌러주면 찜하신 것이 해제됩니다.
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingFive">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseFive"
										aria-expanded="false" aria-controls="collapseFive">
										사진 업로드 시 최적 사이즈</button>
								</h2>
								<div id="collapseFive" class="accordion-collapse collapse"
									aria-labelledby="headingFive" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<strong>[사진 업로드 시 최적 사이즈]</strong> 
									 

- 640*640 사이즈로 사진 등록 시 보다 깨끗한 사진 등록이 가능합니다.
									</div>
								</div>
							</div>
							
						</div>


					</div>
					<div class="tab-pane fade" id="nav-4" role="tabpanel"
						aria-labelledby="nav-4-tab">	<div class="accordion" id="accordionExample">
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingOne">
									<button class="accordion-button" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseOne"
										aria-expanded="true" aria-controls="collapseOne">
										사진 업로드 시 최적 사이즈</button>
								</h2>
								<div id="collapseOne" class="accordion-collapse collapse show"
									aria-labelledby="headingOne" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										우측 상당에 원화 표시 선택 후 상품 등록하기
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingTwo">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo">
										내 상품이 판매완료 / 삭제 처리 됐어요</button>
								</h2>
								<div id="collapseTwo" class="accordion-collapse collapse"
									aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<strong>1. 상품 삭제 기준</strong> <br>
										- 거래금지품목(술,전자담배,계정,의약품 등)을 판매 등록한 경우<br>
										- 타 사이트 홍보 및 외부 url이 있는 경우<br>
										<strong>2. 상품 판매 완료 기준</strong> <br>
										- 운영정책 위반으로 상점이 차단된 경우 판매중인 상품은 판매완료로 변경<br>
										 
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingThree">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseThree"
										aria-expanded="false" aria-controls="collapseThree">
										개인정보 설정은 어떻게 하나요?</button>
								</h2>
								<div id="collapseThree" class="accordion-collapse collapse"
									aria-labelledby="headingThree" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										1. 찜이란<br>

- 관심 상품을 확인할 수 있도록 보관하는 기능으로서 상품페이지 > 찜하기 가능<br>


 

2. 찜한 상품을 보는 방법<br>


-앱 > 우측 상단의 하트 아이콘 > 찜리스트 확인 가능<br>


 

3. 찜 취소 방법<br>


- 찜한 상품의 상세페이지 > 찜 버튼을 한번 더 눌러 찜 해제 가능<br>

									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingFour">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseFour"
										aria-expanded="false" aria-controls="collapseFour">
										좋아요 취소는 어떻게 하나요?</button>
								</h2>
								<div id="collapseFour" class="accordion-collapse collapse"
									aria-labelledby="headingFour" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										찜하신 것을 취소하고 싶으신가요?<br>

찜 취소는 찜한 상품을 들어가 찜을 한 번 더 눌러주면 찜하신 것이 해제됩니다.
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingFive">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseFive"
										aria-expanded="false" aria-controls="collapseFive">
										사진 업로드 시 최적 사이즈</button>
								</h2>
								<div id="collapseFive" class="accordion-collapse collapse"
									aria-labelledby="headingFive" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<strong>[사진 업로드 시 최적 사이즈]</strong> 
									 

- 640*640 사이즈로 사진 등록 시 보다 깨끗한 사진 등록이 가능합니다.
									</div>
								</div>
							</div>
							
						</div></div>
					<div class="tab-pane fade" id="nav-5" role="tabpanel"
						aria-labelledby="nav-5-tab">	<div class="accordion" id="accordionExample">
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingOne">
									<button class="accordion-button" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseOne"
										aria-expanded="true" aria-controls="collapseOne">
										좋아요는 무엇이고, 어떻게 하나요?</button>
								</h2>
								<div id="collapseOne" class="accordion-collapse collapse show"
									aria-labelledby="headingOne" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										우측 상당에 원화 표시 선택 후 상품 등록하기
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingTwo">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo">
										내 상품이 판매완료 / 삭제 처리 됐어요</button>
								</h2>
								<div id="collapseTwo" class="accordion-collapse collapse"
									aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<strong>1. 상품 삭제 기준</strong> <br>
										- 거래금지품목(술,전자담배,계정,의약품 등)을 판매 등록한 경우<br>
										- 타 사이트 홍보 및 외부 url이 있는 경우<br>
										<strong>2. 상품 판매 완료 기준</strong> <br>
										- 운영정책 위반으로 상점이 차단된 경우 판매중인 상품은 판매완료로 변경<br>
										 
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingThree">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseThree"
										aria-expanded="false" aria-controls="collapseThree">
										좋아요는 무엇이고, 어떻게 하나요?</button>
								</h2>
								<div id="collapseThree" class="accordion-collapse collapse"
									aria-labelledby="headingThree" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										1. 찜이란<br>

- 관심 상품을 확인할 수 있도록 보관하는 기능으로서 상품페이지 > 찜하기 가능<br>


 

2. 찜한 상품을 보는 방법<br>


-앱 > 우측 상단의 하트 아이콘 > 찜리스트 확인 가능<br>


 

3. 찜 취소 방법<br>


- 찜한 상품의 상세페이지 > 찜 버튼을 한번 더 눌러 찜 해제 가능<br>

									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingFour">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseFour"
										aria-expanded="false" aria-controls="collapseFour">
										좋아요 취소는 어떻게 하나요?</button>
								</h2>
								<div id="collapseFour" class="accordion-collapse collapse"
									aria-labelledby="headingFour" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										찜하신 것을 취소하고 싶으신가요?<br>

찜 취소는 찜한 상품을 들어가 찜을 한 번 더 눌러주면 찜하신 것이 해제됩니다.
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingFive">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseFive"
										aria-expanded="false" aria-controls="collapseFive">
										사진 업로드 시 최적 사이즈</button>
								</h2>
								<div id="collapseFive" class="accordion-collapse collapse"
									aria-labelledby="headingFive" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<strong>[사진 업로드 시 최적 사이즈]</strong> 
									 

- 640*640 사이즈로 사진 등록 시 보다 깨끗한 사진 등록이 가능합니다.
									</div>
								</div>
							</div>
							
						</div></div>
					<div class="tab-pane fade" id="nav-6" role="tabpanel"
						aria-labelledby="nav-6-tab">	<div class="accordion" id="accordionExample">
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingOne">
									<button class="accordion-button" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseOne"
										aria-expanded="true" aria-controls="collapseOne">
										14세 미만은 가입이 불가한가요?</button>
								</h2>
								<div id="collapseOne" class="accordion-collapse collapse show"
									aria-labelledby="headingOne" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										우측 상당에 원화 표시 선택 후 상품 등록하기
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingTwo">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo">
										내 상품이 판매완료 / 삭제 처리 됐어요</button>
								</h2>
								<div id="collapseTwo" class="accordion-collapse collapse"
									aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<strong>1. 상품 삭제 기준</strong> <br>
										- 거래금지품목(술,전자담배,계정,의약품 등)을 판매 등록한 경우<br>
										- 타 사이트 홍보 및 외부 url이 있는 경우<br>
										<strong>2. 상품 판매 완료 기준</strong> <br>
										- 운영정책 위반으로 상점이 차단된 경우 판매중인 상품은 판매완료로 변경<br>
										 
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingThree">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseThree"
										aria-expanded="false" aria-controls="collapseThree">
										좋아요는 무엇이고, 어떻게 하나요?</button>
								</h2>
								<div id="collapseThree" class="accordion-collapse collapse"
									aria-labelledby="headingThree" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										1. 찜이란<br>

- 관심 상품을 확인할 수 있도록 보관하는 기능으로서 상품페이지 > 찜하기 가능<br>


 

2. 찜한 상품을 보는 방법<br>


-앱 > 우측 상단의 하트 아이콘 > 찜리스트 확인 가능<br>


 

3. 찜 취소 방법<br>


- 찜한 상품의 상세페이지 > 찜 버튼을 한번 더 눌러 찜 해제 가능<br>

									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingFour">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseFour"
										aria-expanded="false" aria-controls="collapseFour">
										여러개의 계정을 만들수 있나요?</button>
								</h2>
								<div id="collapseFour" class="accordion-collapse collapse"
									aria-labelledby="headingFour" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										찜하신 것을 취소하고 싶으신가요?<br>

찜 취소는 찜한 상품을 들어가 찜을 한 번 더 눌러주면 찜하신 것이 해제됩니다.
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingFive">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseFive"
										aria-expanded="false" aria-controls="collapseFive">
										14세 미만은 가입이 불가한가요?</button>
								</h2>
								<div id="collapseFive" class="accordion-collapse collapse"
									aria-labelledby="headingFive" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<strong>[사진 업로드 시 최적 사이즈]</strong> 
									 

- 640*640 사이즈로 사진 등록 시 보다 깨끗한 사진 등록이 가능합니다.
									</div>
								</div>
							</div>
							
						</div></div>
					<div class="tab-pane fade" id="nav-7" role="tabpanel"
						aria-labelledby="nav-7-tab">	<div class="accordion" id="accordionExample">
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingOne">
									<button class="accordion-button" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseOne"
										aria-expanded="true" aria-controls="collapseOne">
										휴면계정 해제는 어떻게 하나요?</button>
								</h2>
								<div id="collapseOne" class="accordion-collapse collapse show"
									aria-labelledby="headingOne" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										우측 상당에 원화 표시 선택 후 상품 등록하기
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingTwo">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo">
										본인인증 시 인증번호가 안와요</button>
								</h2>
								<div id="collapseTwo" class="accordion-collapse collapse"
									aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<strong>1. 상품 삭제 기준</strong> <br>
										- 거래금지품목(술,전자담배,계정,의약품 등)을 판매 등록한 경우<br>
										- 타 사이트 홍보 및 외부 url이 있는 경우<br>
										<strong>2. 상품 판매 완료 기준</strong> <br>
										- 운영정책 위반으로 상점이 차단된 경우 판매중인 상품은 판매완료로 변경<br>
										 
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingThree">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseThree"
										aria-expanded="false" aria-controls="collapseThree">
										개인정보 설정은 어떻게 하나요?</button>
								</h2>
								<div id="collapseThree" class="accordion-collapse collapse"
									aria-labelledby="headingThree" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										1. 찜이란<br>

- 관심 상품을 확인할 수 있도록 보관하는 기능으로서 상품페이지 > 찜하기 가능<br>


 

2. 찜한 상품을 보는 방법<br>


-앱 > 우측 상단의 하트 아이콘 > 찜리스트 확인 가능<br>


 

3. 찜 취소 방법<br>


- 찜한 상품의 상세페이지 > 찜 버튼을 한번 더 눌러 찜 해제 가능<br>

									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingFour">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseFour"
										aria-expanded="false" aria-controls="collapseFour">
										계정도용 시 신고는 어떻게 진행해야 하나요?</button>
								</h2>
								<div id="collapseFour" class="accordion-collapse collapse"
									aria-labelledby="headingFour" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										찜하신 것을 취소하고 싶으신가요?<br>

찜 취소는 찜한 상품을 들어가 찜을 한 번 더 눌러주면 찜하신 것이 해제됩니다.
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingFive">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseFive"
										aria-expanded="false" aria-controls="collapseFive">
										사기를 당하면 어떻게 처리하나요?</button>
								</h2>
								<div id="collapseFive" class="accordion-collapse collapse"
									aria-labelledby="headingFive" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<strong>[사진 업로드 시 최적 사이즈]</strong> 
									 

- 640*640 사이즈로 사진 등록 시 보다 깨끗한 사진 등록이 가능합니다.
									</div>
								</div>
							</div>
							
						</div></div>
					<div class="tab-pane fade" id="nav-8" role="tabpanel"
						aria-labelledby="nav-8-tab">	<div class="accordion" id="accordionExample">
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingOne">
									<button class="accordion-button" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseOne"
										aria-expanded="true" aria-controls="collapseOne">
										제재를 받는 경우</button>
								</h2>
								<div id="collapseOne" class="accordion-collapse collapse show"
									aria-labelledby="headingOne" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										우측 상당에 원화 표시 선택 후 상품 등록하기
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingTwo">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo">
										개인정보 설정은 어떻게 하나요?</button>
								</h2>
								<div id="collapseTwo" class="accordion-collapse collapse"
									aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<strong>1. 상품 삭제 기준</strong> <br>
										- 거래금지품목(술,전자담배,계정,의약품 등)을 판매 등록한 경우<br>
										- 타 사이트 홍보 및 외부 url이 있는 경우<br>
										<strong>2. 상품 판매 완료 기준</strong> <br>
										- 운영정책 위반으로 상점이 차단된 경우 판매중인 상품은 판매완료로 변경<br>
										 
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingThree">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseThree"
										aria-expanded="false" aria-controls="collapseThree">
										구매하기</button>
								</h2>
								<div id="collapseThree" class="accordion-collapse collapse"
									aria-labelledby="headingThree" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										1. 찜이란<br>

- 관심 상품을 확인할 수 있도록 보관하는 기능으로서 상품페이지 > 찜하기 가능<br>


 

2. 찜한 상품을 보는 방법<br>


-앱 > 우측 상단의 하트 아이콘 > 찜리스트 확인 가능<br>


 

3. 찜 취소 방법<br>


- 찜한 상품의 상세페이지 > 찜 버튼을 한번 더 눌러 찜 해제 가능<br>

									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingFour">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseFour"
										aria-expanded="false" aria-controls="collapseFour">
										연락하기</button>
								</h2>
								<div id="collapseFour" class="accordion-collapse collapse"
									aria-labelledby="headingFour" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										찜하신 것을 취소하고 싶으신가요?<br>

찜 취소는 찜한 상품을 들어가 찜을 한 번 더 눌러주면 찜하신 것이 해제됩니다.
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingFive">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseFive"
										aria-expanded="false" aria-controls="collapseFive">
										상품 선택</button>
								</h2>
								<div id="collapseFive" class="accordion-collapse collapse"
									aria-labelledby="headingFive" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<strong>[사진 업로드 시 최적 사이즈]</strong> 
									 

- 640*640 사이즈로 사진 등록 시 보다 깨끗한 사진 등록이 가능합니다.
									</div>
								</div>
							</div>
							
						</div></div>
					<div class="tab-pane fade" id="nav-9" role="tabpanel"
						aria-labelledby="nav-9-tab">
						<form action="<%=application.getContextPath()%>/admin/sendInquiry"
							id='form'>
							<div class="container" id='inquiryContainer'>
								<div class="container" id='inquiryContainerInner'>
									<p>검색과 관련된 궁금한 점이나 불편사항 개선할 점이 있으면 자유롭게 이야기해주세요. 소중한 의견
										감사합니다. &#128522</p>
									<p>※ 답변에는 시간이 소요됩니다. 조금만 기다려주세요 :)</p>
									<select class="form-select" id="inputGroupSelect01"
										name="inquirySelect" form='form'>
										<option selected>문의 카테고리 검색</option>
										<option value="거래 환불/분쟁 및 사기 신고">거래 환불/분쟁 및 사기 신고</option>
										<option value="계정 문의 (로그인, 인증, 제재, 탈퇴 등)">계정 문의 (로그인, 인증, 제재, 탈퇴 등)</option>
										<option value="판매 금지/거래 품목 문의">판매 금지/거래 품목 문의</option>
										<option value="매너평가, 매너온도, 거래후기 관련 문의">매너평가, 매너온도, 거래후기 관련 문의</option>
										<option value="게시글 노출, 미노출 문의">게시글 노출, 미노출 문의</option>
										<option value="채팅, 알림">채팅, 알림</option>
										<option value="검색 문의">검색 문의</option>
										<option value="기타 문의">기타 문의</option>
										<option value="오류 제보">오류 제보</option>
									</select>
									<textarea class="form-control" aria-label="With textarea"
										placeholder="문의하실 내용을 여기에 입력해주세요 :)" name="textArea"
										id='textArea'></textarea>
									<button class="btn btn-primary" type="button" id='inquirybtn'
										onclick="send()">당근마켓팀에게 보내기</button>
								</div>
							</div>
						</form>
						<button type="button" class="btn btn-primary" id='seeReplyBtn'
							onclick="location.href='<%=application.getContextPath()%>/admin/seeInquiryFromAdmin';">
							답장 보기
							<c:if test="${adminToUserCount ne 0}">
								<span class="badge bg-secondary">${adminToUserCount }</span>
							</c:if>
						</button>
					</div>
				</div>




			</div>

		</div>


	</div>
	<hr>
<footer class="foot container-xl "> 
    
       │<a class="tt" href="/wymarket/board/notice/a"><b>공지사항</b></a>
       │<a class="tt" href="/wymarket/board/notice/b"><b>운영정책</b></a>
       │<a class="tt" href="/wymarket/board/notice/c"><b>자주묻는질문</b></a>
       │<a class="tt" href="/wymarket/board/operationTerms"><b>이용약관</b></a>
       │<a class="tt" href="/wymarket/board/privacyPolicy"><b>개인정보처리방침</b></a>│
    </footer>
    <hr>

	<script
		src="<%=application.getContextPath()%>/resources/assets/js/notice.js"></script>

	<script>

		var home = document.getElementById("pills-home-tab");
		var profile = document.getElementById("pills-profile-tab");
		var contact = document.getElementById("pills-contact-tab");
		const inquiry = document.getElementById('nav-9-tab');

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

		if ("${inquiryFlag}" == 1) {
			inquiry.click();
	<%session.removeAttribute("inquiryFlag");%>
		}
		
/* 		window.onpageshow = function(event) {
			if (event.persisted || window.performance.navigation.type == 2) {
				window.location.href = '/wymarket/board/notice/c';
			}
		} */
	</script>

</body>

</html>