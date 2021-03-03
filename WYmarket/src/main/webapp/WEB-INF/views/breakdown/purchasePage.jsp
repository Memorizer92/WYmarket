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
<style type="text/css">
*{box-sizing: border-box;}

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

   #grid_2{
       width: 100%;
       margin: 0 10% 0 10%;
      
        background: white; 
        }

	.firstli > li > button{
		margin : 0;
		border: 0;
		background-color: white;
		
	}
	
	.firstli > li{
		margin: 0;
	}
	.menutitle{
		font-size: 20px;
		
	}
</style>


</head>
<body>
 구매내역
 		<!-- 로그인 정보 세션 -->			
 		<c:forEach var ="PurchaserPhVO_list" items="${PurchaserPhVO }"> 		
 		 <!--  판매중 내역 -->	
 		<c:if test="${empty PurchaserPhVO_list.ititle }">
 			구매하신 상품이 없습니다. 
 		</c:if>
 		
		<div class ="Purchasedetails" id ="test"style="background-color: green; border: solid black 1px; ">
		현재날짜와 등록된 날짜 차 값(초):${PurchaserPhVO_list.refreshTime} <br>
		<c:choose>
			<c:when test="${PurchaserPhVO_list.refreshTime < 60}">
				${PurchaserPhVO_list.refreshTime}초 전 <br>
			</c:when>
			<c:when test="${PurchaserPhVO_list.refreshTime >= 60 && PurchaserPhVO_list.refreshTime < 3600}">				
				<fmt:parseNumber var="percent" value="${((PurchaserPhVO_list.refreshTime) / 60)}" integerOnly="true" />
				${percent}분 전 <br>
			</c:when>
			<c:when test="${PurchaserPhVO_list.refreshTime >= 3600 && PurchaserPhVO_list.refreshTime < 86400}">
			<fmt:parseNumber var="percent" value="${((PurchaserPhVO_list.refreshTime) / 3600)}" integerOnly="true" />
			${percent }시간 전 <br>
			</c:when>
			<c:when test="${PurchaserPhVO_list.refreshTime >= 86400 && PurchaserPhVO_list.refreshTime < 2764800} ">
			<fmt:parseNumber var="percent" value="${((PurchaserPhVO_list.refreshTime) / 86400)}" integerOnly="true" />
			${percent }일 전 <br>
			</c:when>
			<c:when test="${PurchaserPhVO_list.refreshTime >= 2678400 && PurchaserPhVO_list.refreshTime < 32140800}">
			<fmt:parseNumber var="percent" value="${((PurchaserPhVO_list.refreshTime) / 2678400)}" integerOnly="true" />
			${percent }달 전 <br>
			</c:when>
			<c:when test="${PurchaserPhVO_list.refreshTime >= 32140800}">
			<fmt:parseNumber var="percent" value="${((PurchaserPhVO_list.refreshTime) / 32140800)}" integerOnly="true" />
			${percent }년 전 <br>
			</c:when>	
		</c:choose>
		<span>구매완료</span> 제목: ${PurchaserPhVO_list.ititle}<br>
		지역: ${PurchaserPhVO_list.address }<br>	
		구매자: ${PurchaserPhVO_list.purchaser} <br>
		판매자: ${PurchaserPhVO_list.usernick} <br>	
		<span style="background-color: red;">거래완료</span> ${PurchaserPhVO_list.price }	<br>
		
		</div>	
		<!-- 판매중 내역 end -->			
		</c:forEach>
		<button><span>작성한 후기 보기</span></button>

		<button onclick="location.href = '<%=application.getContextPath() %>/param/test01'">My Page</button>



</body>
</html>