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

<%@ include file="/WEB-INF/views/breakdown/incloud/font_css.jspf"%>

<script src="https://kit.fontawesome.com/6421ed9b05.js"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/breakdown.css">
<link rel="stylesheet"
	href=" https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css">



</head>
<body>

	<div id="grid_2" class="div">
		<header
			style="padding: 20px; text-align: center; font-family: 'Akaya Kanadaka', cursive; font-size: 40px;" class = "titlefont">판매내역</header>
		<main>
			<div id="mainDiv">
				<ul class="list-inline firstli">
					<li class="list-inline-item menutitle "><button id="salebtn"
							class="shadow--sm " onclick="location.href = '<%=application.getContextPath()%>/param/sale'"
							style="border-bottom: 2px solid black;">판매중</button></li>
					<li class="list-inline-item menutitle"><button
							id="completedbtn" class="shadow--sm "
							onclick="location.href = '<%=application.getContextPath() %>/param/salecomplete'">거래완료</button></li>
					<li class="list-inline-item menutitle"><button
							class="shadow--sm"
							onclick="location.href = '<%=application.getContextPath() %>/param/salehidden'">숨김</button></li>
				</ul>

				<div style="text-align: right; font-size: 22px; margin: 10px;">
					<div class="btn-group" role="group">
						<button id="btnGroupDrop1" type="button" class="btn"
							data-bs-toggle="dropdown" aria-expanded="false"
							style="box-shadow: 0 0 0 0;">
							<i class="fas fa-ellipsis-h"></i>
						</button>						
						<ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">
							<li id="productChoice" class="disabled"><div
									class="dropdown-item" onclick="productChoice()">거래상품 선택</div></li>
							<li id="ReservationChoise" class="disabled"><div
									class="dropdown-item" onclick="ReservationChoise()">상품예약</div></li>
							<li id="hideenChoice" value="숨기기" class="disabled"><div
									class="dropdown-item" onclick="hideenChoice()">상품 숨기기</div></li>
							<li id="pullUp" class="disabled"><div class="dropdown-item"
									onclick="pullUp()">끌어올리기</div></li>
							<li id="productDeleteChoise" class="disabled"><div class="dropdown-item"
									onclick="productDeleteChoise()">상품 삭제하기</div></li>
						</ul>
					</div>
				</div>


				<c:forEach var="userItem_list" items="${itemvo }">
					<c:if test="${userItem_list.istate eq 'Onsale'}">
						<!--  판매중 내역 -->
 			
							<div class="shadow shadow-strong completed"
							style="padding: 15px 5px; border-radius: 1rem;">
							
							<span> 제목: ${userItem_list.ititle } </span>
							
 							<input type="checkbox"
								onclick="openModal()" name="ititle"
								value="${userItem_list.ititle }" style="display: none;" id ="titleRadio"/>															   							   
							

							<span>ID: ${userItem_list.itemid }</span> <br> 
							<span>현재날짜와 등록된 날짜 차 값(초):${userItem_list.refreshTime}</span> <br>
							<c:choose>
					
								<c:when
									test="${userItem_list.refreshTime >= 0 && userItem_list.refreshTime < 60}">
									<span>${userItem_list.refreshTime}초 전</span>
									<br>
								</c:when>

								<c:when
									test="${userItem_list.refreshTime >= 60 && userItem_list.refreshTime < 3600}">
									<fmt:parseNumber var="percent"
										value="${((userItem_list.refreshTime) / 60)}"
										integerOnly="true" />
									<span>${percent}분 전</span>
									<br>
								</c:when>

								<c:when
									test="${userItem_list.refreshTime >= 3600 && userItem_list.refreshTime < 86400}">
									<fmt:parseNumber var="percent"
										value="${((userItem_list.refreshTime) / 3600)}"
										integerOnly="true" />
									<span>${percent}시간 전</span>
									<br>
								</c:when>

								<c:when
									test="${userItem_list.refreshTime >= 86400 && userItem_list.refreshTime < 2764800} ">
									<fmt:parseNumber var="percent"
										value="${((userItem_list.refreshTime) / 86400)}"
										integerOnly="true" />
									<span>${percent }일 전</span>
									<br>
								</c:when>


								<c:when
									test="${userItem_list.refreshTime >= 86400 && userItem_list.refreshTime < 2764800}">
									<fmt:parseNumber var="percent"
										value="${((userItem_list.refreshTime) / 86400)}"
										integerOnly="true" />
									<span>${percent}일 전</span>
									<br>
								</c:when>


								<c:when
									test="${userItem_list.refreshTime >= 2678400 && userItem_list.refreshTime < 32140800}">
									<fmt:parseNumber var="percent"
										value="${((userItem_list.refreshTime) / 2678400)}"
										integerOnly="true" />
									<span>${percent }달 전</span>
									<br>
								</c:when>
								<c:when test="${userItem_list.refreshTime >= 32140800}">
									<fmt:parseNumber var="percent"
										value="${((userItem_list.refreshTime) / 32140800)}"
										integerOnly="true" />
									<span>${percent }년 전 </span>
									<br>
								</c:when>
							</c:choose>

							<input type="radio" value="${userItem_list.itemid }"
								name="itemid" style="display: none"> 
							



							<c:if test="${userItem_list.ireservationstate eq 'Yreservation'}">
								<span>예약중</span>
							</c:if>
							 <span>지역:
								${userItem_list.address }</span> <br> <span>가격:
								${userItem_list.price }</span> <br>
						
								
						</div>
						<br>
					</c:if>
					<!-- 판매중 내역 end -->
				</c:forEach>

				<div>
					<button onclick="TransactionCompleted()" style="display: none;"
						id="TransactionCompleted">거래완료</button>
					<button onclick="ProductHideen()" style="display: none;"
						id="ProductHideen">상품 숨기기</button>
					<button onclick="pullUpChoise()" id="pullUpChoise"
						style="display: none">끌어 올리기</button>
					<button onclick="ProductReservationY()" style="display: none;"
						id="ProductReservationY" value="Yreservation">예약중으로 변경</button>
					<button onclick="ProductReservationN()" style="display: none;"
						id="ProductReservationN" value="Nreservation">예약중으로 취소</button>
					<button onclick="ProductDelete()" style="display: none;"
						id="ProductDelete">상품 삭제하기</button>
					<button
						onclick="location.href = '<%=application.getContextPath() %>/param/test01'">My
						Page</button>
				</div>

				<c:forEach var="userinfo_list" items="${userinfo }">
					<input type="hidden" name="userNcik"
						value="${userinfo_list.usernick }" style="display: none;">
				</c:forEach>

				<div class="modal hidden" style="text-align: center;">
					<div class="bg modalDiv" id="bg"></div>
					<div
						class="modalBox border border-warning p-3 mb-2 bg-secondary text-white">
						<button id="modalCloseBtn" class="modalCloseBtn ">
							<i class="fas fa-times"></i>
						</button>
						<span class="titlefont" style="padding: 10px;">구매자 닉네임</span> <br>
						<input type="text" id="nickCheck" name="nickCheck"
							autocomplete="off"
							style="font-family: 'IBM Plex Sans', sans-serif;" />
						<button id="modalCheck" class="modalCheck"
							onclick="checkCloseModal()">확인</button>
					</div>
				</div>
			</div>
		



		</main>
	</div>

	<script type="text/javascript"
		src="<%=application.getContextPath()%>/resources/assets/js/breakdown_sale.js"></script>
	<script>
  //판매내역에 보여지는 거래상품 버튼 클릭 시 생성되는 거래완료 버튼 이벤트
    function TransactionCompleted() {
    	istate = 'Completed';
        for(var i = 0; i<radio_btn.length; i++){
            if(radio_btn[i].checked==true){ // Title값
            idradio_btn[i].checked=true; // ID값
    var form = document.createElement("form");
    form.setAttribute("method", "post");   
    form.setAttribute("action", "<%=application.getContextPath() %>/param/salecomplete/" + radio_btn[i].value +"/" + nickCheck.value +"/" + istate + "/" + idradio_btn[i].value);
    document.body.appendChild(form);
    radio_btn_check++;    
    form.submit();    
     alert("정상적으로 거래완료 처리가 되었습니다.");		
            }
        }      
        if(radio_btn_check==0){
            alert("상품을 선택해주세요");
            return;
        }
    }
  
  //판매내역에 보여지는 숨기기 버튼 클릭 시 생성되는 상품숨기기 버튼 이벤트
    function ProductHideen() {
    	istate = 'Hidden';
        for(var i = 0; i<radio_btn.length; i++){
            if(radio_btn[i].checked==true){  
            	 idradio_btn[i].checked=true;
    var form = document.createElement("form");
    form.setAttribute("method", "post");
    form.setAttribute("action", "<%=application.getContextPath() %>/param/salehidden/" + istate + "/" + radio_btn[i].value + "/" + idradio_btn[i].value);
    document.body.appendChild(form);  
    radio_btn_check++;    
    form.submit();
     alert("정상적으로 상품 숨기기 처리되었습니다.");		
            }
        }
        if(radio_btn_check==0){
            alert("상품을 선택해주세요");
            return;
        }
    }  
	
    //판매내역에 보여지는 예약 버튼 클릭 시 생성되는 예약하기 버튼 이벤트
    function ProductReservationY() {   	
        for(var i = 0; i<radio_btn.length; i++){
            if(radio_btn[i].checked==true){  
            	idradio_btn[i].checked=true;
    var form = document.createElement("form");
    form.setAttribute("method", "post");
    form.setAttribute("action", "<%=application.getContextPath() %>/param/reservation/"+ productReservationY + "/" + radio_btn[i].value + "/" + idradio_btn[i].value);  
    document.body.appendChild(form);  
    radio_btn_check++;    
    form.submit();
     alert("정상적으로 예약중 처리되었습니다.");		
            }
        }      
        if(radio_btn_check==0){
            alert("상품을 선택해주세요");
            return;
        }
    }
	
  //판매내역에 보여지는 예약 버튼 클릭 시 생성되는 예약취소 버튼 이벤트
    function ProductReservationN() {  	   
        for(var i = 0; i<radio_btn.length; i++){
            if(radio_btn[i].checked==true){           	           	     		
    var form = document.createElement("form");
    form.setAttribute("method", "post");
    form.setAttribute("action", "<%=application.getContextPath() %>/param/reservation/"+ productReservationN + "/" + radio_btn[i].value);  
    document.body.appendChild(form);  
    radio_btn_check++;    
    form.submit();
     alert("정상적으로 예약중 취소 처리되었습니다.");		
            }
        }      
        if(radio_btn_check==0){
            alert("상품을 선택해주세요");
            return;
        }
    } 
 	
  //판매내역에 보여지는 상품끌어올리기 버튼 클릭 시 생성되는 상품끌어올리기 버튼 이벤트
	 function pullUpChoise() {
		 istate = 'Onsale';
		 for(var i = 0; i<radio_btn.length; i++){
	            if(radio_btn[i].checked==true){  
	            	idradio_btn[i].checked=true;
	    var form = document.createElement("form");
	    form.setAttribute("method", "post");
	    form.setAttribute("action", "<%=application.getContextPath() %>/param/pullup/"+ radio_btn[i].value + "/" + idradio_btn[i].value + "/" + istate);  
	    document.body.appendChild(form);  
	    radio_btn_check++; 	    
	    form.submit();
	     alert("정상적으로 해당 상품이 끌어올리기 되었습니다.");		
	            }
	        }      
	        if(radio_btn_check==0){
	            alert("상품을 선택해주세요");
	            return;
	        }
	}
  
  function ProductDelete() {
	  istate = 'Onsale';
	  for(var i = 0; i<radio_btn.length; i++){
          if(radio_btn[i].checked==true){  
          	idradio_btn[i].checked=true;
  var form = document.createElement("form");
  form.setAttribute("method", "post");
  form.setAttribute("action", "<%=application.getContextPath() %>/param/productDelete/"+ radio_btn[i].value + "/" + idradio_btn[i].value + "/" + istate);  
  document.body.appendChild(form);  
  radio_btn_check++; 	    
  form.submit();
   alert("정상적으로 해당 상품이 삭제되었습니다.");		
          }
      }      
      if(radio_btn_check==0){
          alert("상품을 선택해주세요");
          return;
      }
}
</script>

</body>
</html>