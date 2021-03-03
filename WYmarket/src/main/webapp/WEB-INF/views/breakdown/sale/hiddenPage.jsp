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
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Akaya+Kanadaka&family=Roboto+Slab:wght@500&display=swap" rel="stylesheet">


<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Akaya+Kanadaka&family=Nanum+Pen+Script&family=Roboto+Slab:wght@500&display=swap" rel="stylesheet">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Akaya+Kanadaka&family=IBM+Plex+Sans:wght@600&family=Nanum+Pen+Script&family=Roboto+Slab:wght@500&display=swap" rel="stylesheet">


<style type="text/css">
*{box-sizing: border-box;}


@media (max-width: 817px){
.firstli{
		display: grid;
		
	}
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
        
        .div{
        height: 100%;
        float: left;
        }
     
    /*     #grid_2{
       width: 70%;
       margin: 0 auto;
       position: absolute;
       top: 50%;
       left: 50%;
       transform: translate(-50%, -50%);
        background: white; 
        } */
        
	.firstli{
	 padding-bottom: 10px; 
	 padding-top: 10px;
	 text-align: center; 
	}

   #grid_2{
       width: 100%;
        background: white; 
        }

	.firstli > li > button{
		padding-right: 100px;
		padding-left: 100px;
		margin : 0;
		border: 0;
		font-size: 35px;
		background-color: white;		
		font-family: 'Nanum Pen Script', cursive;
		
	}		
	.firstli > li{
		margin: 0;		
	}
	.menutitle{
		font-size: 20px;		
	}
	
	.titlefont{	
	font-size: 25px;
	font-family: 'Akaya Kanadaka', cursive;
	}
	.completed > span{
		margin: 20px;
	}
</style>

</head>
<body>
<div id ="grid_2" class ="div" style="">
 	<header style="padding: 20px; text-align: center; font-family: 'Akaya Kanadaka', cursive; font-size: 40px; font-size: 40px; padding-left: 40px; background-color: #ECEFF1" class = "titlefont">숨김 상품</header>
 	<main>
<input type="text" value="${success}" id = "success" style="display: none;">
 	<ul class="list-inline firstli" style="padding-bottom: 20px; text-align: center; ">
    <li class="list-inline-item"><button class = "menutitle" id = "salebtn" onclick="salbtn()">판매중</button></li>
    <li class="list-inline-item"><button class = "menutitle" id ="completedbtn"  onclick="location.href = '<%=application.getContextPath() %>/param/salecomplete'">거래완료</button></li>
    <li class="list-inline-item"><button class = "menutitle" onclick="location.href = '<%=application.getContextPath() %>/param/salehidden'" style="border-bottom: 2px solid black;">숨김</button></li>
	</ul>
 	<c:forEach var ="userItem_list" items="${itemvo }">
 		<c:if test="${userItem_list.istate eq 'Hidden'}">		 <!--  거래완료 내역 -->	
		<div class ="completed" id ="test"style="background-color: green; ">
		<input type="radio" class= "" name="itemid" value="${userItem_list.itemid }" style="display: none" />
		${userItem_list.itemid } <br>
		<input type="radio" class= "" name="ititle" value="${userItem_list.ititle }" style="display: none" />
		
		제목: ${userItem_list.ititle }	<br>
		지역: ${userItem_list.address }<br>
		가격: ${userItem_list.price }
		</div>	<br>
		</c:if> <!-- 거래완료 내역 end -->	 
		</c:forEach>
		<br>
		<button onclick="hiddenCancellations()" id = "HiddenCancellation">숨기기 취소</button>		
		<button onclick="location.href = '<%=application.getContextPath() %>/param/test01'">My Page</button>		
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

function salbtn() {		
	location.href = '<%=application.getContextPath() %>/param/sale';
}
</script>

</body>
</html>