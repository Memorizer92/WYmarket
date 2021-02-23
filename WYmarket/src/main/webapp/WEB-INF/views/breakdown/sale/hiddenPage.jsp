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
 숨김 화면 <br>


 	<button id = "salebtn" onclick="location.href = '<%=application.getContextPath() %>/param/sale'">판매중</button> <button id ="completedbtn" onclick="location.href = '<%=application.getContextPath() %>/param/salecomplete'">거래완료</button> <button onclick="location.href = '<%=application.getContextPath() %>/param/salehidden'">숨김</button>	 
 	<c:forEach var ="userItem_list" items="${itemvo }">
 		<c:if test="${userItem_list.istate eq 'Hidden'}">		 <!--  거래완료 내역 -->	
		<div class ="completed" id ="test"style="background-color: green; ">
		<input type="radio" class= "openBtn" name="ititle" value="${userItem_list.ititle }" style="display: none" />
		제목: ${userItem_list.ititle }	<br>
		지역: ${userItem_list.address }<br>
		가격: ${userItem_list.price }
		</div>	<br>
		</c:if> <!-- 거래완료 내역 end -->	 
		</c:forEach>
		<br>
		<button onclick="hiddenCancellations()" id = "HiddenCancellation">숨기기 취소</button>		
		<button onclick="location.href = '<%=application.getContextPath() %>/param/test01'">My Page</button>		



<script type="text/javascript">
var radio_btn = document.getElementsByName("ititle");
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
var form = document.createElement("form");
form.setAttribute("method", "post");
form.setAttribute("action", "<%=application.getContextPath() %>/param/salehidden/" + istate + "/" + radio_btn[i].value);
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

</script>

</body>
</html>