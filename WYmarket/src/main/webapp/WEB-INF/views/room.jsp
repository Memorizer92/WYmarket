<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>채팅 서비스</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


</head>
<body>
<input type="text" id="nickname" placeholder="닉네임을 입력해주세요" />
<button id="name">확인</button>

<div><b>방 이름: </b>${room.name }</div>
<div><b>방 번호: </b>${room.roomId }</div>


<input type="text" id="nickname" class="form-inline" placeholder="닉네임을 입력해주세요" required autofocus>
<button class = "btn btn-primary" id = "name">확인</button>
<label for="roomId" class="label label-default">방 번호</label>
<label th:text="*{room.roomId}" id="roomId" class="form-inline"></label>
<br>
<label for="roomName" class="label label-default">방 이름</label>
<label th:text="*{room.name}" id="roomName" class="form-inline"></label>
<div id = "chatroom" style = "width:400px; height: 600px; border:1px solid; background-color : gray"></div>
<input type = "text" id = "message" style = "height : 30px; width : 340px" placeholder="내용을 입력하세요" autofocus>
<button class = "btn btn-primary" id = "send">전송</button>


 <input type="button" id="exit" value="퇴장" /><br />

<script>

</script>
</body>
<script th:inline = "javascript">
    var webSocket;
    var nickname;
     
    var roomId = "${room.roomId}";
 
    
    document.getElementById("name").addEventListener("click",function(){
        nickname = document.getElementById("nickname").value;
        document.getElementById("nickname").style.display = "none";
        document.getElementById("name").style.display = "none";
        connect();
    })
    document.getElementById("send").addEventListener("click",function(){
        send();
    })
    document.getElementById("exit").addEventListener("click", function() {
		 
		disconnect();
	});
    function connect(){
        webSocket = new WebSocket("ws://localhost:8080/wymarket/socket/websocket");
        webSocket.onopen = onOpen; 
        webSocket.onmessage = onMessage;
        webSocket.onclose = onClose;
    }
    function disconnect(){
    	//{"chatRoomId":"45513046-41fc-4b38-a707-ab163048e3e1","type":"ENTER","writer":"ㅇㅇ"}

	    webSocket.send(JSON.stringify({chatRoomId : roomId,type:'LEAVE',writer:nickname})); 
        webSocket.close();
    }
    function send(){
     
        msg = document.getElementById("message").value;
        webSocket.send(JSON.stringify({chatRoomId : roomId,type:'CHAT',writer:nickname,message : msg}));
        document.getElementById("message").value = "";
    }
    function onOpen(){ 
        webSocket.send(JSON.stringify({chatRoomId : roomId,type:'ENTER',writer:nickname}));
    }
    function onMessage(e){
        data = e.data;
        chatroom = document.getElementById("chatroom");
        chatroom.innerHTML = chatroom.innerHTML + "<br>" + data;
    }
    function onClose(){
         
    }

</script>
</html>