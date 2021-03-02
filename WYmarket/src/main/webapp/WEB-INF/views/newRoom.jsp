<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset = UTF-8" />
    <title>채팅 서비스</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>

<body>

<div class="container">

    <form class="form-signing" action="./room/new" th:object="${form}" method= "post">
        <h2 class="form-signing-heading">새로운 채팅방 생성</h2>
        <label for="name" class="sr-only">채팅방 이름</label>
        <input type="text" th:field="*{name}" id="name" class="form-control" placeholder="채팅방 이름을 입력해주세요" required autofocus>
        <br>
        <button class="btn btn-primary" type="submit">생성하기</button>
        <button class="btn btn-danger"  onclick = "location.href='/wymarket/socket'">돌아가기</button>
    </form>


</div> <!-- /container -->

<hr>
<h3>채팅방 생성</h3>
<form action="./room/new" method="post">
채팅방 이름 : <input type="text" name="name">
<input type="submit" value="방 생성하기">
</form>



</body>
</html>