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
<style type="text/css">
 button {
          background-color: #F9B514;
          padding: 5px 10px;
          border-radius: 4px;
          cursor: pointer;
        }

        .modal {
          position: fixed;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          display: flex;
          justify-content: center;
          align-items: center;
        }

        .modal .bg {
          width: 100%;
          height: 100%;
          background-color: rgba(0, 0, 0, 0.6);
        }

        .modalBox {
          position: absolute;
          background-color: #fff;
          width: 400px;
          height: 200px;
          padding: 15px;
        }

        .modalBox button {
          display: block;
          width: 80px;
          margin: 0 auto;
        }

        .hidden {
          display: none;
        }
</style>


</head>
<body>
 테스트 화면! <br>
 
 <c:choose>
 	<c:when test="${empty vo }">닉네임 식별 불가</c:when>
 	<c:when test="${not empty vo}">
 	<button id = "salebtn" onclick="location.href = '<%=application.getContextPath() %>/param/sale'">판매중</button> <button id ="completedbtn" onclick="location.href = '<%=application.getContextPath() %>/param/salecomplete'">거래완료</button> <button>숨김</button>
 	
 	<form action="<%=application.getContextPath() %>/param/salecomplete" method="post" id = "form1">
 													
 	<c:forEach var ="test" items="${vo }">
 		
 		<c:if test="${test.istate eq 'Onsale'}">		 <!--  판매중 내역 -->	
		<div class ="completed" id ="test"style="background-color: green; ">
		<input type="radio" class= "openBtn" name="ititle" value="${test.ititle }" style="display: none" />${test.ititle }	<br>
		${test.address }<br>
		${test.price }	<br>
		${test.istate} <br>			
		</div>	
		</c:if> <br> <!-- 판매중 내역 end -->			
		</c:forEach>	
		</form>
	
		<div class="modal hidden">
	  	<div class="bg"></div>
	  	<div class="modalBox">
	    구매자 닉네임: <input type="text" />
	    <button class="check">확인</button>
	    <button class="closeBtn">✖</button>
	  	</div>
		</div>
		
		
		<button onclick="openRadio()" id = "productChoice">상품선택</button>	
		<button onclick="radio_chk()" style="display: none;" id = "TransactionCompleted">거래완료</button>
		<button style="display: none;" id = "Reservation">예약중으로 변경</button >		
		<button onclick="location.href = '<%=application.getContextPath() %>/param/test01'">My Page</button>
 	</c:when>
 </c:choose>

<script>
const pro = document.getElementById("productChoice");
const tran = document.getElementById("TransactionCompleted");
const res = document.getElementById("Reservation");


	/* 라디오 버튼 생성 */
    function openRadio() {
		if(pro.name == null || pro.name == ""){
			console.log("야");
		}
		
    	for(a of document.getElementsByTagName('input')){
    		if(a.name == 'ititle'){
    			  console.log(a);
    			 a.style.display = 'block';  			 
    			 tran.style.display = 'block';
    			 res.style.display = 'block';
    			 pro.style.display = 'none';   			 
    		}    
    	}
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
                //라디오 버튼 값
                
    var form = document.createElement("form");
    form.setAttribute("method", "post");
    form.setAttribute("action", "<%=application.getContextPath() %>/param/salecomplete/" + radio_btn[i].value);
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

    const open = () => {
        document.querySelector(".modal").classList.remove("hidden");
      }

      const close = () => {
        document.querySelector(".modal").classList.add("hidden");
      }

      document.querySelector(".openBtn").addEventListener("click", open);
      document.querySelector(".check").addEventListener("click", close);
      document.querySelector(".closeBtn").addEventListener("click", close);
      document.querySelector(".bg").addEventListener("click", close);
</script>

</body>
</html>