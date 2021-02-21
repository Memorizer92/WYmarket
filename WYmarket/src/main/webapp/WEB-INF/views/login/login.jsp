<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>login</title>
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
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
<style type="text/css">
* {
	box-sizing: border-box;
}

#loginContainer1 {
	display: flex;
	justify-content: center;
}

#loginContainer2 {
	display: flex;
	flex-direction: column;
	width: 360px;
	background-color: white;
	height: 500px;
	margin-top: 100px;
	border-radius: 10%
}

#gpsBody {
	display: flex;
	flex-direction: column;
	justify-content: center;
}

#title {
	text-align: center;
	margin-top: 20px;
}

#img {
	display: block;
	margin-left: auto;
	margin-right: auto;
	object-fit: cover;
	width: 50%;
}

#gpsContent {
	text-align: center;
	line-height: 40px;
	font-weight: bold;
	font-size: 20px;
}

#modalkakao {
	display: block;
	margin-left: auto;
	margin-right: auto;
	width: 50%;
	margin-top: 25px;
}

#phonenumber, #checkphone, #sms, #checksms {
	display: block;
	margin-left: auto;
	margin-right: auto;
	width: 90%;
	margin-top: 25px;
	height: 50px;
}

#checksms {
	margin-top: 0px;
}

#time {
	display: block;
	margin-left: auto;
	margin-right: auto;
	width: 90%;
	margin-top: 10px;
}

#checkphone, #checksms {
	background-color: rgba(70, 70, 85, 1);
	border-color: rgba(70, 70, 85, 1);
}

#nick2Char, #nickOverrap {
	display: none;
	margin-top: 10px;
}

body {
	background-image: url("/wymarket/image/carrotbg.jpg");
}
</style>
</head>
<body>

	<script>
function onlyNumber(){
	   if((event.keyCode<48)||(event.keyCode>57))
	      event.returnValue=false;
	}
</script>
	<div class="container" id='loginContainer1'>
		<div class="container" id='loginContainer2'>


			<h3 id="title">로그인</h3>


			<input type="text" class="form-control" aria-label="PhoneNumber"
				aria-describedby="basic-addon1" placeholder="휴대폰 번호를 입력해주세요"
				maxlength="11" onkeypress="onlyNumber();"
				style="ime-mode: disabled;" id="phonenumber"
				onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">

			<button class="btn btn-primary" type="submit" id="checkphone">인증문자
				받기</button>

			<input type="text" class="form-control" aria-label="smsCode"
				aria-describedby="basic-addon1" placeholder="인증 번호를 입력해주세요"
				maxlength="4" onkeypress="onlyNumber();" style="ime-mode: disabled;"
				id="sms" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">

			<p id="time"></p>

			<button class="btn btn-primary" type="submit" id="checksms">동의하고
				시작하기</button>
			<input type="text" id="getsmscode" style="display: none" /> <input
				type="text" id="getph" style="display: none" /> <a
				href="https://kauth.kakao.com/oauth/authorize
?client_id=f5c99e47d61ce4b7e521d120e1f04199
&redirect_uri=http://localhost:8080/wymarket/auth/kakao/login
&response_type=code"><img
				id='modalkakao' src="/wymarket/image/kakao_login_medium_narrow.png"
				alt="abc" /></a> <input type="text" id="getConfirm"
				style="display: none" /> <input type="text" id="userNickCheck"
				style="display: none" />
		</div>
	</div>


	<!-- Modal -->

	<div class="modal fade" id="staticBackdrop1" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content ">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">환영합니다!</h5>
				</div>
				<div class="modal-body" id="gpsBody">
					<img id="img" src="/wymarket/image/carrotcharacter.png" alt="" />
					<div class="modal-body" id="gpsContent"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">닉네임 설정</h5>
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
					<p id="nick2Char">닉네임은 두 글자 이상이어야 합니다.</p>
					<p id="nickOverrap">이미 사용중인 닉네임입니다.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" onclick="toMain()">로그인하기</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="phoneClick" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">SMS 발송</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">SMS 인증번호가 발송되었습니다.</div>


				<div class="modal-footer" id="modalfooter">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="smsRetry" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">SMS 요청 실패</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">이미 발송되었습니다. 시간이 끝난 후 확인해주세요.</div>


				<div class="modal-footer" id="modalfooter">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="smsFail" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">SMS 인증 실패</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">SMS 인증번호가 일치하지 않습니다.</div>


				<div class="modal-footer" id="modalfooter">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="notPh" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">전화번호 형식 불일치</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">전화번호 형식이 아닙니다.</div>


				<div class="modal-footer" id="modalfooter">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="timeExceed" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">인증 시간 초과</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">인증 시간이 초과되었습니다. 다시 인증 요청하세요.</div>


				<div class="modal-footer" id="modalfooter">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
		<div class="modal fade" id="cntExceed" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">인증 횟수 초과</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">인증 횟수 3회 초과로 인하여 더 이상 인증하실 수 없습니다.</div>


				<div class="modal-footer" id="modalfooter">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
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

			const phonetext = document.getElementById('phonenumber');
			const phonebtn = document.getElementById('checkphone');

			const smstext = document.getElementById('sms');
			const smsbtn = document.getElementById('checksms');


			phonebtn.addEventListener('click',()=>{
				if(phonetext.value.length == 11){
					if(timeLimit == 60 || timeLimit == 0){
						
						ajaxGetSMS(phonetext.value);
						ajaxGetph(phonetext.value);
						
						setTimeout(function(){
							console.log("카운트 : " + "${smsCnt}");
							if("${smsCnt}" >= 2){
								var myModal = new bootstrap.Modal(document.getElementById('cntExceed'));
								myModal.show()	
							} else{
								timeLimit = 60;
								startTime();
								ajaxToNick();
								var myModal = new bootstrap.Modal(document.getElementById('phoneClick'));
								myModal.show()	
							}
				        }, 1000);
								
					} else{
						var myModal = new bootstrap.Modal(document.getElementById('smsRetry'));
						myModal.show()		
					}
				} else{
					var myModal = new bootstrap.Modal(document.getElementById('notPh'));
					myModal.show()
				}
				 
			});

			smsbtn.addEventListener('click',()=>{
				if(timeLimit == 0){
					var myModal = new bootstrap.Modal(document.getElementById('timeExceed'));
					myModal.show()
				} else{
				if(smstext.value == document.getElementById('getsmscode').value 
						&& phonetext.value == document.getElementById('getph').value && smstext.value != ""
						&& phonetext.value != ""){
					console.log(document.getElementById('getConfirm').value);
					if(document.getElementById('getConfirm').value == "0"){
						var myModal = new bootstrap.Modal(document.getElementById('staticBackdrop2'));
						myModal.show()
						document.getElementById('nickname').value = '';
						document.getElementById('nickOverrap').style.display = 'none';
						document.getElementById('nick2Char').style.display = 'none';
					} else {
	 					var form = document.createElement("form");
					    form.setAttribute("method", "get");
					    form.setAttribute("action", "./main");
						document.body.appendChild(form);
					    form.submit();
					}

				} else{
					var myModal = new bootstrap.Modal(document.getElementById('smsFail'));
					myModal.show()	
				}
				}
			});

			/* document.getElementById(phonetext.getAttribute('form')).submit(); */

function toMain() {
	const nickInput = document.getElementById("nickname");
	if (nickInput.value.length <= 1) {
		document.getElementById('nick2Char').style.display = 'block';
		document.getElementById('nickOverrap').style.display = 'none';
	} else {
		
		console.log("toMain console" + document.getElementById("userNickCheck").value);
		var checkvalue = <%=session.getAttribute("check")%>

		if (document.getElementById("userNickCheck").value == "1") {
			document.getElementById('nick2Char').style.display = 'none';
			document.getElementById('nickOverrap').style.display = 'block';
		} else {
 			ajaxNickUpdate();
			setTimeout(function(){
				var form = document.createElement("form");
				form.setAttribute("method", "get");
				form.setAttribute("action", "./main");
				document.body.appendChild(form);
				form.submit();
	        }, 1000);
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