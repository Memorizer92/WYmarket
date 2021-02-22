<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
<c:if test=""></c:if> <!-- 로그인 세션이 null일떄 표현해주는 곳 -->

 <button id = "salebtn" onclick="location.href = '<%=application.getContextPath() %>/param/sale'">판매중</button> <button id ="completedbtn" onclick="location.href = '<%=application.getContextPath() %>/param/salecomplete'">거래완료</button> <button onclick="location.href = '<%=application.getContextPath() %>/param/salehidden'">숨김</button>					
 

 <br>판매중 화면 <br>
 <c:choose>
 <c:when test="${empty usernick }">
 로그인
 </c:when>
 	<c:when test="${not empty usernick}">
 	
 		<c:forEach var ="userItem_list" items="${itemvo }"> 
 		
 		<c:if test="${userItem_list.istate eq 'Onsale'}">		 <!--  판매중 내역 -->	
		<div class ="completed" id ="test"style="background-color: green;">
		
		
		<input type="radio" onclick="openModal()" class= "openBtn" name="ititle" value="${userItem_list.ititle }" style="display: none" />
		${userItem_list.ititle } 
		<c:if test="${userItem_list.ireservationstate eq 'Yreservation'}">
		예약중
		</c:if>
		<br>			
		${userItem_list.address } <br>
		${userItem_list.price }	<br>
		${userItem_list.istate} <br>			
		</div>	<br>
		</c:if>
		 <!-- 판매중 내역 end -->			
		</c:forEach>	
		
		<c:forEach var = "userinfo_list" items="${userinfo }">
			<input type="text" name = "userNcik" value="${userinfo_list.usernick }"style="display: none;">			
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
	    
	<button onclick="TransactionCompleted()"  style="display: none;" id = "TransactionCompleted">거래완료</button>				
	<button onclick="ProductHideen()"  style="display: none;" id = "ProductHideen">상품 숨기기</button>			
	<button onclick="ProductReservationY()"  style="display: none;" id = "ProductReservationY" value="Yreservation">예약중으로 변경</button>	  
	<button onclick="ProductReservationN()"  style="display: none;" id = "ProductReservationN" value="Nreservation">예약중으로 취소</button>	  
	   
	   
	<button onclick="productChoice()" id = "productChoice">거래상품 선택</button>
	<button onclick="ReservationChoise()" id = "ReservationChoise">상품예약</button >	
	<button onclick="hideenChoice()" id = "hideenChoice" value="숨기기">상품 숨기기</button> 
	<button onclick="location.href = '<%=application.getContextPath() %>/param/test01'">My Page</button>
		
<script>
const nickCheck = document.getElementById("nickCheck");
const productReservationY = document.getElementById("ProductReservationY").value;
const productReservationN = document.getElementById("ProductReservationN").value;

const closeDiv = document.querySelector(".modalDiv");
const closeBtn = document.querySelector(".modalCloseBtn");
var istate;
var btntype;		
var radio_btn = document.getElementsByName("ititle");
var radio_btn_check = 0;
		
			
 
if(radio_btn.length == 0){
	document.getElementById("ReservationChoise").style.display = 'none';	
	document.getElementById("productChoice").style.display = 'none';      
	document.getElementById("hideenChoice").style.display = 'none';      
}
		
	//거래상품 선택 클릭시	
    function productChoice() {		         
    	alert("해당 상품을 선택해 주세요.");	
        for( var i = 0; i < radio_btn.length; i++ ){
        		radio_btn[i].style.display = 'block';
         }		
		document.getElementById("TransactionCompleted").style.display = 'inline-block';
		document.getElementById("ReservationChoise").style.display = 'none';	
		document.getElementById("productChoice").style.display = 'none';      
		document.getElementById("hideenChoice").style.display = 'none';      
	}
        
  	// 상품 숨기기 버튼 클릭 시 
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
				     
	} 
	  
  	// 예약상품 버튼 클릭시
    function ReservationChoise() {	
    	alert("해당 상품을 선택해 주세요.");	
    	console.log("예약하기 버튼을 눌럿어요");
    	btntype = '예약';     	
        for( var i = 0; i < radio_btn.length; i++ ){  		
        		radio_btn[i].style.display = 'block';
         }		
        
		document.getElementById("ProductReservationY").style.display = 'inline-block';		     
		document.getElementById("ProductReservationN").style.display = 'inline-block';		     
		document.getElementById("ReservationChoise").style.display = 'none';		     
		document.getElementById("ProductHideen").style.display = 'none';		     
		document.getElementById("productChoice").style.display = 'none';		     
		document.getElementById("hideenChoice").style.display = 'none';		     
	} 
	
	
	// 거래완료 버튼 누를 시
    /*	라디오 버튼 체크 확인	*/
    function TransactionCompleted() {
    	istate = 'Completed';
        //라디오 버튼 Name 가져오기
        //라디오 버튼이 체크되었나 확인하기 위한 변수
        for(var i = 0; i<radio_btn.length; i++){
            //만약 라디오 버튼이 체크가 되어있다면 true
            if(radio_btn[i].checked==true){           	           	     		
    var form = document.createElement("form");
    form.setAttribute("method", "post");
   
    form.setAttribute("action", "<%=application.getContextPath() %>/param/salecomplete/" + radio_btn[i].value +"/" + nickCheck.value +"/" + istate);
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
  
	// 숨기기 버튼 클릭 시
    function ProductHideen() {
    	istate = 'Hidden';
        for(var i = 0; i<radio_btn.length; i++){
            if(radio_btn[i].checked==true){           	           	     		
    var form = document.createElement("form");
    form.setAttribute("method", "post");
    form.setAttribute("action", "<%=application.getContextPath() %>/param/salehidden/" + istate + "/" + radio_btn[i].value);
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
	
 	// 예약하기 버튼 클릭 시 
    function ProductReservationY() {   	
        for(var i = 0; i<radio_btn.length; i++){
            if(radio_btn[i].checked==true){           
    var form = document.createElement("form");
    form.setAttribute("method", "post");
    form.setAttribute("action", "<%=application.getContextPath() %>/param/reservation/"+ productReservationY + "/" + radio_btn[i].value);  
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
	
 // 예약하기 버튼 클릭 시  취소
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
 	
 	
 	
 	
 	
    function openModal() {
    	if(btntype == '예약' || btntype == '숨김'){
    		console.log("예약 혹은 숨김");
    		document.querySelector(".modal").classList.add("hidden");   		
    		return;
    	}
        		document.querySelector(".modal").classList.remove("hidden");
    			nickCheck.value = null;	   			
	}
        
   
   
    function checkCloseModal() {
    		var checknum = 0;	
    		var userNcik = document.getElementsByName("userNcik");   		
    		var confirm_test = confirm("입력하신 정보가 " + nickCheck.value + "이(가) 맞으십니까?");
    		if (confirm_test == true ) {   
    			for( var i = 0; i < userNcik.length; i++ ) {    				
    				if(nickCheck.value == userNcik[i].value){ // 승호 승환 
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
    	  
    
    
	closeDiv.addEventListener('click', (e) => {
		document.querySelector(".modal").classList.add("hidden");
		for(var i = 0; i<radio_btn.length; i++){
			 if(radio_btn[i].checked==true){
				radio_btn[i].checked=false;
	}   			
  }
	});
		
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