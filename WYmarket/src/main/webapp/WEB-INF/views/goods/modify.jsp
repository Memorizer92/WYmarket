<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
function inputCheck() {
    var iimagepath = document.updateForm.iimagepath.value;
    var ititle = document.updateForm.ititle.value;
    var icategory = document.updateForm.icategory.value;
    var price = document.updateForm.price.value;
    var icontent = document.updateForm.icontent.value;
    //var length = document.regForm.length - 1;

    if (iimagepath == null || iimagepath == "") {
        alert('상품 이미지를 선택해주세요');
        document.updateForm.title.focus();
        return;
    }
    if (ititle == null || ititle == "") {
        alert('제목을 입력해주세요');
        document.updateForm.ititle.focus();
        return;
    }
    if (icategory == null || icategory == "") {
        alert('카테고리를 선택해주세요');
        document.updateForm.icategory.focus();
        return;
    }
    if(price == null || price == ""){
        alert('가격을 입력해주세요');  
        document.updateForm.price.focus();                       
        return;  
    }
    if(price.match(/^[0-9]*$/ig) == null){
        alert('숫자만 입력해주세요');  
        document.updateForm.price.focus();                       
        return;  
    }
    if (icontent == null || icontent == "") {
        alert('내용을 입력해주세요');
        document.updateForm.content.focus();
        return;
    }
    document.updateForm.submit();
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

.select_img img {
	margin: 20px 0;
}
</style>

<title>상품수정</title>
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

				<form role="form" method="POST" name="updateForm"
					autocomplete="off" enctype="multipart/form-data">
					
					<input type="hidden" name="itemid" value="${goods.itemid}" />

					<div class="inputArea">
						<label for="iimagepath">상품 이미지</label>
						<img src="${pageContext.request.contextPath}${goods.iimagepath }" />
					</div>
					
					<div class="inputArea">
						<label for="ititle">상품명</label>
						<input type="text" id="ititle" name="ititle" value="${goods.ititle}"/>
					</div>
					<div class="inputArea">
						<label for="icategory">카테고리</label>
						<span>${goods.icategory}</span>
					</div>
					
					<div class="inputArea">
						<label for="price">상품가격</label>
						<input type="text" id="price" name="price" value="${goods.price}"/>
						<%-- <span><fmt:formatNumber value="${goods.price}" pattern="###,###,###"/></span> --%>
					</div>
					
					<div class="inputArea">
						<label for="icontent">상품소개</label>
						<input type="text" id="icontent" name="icontent" value="${goods.icontent}"/>
					</div>
					

					<div class="inputArea">
						<input type="button" id="update_Btn" value="완료" onclick="inputCheck()" />
						<button type="button" id="back_Btn" class="btn btn-warning">취소</button>
						<script>
							$("#back_Btn").click(function(){
								history.back();
							});
						</script>
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