<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/assets/css/main.css">
</head>
<body>

<script>
function onlyNumber(){
	   if((event.keyCode<48)||(event.keyCode>57))
	      event.returnValue=false;
	}
</script>

	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="include/header.jsp"%>
			</div>
		</header>
		<nav id="nav">
			<div id="nav_box">
				<%@ include file="include/nav.jsp"%>
			</div>
		</nav>
		<section id="container">
			<div id="container_box">
				<li><a href="goods/register">상품등록</a></li>
			</div>
		</section>
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="include/footer.jsp"%>
			</div>
		</footer>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body" id="gpsContent"></div>
				<div class="modal-body" id="smsContent">
					<input type="text" placeholder="휴대폰 번호를 입력해주세요" maxlength="11"
						onkeypress="onlyNumber();" style="ime-mode: disabled;"
						id="phonenumber"
						onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
						>

					<button id="checkphone">인증문자 받기</button>

					<input type="text" placeholder="인증 번호를 입력해주세요" maxlength="4"
						onkeypress="onlyNumber();" style="ime-mode: disabled;" id="sms"
						onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">

					<button id="checksms">동의하고 시작하기</button>
		<input type="text" id="getsmscode" style="display: none"/>
		<input type="text" id="getph" style="display: none"/>
					<p id="time"></p>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="toLogin()">로그인하기</button>
				</div>
			</div>
		</div>
	</div>



	<script
		src="<%=application.getContextPath()%>/resources/assets/js/main.js"></script>

	<script>


		function toLogin() {

			
			document.getElementById("gpsContent").style.display = 'none';
			document.getElementById("smsContent").style.display = 'block';

			const prefix = "<%=application.getContextPath() %>/rest/";

			const phonetext = document.getElementById('phonenumber');
			const phonebtn = document.getElementById('checkphone');

			const smstext = document.getElementById('sms');
			const smsbtn = document.getElementById('checksms');


			phonebtn.addEventListener('click',()=>{
				if(phonetext.value.length == 11){
					if(timeLimit == 60 || timeLimit == 0){
						timeLimit = 60;
						ajaxGetSMS(phonetext.value);
						ajaxGetph(phonetext.value);
					    alert("해당 번호로 인증번호가 발송되었습니다.");
					    startTime();
					    console.log(phonetext.value);
					} else{
						alert("이미 인증 번호가 발송되었습니다. 잠시 후 다시 이용해주세요");
					}
				} else{
					alert("전화번호 형식이 아닙니다.")
				}
				 
			});

			smsbtn.addEventListener('click',()=>{
				if(timeLimit == 0){
					alert("인증 시간이 초과되었습니다. 다시 인증해주세요")
				} else{
				if(smstext.value == document.getElementById('getsmscode').value 
						&& phonetext.value == document.getElementById('getph').value && smstext.value != ""
						&& phonetext.value != ""){
					var form = document.createElement("form");
				    form.setAttribute("method", "post");
				    form.setAttribute("action", "./login/usernick");
					document.body.appendChild(form);
				    form.submit();
				} else{
					alert('sms 인증 번호가 일치하지 않습니다.');
				}
				}
			});

			/* document.getElementById(phonetext.getAttribute('form')).submit(); */


				
			var timeLimit = 60;
			function startTime(){


			var x = setInterval(function() {

			  timeLimit--;

			  document.getElementById("time").innerHTML = timeLimit;

			  if (timeLimit == 0) {
			    clearInterval(x);
			  }
			}, 1000);
			};
			}
	</script>

</body>
</html>