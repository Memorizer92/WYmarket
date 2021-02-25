<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>header</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"
	crossorigin="anonymous"></script>

<style>
.content {
	width: 300px;
	border: black solid 1px;
}

.vv {
	border: black solid 1px;
}

.ma {
	margin-left: 30px;
	margin-right: 30px;
}

.cen {
	text-align: center;
}

.navi {
	margin-top: 5%;
	width: 1130px;
	margin-left: auto;
	margin-right: auto;
	display: flex;
	flex-direction: row;
	flex-wrap: nowrap;
	justify-content: center;
}

.contents {
	width: 1130px;
	background-color: rgb(170, 170, 172);
	height: 1000px;
	margin-left: auto;
	margin-right: auto;
}
 a{
 	position: relative;
 	z-index: 1;
  
 }
</style>

</head>

<body> 

	<div class="cen container-xl">
		<nav class="navi">
			<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
				<li class="nav-item vv" role="presentation">
					<button class="nav-link content " id="pills-home-tab"
						data-bs-toggle="pill" data-bs-target="#pills-home" type="button"
						role="tab" aria-controls="pills-home" aria-selected=""> 공지사항 </button>
				</li>
				<li class="nav-item ma vv" role="presentation">
					<button class="nav-link content" id="pills-profile-tab"
						data-bs-toggle="pill" data-bs-target="#pills-profile"
						type="button" role="tab" aria-controls="pills-profile"
						aria-selected="false"> 운영정책 </button> 
				</li>
				<li class="nav-item vv" role="presentation">
					 <button class="nav-link content" id="pills-contact-tab"
						data-bs-toggle="pill" data-bs-target="#pills-contact"
						type="button" role="tab" aria-controls="pills-contact"
						aria-selected="false">   자주묻는질문   </button>  
				</li>
			</ul>
		</nav>

 

		<div class="tab-content contents" id="pills-tabContent">

			<div class="tab-pane fade  " id="pills-home"
				role="tabpanel" aria-labelledby="pills-home-tab">
				<c:forEach var="vo" items="${list}">
					<c:set var="i" value="${i+1}" />
					<div class="accordion" id="accordionExample">
						<div class="accordion-item">
							<h2 class="accordion-header" id="headingOne">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapse${i}"
									aria-expanded="false" aria-controls="collapseOne">
									${vo.ntitle}</button>
							</h2>
							<div id="collapse${i}" class="accordion-collapse collapse"
								aria-labelledby="headingOne" data-bs-parent="#accordionExample">
								<div class="accordion-body">${vo.ncontent}</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<div class="tab-pane fade  " id="pills-profile" role="tabpanel"
				aria-labelledby="pills-profile-tab">It is hidden by default,</div>
			<div class="tab-pane fade" id="pills-contact" role="tabpanel"
				aria-labelledby="pills-contact-tab">until the collapse 
				adds</div>

		</div>

	</div>
	<hr>
		<script>
	  
		 var home = document.getElementById("pills-home-tab");
		 var profile = document.getElementById("pills-profile-tab");
		 var contact = document.getElementById("pills-contact-tab");
	 
		<c:choose>
		
       	<c:when test="${category eq 'a' }">
       		home.click();
       	</c:when>
       	
       	<c:when test="${category eq 'b' }">
       		 profile.click();
       	</c:when>
       	
      		<c:otherwise>
      			contact.click();
       	</c:otherwise>
       	
       </c:choose>
         
		</script>
	 
</body>

</html>