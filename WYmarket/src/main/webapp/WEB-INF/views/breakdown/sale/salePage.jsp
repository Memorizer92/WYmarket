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
 <br>판매중 화면 
 <c:choose>
 	<c:when test="${not empty userinfo}">
 	
 		<c:forEach var ="userItem_list" items="${itemvo }"> 
 		
 		<c:if test="${userItem_list.istate eq 'Onsale'}">		 <!--  판매중 내역 -->	
		<div class ="completed" id ="test"style="background-color: green; ">
		<input type="radio" onclick="openModal()" class= "openBtn" name="ititle" value="${userItem_list.ititle }" style="display: none" />
		${userItem_list.ititle } <br>			
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
	   
	<button onclick="TransactionCompleted()" class = "" style="display: none;" id = "TransactionCompleted">거래완료</button>				
	<button onclick="ProductHideen()" class = "" style="display: none;" id = "ProductHideen">상품 숨기기</button>			
	<button onclick="ProductReservation()" class = "" style="display: none;" id = "ProductReservation">예약중으로 변경</button>	  
	   
	   
	<button onclick="productChoice()" id = "productChoice">거래상품 선택</button>
	<button onclick="ReservationChoise()" id = "ReservationChoise" value="Yreservation">예약중으로 변경</button >	
	<button onclick="hideenChoice()" id = "hideenChoice" value="숨기기">상품 숨기기</button> 
	<button onclick="location.href = '<%=application.getContextPath() %>/param/test01'">My Page</button>
		
<script>
const nickCheck = document.getElementById("nickCheck");
const closeDiv = document.querySelector(".modalDiv");
const closeBtn = document.querySelector(".modalCloseBtn");
const reservationChoise = document.getElementById("ReservationChoise").value;
	
	
	//거래상품 선택 클릭시	
    function productChoice() {		   
        var radio_btn = document.getElementsByName("ititle");
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
        var radio_btn = document.getElementsByName("ititle");
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
        var radio_btn = document.getElementsByName("ititle");        	
        for( var i = 0; i < radio_btn.length; i++ ){  		
        		radio_btn[i].style.display = 'block';
         }		
		document.getElementById("ProductHideen").style.display = 'inline-block';		     
		document.getElementById("ReservationChoise").style.display = 'none';		     
		document.getElementById("ProductHideen").style.display = 'none';		     
		document.getElementById("productChoice").style.display = 'none';		     
		document.getElementById("hideenChoice").style.display = 'none';		     
	} 
	
	
  	
	// 거래완료 버튼 누를 시
    /*	라디오 버튼 체크 확인	*/
    function TransactionCompleted() {
        //라디오 버튼 Name 가져오기
        var radio_btn = document.getElementsByName("ititle");
        //라디오 버튼이 체크되었나 확인하기 위한 변수
        var radio_btn_check = 0;
        for(var i = 0; i<radio_btn.length; i++){
            //만약 라디오 버튼이 체크가 되어있다면 true
            if(radio_btn[i].checked==true){           	           	     		
    var form = document.createElement("form");
    form.setAttribute("method", "post");
    form.setAttribute("action", "<%=application.getContextPath() %>/param/salecomplete/" + radio_btn[i].value +"/" + nickCheck.value);
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
        var radio_btn = document.getElementsByName("ititle");
        var radio_btn_check = 0;
        for(var i = 0; i<radio_btn.length; i++){
            if(radio_btn[i].checked==true){           	           	     		
    var form = document.createElement("form");
    form.setAttribute("method", "post");
    form.setAttribute("action", "<%=application.getContextPath() %>/param/salehidden/" + radio_btn[i].value);
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
    function ProductReservation() {
    	
        var radio_btn = document.getElementsByName("ititle");
        var radio_btn_check = 0;
        for(var i = 0; i<radio_btn.length; i++){
            if(radio_btn[i].checked==true){           	           	     		
    var form = document.createElement("form");
    form.setAttribute("method", "post");
    form.setAttribute("action", "<%=application.getContextPath() %>/param/reservation/"+ reservationChoise + "/" + radio_btn[i].value);
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
	
	
	
	
	

 
    function openModal() {
        		document.querySelector(".modal").classList.remove("hidden");
    			nickCheck.value = null;	   			
	}
    
    
    function checkCloseModal() {
    		var checknum;
    		document.querySelector(".modal").classList.add("hidden"); 
    		var userNcik = document.getElementsByName("userNcik");
    		for( var i = 0; i < userNcik.length; i++ ) {
    			 if(userNcik[i].value == nickCheck.value){
    				 checknum = 1;
    				 console.log(checknum);
    			 }else{
    				 checknum = 0;
    			 }
    	}if(checknum == 0){
    		 alert("존재하지 않는 닉네임입니다.")
    		 var radio_btn = document.getElementsByName("ititle");
    		for(var i = 0; i<radio_btn.length; i++){
    			 if(radio_btn[i].checked==true){
    				radio_btn[i].checked=false;
    	}   			
       }
    }     	
  }
    	
    
	closeDiv.addEventListener('click', (e) => {
		var radio_btn = document.getElementsByName("ititle");
		document.querySelector(".modal").classList.add("hidden");
		for(var i = 0; i<radio_btn.length; i++){
			 if(radio_btn[i].checked==true){
				radio_btn[i].checked=false;
	}   			
  }
	});
	
	
	closeBtn.addEventListener('click', (e) => {
		var radio_btn = document.getElementsByName("ititle");
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