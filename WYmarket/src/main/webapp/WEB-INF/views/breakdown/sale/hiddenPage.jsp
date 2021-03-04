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

<%@ include file="/WEB-INF/views/breakdown/incloud/font_css.jspf"%>
<script src="https://kit.fontawesome.com/6421ed9b05.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/breakdown.css">

<style type="text/css">
.cDisabled {
	pointer-events: none;
	opacity: 0.6;
}
</style>

</head>
<body>
	<div id="grid_2" class="div">
	<input type="text" value="${success}" id="success"
				style="display: none;">
				
		<header
			style="padding: 20px; text-align: center; font-family: 'Akaya Kanadaka', cursive; font-size: 40px; font-size: 40px; padding-left: 40px;"
			class="titlefont">숨김 상품</header>
		<main>
		<div id="mainDiv">								
				<ul class="list-inline firstli">
					<li class="list-inline-item menutitle"><button id="salebtn"
							onclick="location.href = '<%=application.getContextPath()%>/param/sale'" class="">판매중</button></li>
					<li class="list-inline-item menutitle"><button
							id="completedbtn"
							onclick="location.href = '<%=application.getContextPath()%>/param/salecomplete'">거래완료</button></li>
					<li class="list-inline-item menutitle"><button
							onclick="location.href = '<%=application.getContextPath()%>/param/salehidden'" style="border-bottom: 2px solid black;">숨김</button></li>
				</ul>
				
						<div style="text-align: right; font-size: 22px; margin: 10px;">
					<div class="btn-group" role="group">
						<button id="btnGroupDrop1" type="button" class="btn"
							data-bs-toggle="dropdown" aria-expanded="false"
							style="box-shadow: 0 0 0 0;">
							<i class="fas fa-ellipsis-h"></i>
						</button>
						<ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">
							<li id="productChoice" class="cDisabled"><div
									class="dropdown-item" onclick="productChoice()">거래상품 선택</div></li>
							<li id="ReservationChoise" class="cDisabled"><div
									class="dropdown-item" onclick="ReservationChoise()">상품예약</div></li>
							<li id="hideenChoice" value="숨기기" class="cDisabled"><div
									class="dropdown-item" onclick="hideenChoice()">상품 숨기기</div></li>
							<li id="pullUp" class="cDisabled"><div class="dropdown-item"
									onclick="pullUp()">끌어올리기</div></li>
						</ul>
					</div>
				</div>
				
				
			<c:forEach var="userItem_list" items="${itemvo }">
				<c:if test="${userItem_list.istate eq 'Hidden'}">
					<!--  거래완료 내역 -->
					<div class="shadow shadow-strong completed" style="padding: 15px 5px; border-radius: 1rem;">
						<input type="radio" class="" name="itemid"
							value="${userItem_list.itemid }" style="display: none" />
						${userItem_list.itemid } <br> <input type="radio" class=""
							name="ititle" value="${userItem_list.ititle }"
							style="display: none" /> 제목: ${userItem_list.ititle } <br>
						지역: ${userItem_list.address }<br> 가격: ${userItem_list.price }
					</div>
					<br>
				</c:if>
				<!-- 거래완료 내역 end -->
			</c:forEach>
			<br>
			<button onclick="hiddenCancellations()" id="HiddenCancellation">숨기기
				취소</button>
			<button
				onclick="location.href = '<%=application.getContextPath() %>/param/test01'">My
				Page</button>
		</div>
		</main>
	</div>


	<script type="text/javascript">
var radio_btn = document.getElementsByName("ititle");
var idradio_btn = document.getElementsByName("itemid");
var hiddenCancellation = document.getElementsByName("HiddenCancellation").value;
var radio_btn_check = 0;
var istate;

if(radio_btn.length == 0){
	document.getElementById("HiddenCancellation").style.display = 'none';	
}
for( var i = 0; i < radio_btn.length; i++ ){  		
	radio_btn[i].style.display = 'block';
}	

function hiddenCancellations() {
	istate = 'Onsale';
    for(var i = 0; i<radio_btn.length; i++){
        if(radio_btn[i].checked==true){
        idradio_btn[i].checked=true;
var form = document.createElement("form");
form.setAttribute("method", "post");
form.setAttribute("action", "<%=application.getContextPath() %>/param/salehidden/" + istate + "/" + radio_btn[i].value + "/" + idradio_btn[i].value);
document.body.appendChild(form);  
radio_btn_check++;    
form.submit();
 alert("정상적으로 상품 숨기기 취소 처리되었습니다.");		
        }
    }
    if(radio_btn_check==0){
        alert("상품을 선택해주세요");
        return;
    }
}

var success = document.getElementById("success");
console.log(success.value + "확인");

if(success.value == 'success'){
	location.href = '<%=application.getContextPath() %>/param/sale';
	}

</script>

</body>
</html>