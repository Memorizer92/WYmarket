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
<%-- <link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/login.css"> --%>
</head>
<body>

	<script>
function onlyNumber(){
	   if((event.keyCode<48)||(event.keyCode>57))
	      event.returnValue=false;
	}
</script>


	<h3>로그인</h3>



	<input type="text" placeholder="휴대폰 번호를 입력해주세요" maxlength="11"
		onkeypress="onlyNumber();" style="ime-mode: disabled;"
		id="phonenumber"
		onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" >

	<button id="checkphone">인증문자 받기</button>

	<input type="text" placeholder="인증 번호를 입력해주세요" maxlength="4"
		onkeypress="onlyNumber();" style="ime-mode: disabled;" id="sms"
		onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" >

	<button id="checksms">동의하고 시작하기</button>
	<input type="text" id="getsmscode" style="display: none" />
	<input type="text" id="getph" style="display: none" />
	<p id="time"></p>

	<a
		href="https://kauth.kakao.com/oauth/authorize
?client_id=f5c99e47d61ce4b7e521d120e1f04199
&redirect_uri=http://localhost:8080/wymarket/auth/kakao/login
&response_type=code"><img
		id='modalkakao' src="/wymarket/image/kakao_login_medium_narrow.png"
		alt="abc" /></a>

	<input type="text" id="getConfirm" style="display: none" />
	<input type="text" id="userNickCheck" style="display: none" />

	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static"
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


				<div class="modal-footer" id="modalfooter">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="input-group flex-nowrap">
						<span class="input-group-text" id="addon-wrapping">닉네임</span> <input
							type="text" class="form-control" placeholder="Username"
							aria-label="Username" aria-describedby="addon-wrapping"
							id="nickname" name="nick_name">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" onclick="toMain()">Understood</button>
				</div>
			</div>
		</div>
	</div>

	<script
		src="<%=application.getContextPath()%>/resources/assets/js/login.js"></script>

	<script>
	window.onpageshow = function(event){
		if(event.persisted || window.performance.navigation.type == 2){
			window.location.href = '/wymarket/login';
		}
	}

			const confirm = document.getElementById('getConfirm');

			const prefix = "<%=application.getContextPath()%>/rest/";

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
					    ajaxToNick();
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
					if(document.getElementById('getConfirm').value == "0"){
						var myModal = new bootstrap.Modal(document.getElementById('staticBackdrop2'));
						myModal.show()
					} else {
	 					var form = document.createElement("form");
					    form.setAttribute("method", "get");
					    form.setAttribute("action", "./main");
						document.body.appendChild(form);
					    form.submit();
					}

				} else{
					alert('sms 인증 번호가 일치하지 않습니다.');
				}
				}
			});

			/* document.getElementById(phonetext.getAttribute('form')).submit(); */

function toMain() {
	const nickInput = document.getElementById("nickname");
	if (nickInput.value.length <= 1) {
		alert("닉네임은 두 글자 이상이어야 합니다.");
	} else {
		
		console.log("toMain console" + document.getElementById("userNickCheck").value);
		var checkvalue = <%= session.getAttribute("check")%>

		if (document.getElementById("userNickCheck").value == "1") {
			alert("이미 존재하는 닉네임입니다.")
		} else {
 			ajaxNickUpdate();
			var form = document.createElement("form");
			form.setAttribute("method", "get");
			form.setAttribute("action", "./main");
			document.body.appendChild(form);
			form.submit();
		}

	}
}
			
	const nickname = document.getElementById('nickname');
	nickname.addEventListener('keyup', ()=> {
		ajaxNickCheck();
		console.log(nickname.value);
	});
	
			
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
	</script>

</body>
</html>