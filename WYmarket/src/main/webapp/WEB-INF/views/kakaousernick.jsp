<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 로그인 성공</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>
</head>
<body>
<h3>카카오 로그인 성공 후 닉네임 설정 페이지</h3>
 
 
닉네임 설정하고 wymarket시작하기 버튼 (모달)

모달띄우는거


카카오 로그아웃 후 메인페이지로 redirect 

<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">
  닉네임 설정 및 시작
</button>

<input type="text" id="userNickCheck" style="display: none" />

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
							id="userNick" name="userNick">
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
 
 <a href="https://kauth.kakao.com/oauth/logout?client_id=f5c99e47d61ce4b7e521d120e1f04199
&logout_redirect_uri=http://localhost:8080/wymarket/login">카카오톡 로그아웃 하기</a>
 
 	<script
		src="<%=application.getContextPath()%>/resources/assets/js/kakaousernick.js"></script>

	<script>
function toMain() {
	const nickInput = document.getElementById("userNick");
	if (nickInput.value.length <= 1) {
		alert("닉네임은 두 글자 이상이어야 합니다.");
	} else {
		console.log("toMain console" + document.getElementById("userNickCheck").value);
		if (document.getElementById("userNickCheck").value == "1") {
			alert("이미 존재하는 닉네임입니다.")
		} else {
 			ajaxNickUpdate();
 			var form = document.createElement("form");
			form.setAttribute("method", "get");
			form.setAttribute("action", "/wymarket/main");
			document.body.appendChild(form);
			form.submit(); 
		}

	}
}
			
	const nickname = document.getElementById('userNick');
	nickname.addEventListener('keyup', ()=> {
		ajaxNickCheck();
		console.log(nickname.value);
	});
</script>
</body>
</html>