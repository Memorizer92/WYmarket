<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입 완료</title>
</head>
<body>

닉네임 : <%=session.getAttribute("nick") %>
 

<a href="https://kauth.kakao.com/oauth/logout?client_id=f5c99e47d61ce4b7e521d120e1f04199
&logout_redirect_uri=http://localhost:8080/wymarket/login">카카오톡 로그아웃 하기</a>


</body>
</html>