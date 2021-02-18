<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원가입/로그인</h2>

<%-- <%=application.getContextPath() %> --%>


		<input type="text" placeholder="휴대폰 번호를 입력해주세요" maxlength="11" 
			onkeypress="onlyNumber();" style="ime-mode: disabled;" id="phonenumber" 
			onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="${phonenumber }"> 
<!-- 		<button id="checkphone" data-btn-type="getsms" onclick="btnAction(this);">인증문자 받기</button> -->
				<button id="checkphone">인증문자 받기</button>
		
		<input type="text" placeholder="인증 번호를 입력해주세요" maxlength="6"
		onkeypress="onlyNumber();" style="ime-mode: disabled;" id="sms" 
			onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">

	<button id="checksms">동의하고 시작하기</button>
	
	<p id="time"></p>
	
<script>
const prefix = "<%=application.getContextPath() %>/rest/";

const phonetext = document.getElementById('phonenumber');
const phonebtn = document.getElementById('checkphone');

const smstext = document.getElementById('sms');
const smsbtn = document.getElementById('checksms');

if(performance.navigation.type == 1){
/* 	phonetext.value = null; */
	<% session.removeAttribute("smscodes"); session.removeAttribute("phonenumber");%>
} else{
	/* phonetext.value = "<c:out value='${phonenumber}'/>" */
}

if("<c:out value='${phonenumber}'/>" != ""){
	startTime();
}

phonebtn.addEventListener('click',()=>{
	if(phonetext.value.length == 11){
		if(timeLimit == 60 || timeLimit == 0){
			var form = document.createElement("form");
		    form.setAttribute("method", "post");
		    form.setAttribute("action", "./getsms/" + phonetext.value);
			document.body.appendChild(form);
		    form.submit();
		    alert("해당 번호로 인증번호가 발송되었습니다.");
		    console.log(phonetext.value);
		} else{
			alert("이미 인증 번호가 발송되었습니다. 잠시 후 다시 이용해주세요");
		}
	} else{
		alert("전화번호 형식이 아닙니다.")
	}
	 
});

smsbtn.addEventListener('click',()=>{
	console.log("<c:out value='${smscodes}'/>");
	console.log("<c:out value='${phonenumber}'/>");
	if(timeLimit == 0){
		alert("인증 시간이 초과되었습니다. 다시 인증해주세요")
	} else{
	if(smstext.value == "<c:out value='${smscodes}'/>" 
			&& phonetext.value == "<c:out value='${phonenumber}'/>" && smstext.value != ""
			&& phonetext.value != ""){
		var form = document.createElement("form");
	    form.setAttribute("method", "post");
	    form.setAttribute("action", "./usernick");
		document.body.appendChild(form);
	    form.submit();
	} else{
		alert('sms 인증 번호가 일치하지 않습니다.');
	}
	}
});

/* document.getElementById(phonetext.getAttribute('form')).submit(); */

function onlyNumber(){
	   if((event.keyCode<48)||(event.keyCode>57))
	      event.returnValue=false;
	}
	
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
<script src="<%=application.getContextPath() %>/resources/assets/js/login.js"></script>
</body>
</html>