<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script>
function formCheck() {
    var iimagepath = document.forms[0].iimagepath.value;
    var title = document.forms[0].title.value;
    var writer = document.forms[0].writer.value;
    var content = document.forms[0].content.value;
 
    if (title == null || title == "") {
        alert('제목을 입력하세요');
        document.forms[0].title.focus();
    }
    if(regdate.match(/^\d\d\d\d\d\d+$/ig) == null){
        alert('숫자 형식(6자리)으로 입력하세요');  
        document.forms[0].regdate.focus();                       
        return false;  
    }
    if (content == null || content == "") {
        alert('내용을 입력하세요');
        document.forms[0].content.focus();
        return false;
    }
}
</script>
<style>
.inputArea {
	margin: 10px 0;
}

select {
	width: 100px;
}

label {
	display: inline-block;
	width: 70px;
	padding: 5px;
}

label[for='icontent'] {
	display: block;
}

input {
	width: 150px;
}

textarea#icontent {
	width: 400px;
	height: 180px;
}

.select_img img { margin:20px 0; }

</style>

<title>상품등록</title>
</head>
<body>
	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp"%>
			</div>
		</header>
		<nav id="nav">
			<div id="nav_box">
				<%@ include file="../include/nav.jsp"%>
			</div>
		</nav>
		<section id="container">
			<div id="container_box">
				<h2>상품 등록</h2>

				<form action="./add" role="form" method="POST" autocomplete="off"  enctype="multipart/form-data">
					
					<div class="inputArea">
						<label for="iimagepath">상품 이미지</label>
						<input type="file" id="iimagepath" name="file" />
						<div class="select_img"><img src=""/></div>
						
						<script>
							$("#iimagepath").change(function(){
							   if(this.files && this.files[0]) {
							    var reader = new FileReader;
							    reader.onload = function(data) {
							     $(".select_img img").attr("src", data.target.result).width(500);        
							    }
							    reader.readAsDataURL(this.files[0]);
							   }
							  });
						</script>
						<p>아래 주소는 각 컴퓨터 마다 다르기 때문에 각자 값을 Value에 추가해주세요!</p>
						<%=request.getRealPath("/") %>
					</div>
					
					<div class="inputArea">
						<label for="ititle">상품명</label> <input type="text" id="ititle"
							name="ititle" />
					</div>
					<div class="inputArea">
						<label for="icategory">카테고리</label> <input type="text"
							id="icategory" name="icategory" />
					</div>
					
					<div class="inputArea">
						<label for="price">상품가격</label> <input type="text" id="price"
							name="price" />
					</div>
					
					<div class="inputArea">
						<label for="icontent">상품소개</label>
						<textarea rows="5" cols="50" id="icontent" name="icontent"></textarea>
					</div>
					
					<div class="inputArea">
						<button type="submit" id="register_Btn" class="btn btn-primary" onclick="check()">등록</button>
					</div>
					
				</form>
			</div>
		</section>
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp"%>
			</div>
		</footer>
	</div>

</body>
</html>