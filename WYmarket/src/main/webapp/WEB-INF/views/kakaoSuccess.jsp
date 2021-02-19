<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 로그인 성공</title>
</head>
<body>
<h3>카카오 로그인 성공 페이지</h3>
 
 
<script>
if( ${confirm}==0){
	alert("닉네임을 설정해주세요");
} 
</script> 

<c:choose>  
<c:when test="${confirm eq 0 }">

<form action="join" method="get"> 
<input type="text" name="userNick" id="UserNick"/>
<input type="submit" value="확인" />
</form>

</c:when>
<c:otherwise>
로그인 중입니다.
<a href="https://kauth.kakao.com/oauth/logout?client_id=f5c99e47d61ce4b7e521d120e1f04199
&logout_redirect_uri=http://localhost:8080/wymarket/auth/kakao/logout">로그아웃 하기</a>
</c:otherwise>
</c:choose>
 
 
 
 
 
  
</body>
</html>