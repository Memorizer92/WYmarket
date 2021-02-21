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
 
 <c:choose>
 	
 	<c:when test="${empty userinfo}">
 	
 	</c:when>
 	<c:when test="${not empty userinfo}">
 	<button id = "salebtn" onclick="location.href = '<%=application.getContextPath() %>/param/sale'">판매중</button> <button id ="completedbtn" onclick="location.href = '<%=application.getContextPath() %>/param/salecomplete'">거래완료</button> <button>숨김</button>					
 		<c:forEach var ="userItem_list" items="${itemvo }"> 
 		
 		<c:if test="${userItem_list.istate eq 'Onsale'}">		 <!--  판매중 내역 -->	
		<div class ="completed" id ="test"style="background-color: green; ">
		<input type="radio" onclick="openModal()" class= "openBtn" name="ititle" value="${userItem_list.ititle }" style="display: none" />${userItem_list.ititle }	<br>		
	
		${userItem_list.address }<br>
		${userItem_list.price }	<br>
		${userItem_list.istate} <br>			
		</div>	
		</c:if>
		 <br> <!-- 판매중 내역 end -->			
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
		<button onclick="radio_chk()" class = "" style="display: none;" id = "TransactionCompleted">거래완료</button>
		<button style="display: none;" id = "Reservation" >예약중으로 변경</button >			
 	</c:when>
 </c:choose>
	<br>   <button onclick="openRadio()" id = "productChoice">상품선택</button>	   <button onclick="location.href = '<%=application.getContextPath() %>/param/test01'">My Page</button>
<script>

const nickCheck = document.getElementById("nickCheck");
const closeDiv = document.querySelector(".modalDiv");
const closeBtn = document.querySelector(".modalCloseBtn");

	/* 라디오 버튼 생성 */
	
    function openRadio() {				   
        var radio_btn = document.getElementsByName("ititle");
        for( var i = 0; i < radio_btn.length; i++ ){
        		console.log(radio_btn[i].value);
        		radio_btn[i].style.display = 'block';
         }
         
		
		document.getElementById("TransactionCompleted").style.display = 'block';
		document.getElementById("Reservation").style.display = 'block';
		document.getElementById("productChoice").style.display = 'none'; 
        
	}
	
    /*	라디오 버튼 체크 확인	*/
    function radio_chk() {
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