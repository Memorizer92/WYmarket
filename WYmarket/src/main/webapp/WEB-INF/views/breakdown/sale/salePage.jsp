<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jspf"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/assets/css/breakdown.css">
</head>
<body>

판매중 화면 <br>
 <button id = "salebtn" onclick="location.href = '<%=application.getContextPath() %>/param/sale'">판매중</button> <button id ="completedbtn" onclick="location.href = '<%=application.getContextPath() %>/param/salecomplete'">거래완료</button> <button onclick="location.href = '<%=application.getContextPath() %>/param/salehidden'">숨김</button>					
 

 
 <c:choose>
 	<c:when test="${not empty usernick}"> 	
 		<c:forEach var ="userItem_list" items="${itemvo }"> 
 		
 		<c:if test="${userItem_list.istate eq 'Onsale'}">		 <!--  판매중 내역 -->	
		<div class ="completed" id ="test"style="background-color: green;">		
		ID: ${userItem_list.itemid } <br>
	
		현재날짜와 등록된 날짜 차 값(초):${userItem_list.refreshTime} <br>
		<c:choose>
			<c:when test="${userItem_list.refreshTime < 60}">
				${userItem_list.refreshTime}초 전 <br>
			</c:when>
			<c:when test="${userItem_list.refreshTime >= 60 && userItem_list.refreshTime < 3600}">				
				<fmt:parseNumber var="percent" value="${((userItem_list.refreshTime) / 60)}" integerOnly="true" />
				${percent}분 전 <br>
			</c:when>
			<c:when test="${userItem_list.refreshTime >= 3600 && userItem_list.refreshTime < 86400}">
			<fmt:parseNumber var="percent" value="${((userItem_list.refreshTime) / 3600)}" integerOnly="true" />
			${percent }시간 전 <br>
			</c:when>
			<c:when test="${userItem_list.refreshTime >= 86400 && userItem_list.refreshTime < 2764800} ">
			<fmt:parseNumber var="percent" value="${((userItem_list.refreshTime) / 86400)}" integerOnly="true" />
			${percent }일 전 <br>
			</c:when>
			<c:when test="${userItem_list.refreshTime >= 2678400 && userItem_list.refreshTime < 32140800}">
			<fmt:parseNumber var="percent" value="${((userItem_list.refreshTime) / 2678400)}" integerOnly="true" />
			${percent }달 전 <br>
			</c:when>
			<c:when test="${userItem_list.refreshTime >= 32140800}">
			<fmt:parseNumber var="percent" value="${((userItem_list.refreshTime) / 32140800)}" integerOnly="true" />
			${percent }년 전 <br>
			</c:when>	
		</c:choose>
		<input type="radio"  value="${userItem_list.itemid }"  name = "itemid" style="display: none">
		<input type="radio" onclick="openModal()"name="ititle" value="${userItem_list.ititle }" style="display: none" />
		
		<c:if test="${userItem_list.ireservationstate eq 'Yreservation'}">
		 <span>예약중</span> 
		</c:if>제목: ${userItem_list.ititle } 
		
		<br>			
		지역: ${userItem_list.address } <br>
		가격: ${userItem_list.price }	<br>
		
		</div>	<br>
		</c:if>
		 <!-- 판매중 내역 end -->			
		</c:forEach>	
		
		<c:forEach var = "userinfo_list" items="${userinfo }">
			<input type="hidden" name = "userNcik" value="${userinfo_list.usernick }"style="display: none;">			
		</c:forEach>
			
		<div class="modal hidden">
	  	<div class="bg modalDiv" id ="bg"></div>
	  	<div class="modalBox">
	    구매자 닉네임: <input type="text" id = "nickCheck" name = "nickCheck" autocomplete="off"/>
	    <button id ="modalCheck" onclick="checkCloseModal()">확인</button>
	    <button id ="modalCloseBtn" class = "modalCloseBtn">✖</button>
	  	</div>
		</div>
		
			
 	</c:when>
 </c:choose>
	    <br>
	<button onclick="TransactionCompleted()"  style="display: none;" id = "TransactionCompleted">거래완료</button>				
	<button onclick="ProductHideen()"  style="display: none;" id = "ProductHideen">상품 숨기기</button>			
	<button onclick="pullUpChoise()" id = "pullUpChoise" style="display: none">끌어 올리기</button>
	<button onclick="ProductReservationY()"  style="display: none;" id = "ProductReservationY" value="Yreservation">예약중으로 변경</button>	  
	<button onclick="ProductReservationN()"  style="display: none;" id = "ProductReservationN" value="Nreservation">예약중으로 취소</button>	  
	   
	   
	<button onclick="productChoice()" id = "productChoice">거래상품 선택</button>
	<button onclick="ReservationChoise()" id = "ReservationChoise">상품예약</button >	
	<button onclick="hideenChoice()" id = "hideenChoice" value="숨기기">상품 숨기기</button> 
	<button onclick="pullUp()" id = "pullUp">끌어 올리기</button>
	<button onclick="location.href = '<%=application.getContextPath() %>/param/test01'">My Page</button>
	${pullup }
	<input type="text"  value="${pup }" id = "pup"style="display: none" />
		
<script>
const nickCheck = document.getElementById("nickCheck");
const productReservationY = document.getElementById("ProductReservationY").value;
const productReservationN = document.getElementById("ProductReservationN").value;
const pullupCheck = document.getElementById("pup");

const closeDiv = document.querySelector(".modalDiv");
const closeBtn = document.querySelector(".modalCloseBtn");
var istate;
var btntype;		
var radio_btn = document.getElementsByName("ititle");
var radio_btn_check = 0;

var idradio_btn = document.getElementsByName("itemid");

		
if(pullupCheck.value == 'pup'){
	location.href = '<%=application.getContextPath() %>/param/sale';
}
		

 
 
if(radio_btn.length == 0){
	document.getElementById("ReservationChoise").style.display = 'none';	
	document.getElementById("productChoice").style.display = 'none';      
	document.getElementById("hideenChoice").style.display = 'none';      
	document.getElementById("pullUp").style.display = 'none';      
}
		
	//판매내역에 보여지는 거래상품 버튼 클릭 이벤트(라디오 버튼 생성)	
    function productChoice() {		         
    	alert("해당 상품을 선택해 주세요.");	
        for( var i = 0; i < radio_btn.length; i++ ){
        		radio_btn[i].style.display = 'block';
         }		
		document.getElementById("TransactionCompleted").style.display = 'inline-block'; // 거래상품 클릭시 생성되는 거래완료 버튼
		document.getElementById("ReservationChoise").style.display = 'none'; // 판매내역에 보여지는 상품예약 버튼		
		document.getElementById("productChoice").style.display = 'none';	 // 판매내역에 보여지는 거래상품 선택 버튼  
		document.getElementById("hideenChoice").style.display = 'none';		 // 판매내역에 보여지는 상품 숨기기 버튼     
		document.getElementById("hideenChoice").style.display = 'none';		 // 판매내역에 보여지는 상품 숨기기 버튼     
		document.getElementById("pullUp").style.display = 'none';		 	 // 판매내역에 보여지는 끌어 올리기 버튼    
	}
	
	// 판매내역에 보여지는 끌어올리기 버튼 클릭 이벤트 (라디오 버튼 생성)	
    function pullUp() {
    	btntype = 'pullup';
    	alert("해당 상품을 선택해 주세요.");	
        for( var i = 0; i < radio_btn.length; i++ ){
        		radio_btn[i].style.display = 'block';
         }			
		document.getElementById("pullUpChoise").style.display = 'inline-block';	// 판매내역에 보여지는 끌어올리기 버튼 클릭시 생성되는 끌어올리기 버튼
		document.getElementById("pullUp").style.display = 'none';				// 판매내역에 보여지는 끌러올리기 버튼
		document.getElementById("ReservationChoise").style.display = 'none';	// 판매내역에 보여지는 상품예약 버튼	
		document.getElementById("productChoice").style.display = 'none';        // 판매내역에 보여지는 거래상품 선택 버튼  
		document.getElementById("hideenChoice").style.display = 'none';			// 판매내역에 보여지는 상품 숨기기 버튼      
	}
	
	
        
  	// 판매내역에 보여지는 상품숨기기 버튼 클릭 이벤트 (라디오 버튼 생성) 
    function hideenChoice() {
    	alert("해당 상품을 선택해 주세요.");	
    	btntype = '숨김';
        for( var i = 0; i < radio_btn.length; i++ ){  		
        		radio_btn[i].style.display = 'block';
         }		
		document.getElementById("ProductHideen").style.display = 'inline-block';		     
		document.getElementById("productChoice").style.display = 'none';		     
		document.getElementById("hideenChoice").style.display = 'none';		     
		document.getElementById("ReservationChoise").style.display = 'none';	
		document.getElementById("pullUp").style.display = 'none';
				     
	} 
	  
 // 판매내역에 보여지는 예약 버튼 클릭 이벤트 (라디오 버튼 생성)
    function ReservationChoise() {	
    	alert("해당 상품을 선택해 주세요.");	
    	btntype = '예약';     	
        for( var i = 0; i < radio_btn.length; i++ ){  		
        		radio_btn[i].style.display = 'block';
         }		        
		document.getElementById("ProductReservationY").style.display = 'inline-block';		     
		document.getElementById("ProductReservationN").style.display = 'inline-block';		     
		document.getElementById("ReservationChoise").style.display = 'none';		     	     
		document.getElementById("productChoice").style.display = 'none';		     
		document.getElementById("hideenChoice").style.display = 'none';		
		document.getElementById("pullUp").style.display = 'none';
		
	} 
	
	
 

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
 
 	
 	
 	// open modal 이벤트
    function openModal() {
    	if(btntype == '예약' || btntype == '숨김' || btntype == 'pullup'){
    		console.log("예약 혹은 숨김");
    		document.querySelector(".modal").classList.add("hidden");   		
    		return;
    	}
        		document.querySelector(".modal").classList.remove("hidden");
    			nickCheck.value = null;	   			
	}
        
   
   // modal 확인 버튼 클릭시 close 이벤트 
    function checkCloseModal() {
    		var checknum = 0;	
    		var userNcik = document.getElementsByName("userNcik");   		
    		var confirm_test = confirm("입력하신 정보가 " + nickCheck.value + "이(가) 맞으십니까?");
    		if (confirm_test == true ) {   
    			for( var i = 0; i < userNcik.length; i++ ) {    				
    				if(nickCheck.value == userNcik[i].value){
    						if(nickCheck.value == "${usernick}"){
    							alert("잘못되 닉네임을 입력하셨습니다");
    							document.querySelector(".modal").classList.remove("hidden");
    			    			nickCheck.value = null;
    							return;
    						}else if(nickCheck.value != "${usernick}"){    							
    							document.querySelector(".modal").classList.add("hidden");
    							checknum = 1;  
    							
    							return;
    						}
    					}// 첫 if문
    					else{
    						checknum = 0;
    					}

    				} // for end
    				if(checknum == 0){
    					 alert("존재하지 않는 닉네임입니다.");
    					 document.querySelector(".modal").classList.remove("hidden");
    		    		nickCheck.value = null;
    				}
			    } else if ( confirm_test == false ) {
			    	document.querySelector(".modal").classList.remove("hidden");
	    			nickCheck.value = null;
	    			return;
			    }/* 입력한 닉네임이 일치 하는지 YES / NO */
    			
    	} /* checkCloseModal end*/
    	  
    
    // modal창에서 div태그 클릭시 close 이벤트
	closeDiv.addEventListener('click', (e) => {
		document.querySelector(".modal").classList.add("hidden");
		for(var i = 0; i<radio_btn.length; i++){
			 if(radio_btn[i].checked==true){
				radio_btn[i].checked=false;
	}   			
  }
	});
		
    // modal창에서 X버튼 클릭시 close 이벤트	
	closeBtn.addEventListener('click', (e) => {
		document.querySelector(".modal").classList.add("hidden");
		for(var i = 0; i<radio_btn.length; i++){
			 if(radio_btn[i].checked==true){
				radio_btn[i].checked=false;
	}   			
  }
		});
</script>

</body>
</html>