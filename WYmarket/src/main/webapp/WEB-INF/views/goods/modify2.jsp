<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
 <link rel="icon" href="<%=application.getContextPath() %>/image/salef.ico">
 <link rel="shortcut icon" href="<%=application.getContextPath() %>/image/salef.ico">
 <link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/register.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
function inputCheck() {
    /* var iimagepath = document.form.iimagepath.value; */
    const iimagepath = document.getElementById("iimagepath").value;
    const ititle = document.getElementById("ititle").value;
    const icg = document.getElementById("icategory");
    const icategory = icg.options[icg.selectedIndex].value;
    const icontent = document.getElementById("icontent").value;
    const price = document.getElementById("price").value;
    
    /* if (iimagepath == null || iimagepath == "") {
        alert('이미지를 등록해주세요');
        document.form.iimagepath.focus();
        return;
    } */
    if (ititle == null || ititle == "") {
        alert('제목을 입력해주세요');
        document.form.ititle.focus();
        return;
    }
    if (icategory == null || icategory == "전체") {
        alert('카테고리를 선택해주세요');
        document.form.icategory.focus();
        return;
    }
    if (price == null || price == ""){
        alert('가격을 입력해주세요');  
        document.form.price.focus();                       
        return;  
    }
    if (price.match(/^[0-9]*$/ig) == null){
        alert('숫자만 입력해주세요');  
        document.form.price.focus();                       
        return;  
    }
    if (price <= 100){
    	alert('100원 이상 입력해주세요');  
        document.form.price.focus();                       
        return;  
    }
    if (icontent == null || icontent == "") {
        alert('내용을 입력해주세요');
        document.form.icontent.focus();
        return;
    }
    document.form.submit();
}
</script>


<title>상품등록</title>
</head>
<body>
	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp"%>
			</div>
		</header>
		<section class="container">
			<h2>상품 등록</h2>
			<form action="./add" role="form" method="POST" name="form"
				 autocomplete="off"  enctype="multipart/form-data">
				<input type="hidden" name="itemid" value="${goods.itemid}" />
				<ul class="sc-as a1">
					<li class="sc-ve a2">
						<div class="sc-Dr a311">상품이미지</div>
						<div class="sc-ge a32">
							<ul class="sc-ht a4">
								<li class="sc-tr a51"><!-- 이미지 등록하는 버튼 -->
									이미지 등록
									<input type="file" id="iimagepath" name="file"
									accept="image/jpg, image/jpeg, image/png" />
								</li>
								<li draggable="false" class="sc-bn a52" id="sc-bn a52">
									<div class="select_img" id="select_img">
										<img src="${pageContext.request.contextPath}${goods.iimagepath }" />
										<input type="hidden" id="iimagepath" name="iimagepath" 
										value="${pageContext.request.contextPath}${goods.iimagepath }" />
									</div>
									<script>
										$("#iimagepath").change(function(){
										   if(this.files && this.files[0]) {
										    var reader = new FileReader;
										    reader.onload = function(data) {
										     $(".select_img img").attr("src", data.target.result).width(200);        
										    }
										    reader.readAsDataURL(this.files[0]);
										   }
										  });
									</script>
								</li>
							</ul>
						</div>
					</li>
					<li class="sc-ve a2">
						<div class="sc-Dr a311">상품명</div>
						<div class="sc-Ge a322">
							<input type="text" id="ititle" 
							name="ititle" value="${goods.ititle}"/>
						</div>
					</li>
					<li class="sc-ve a2">
						<div class="sc-Ww a3111">카테고리</div>
						<div class="sc-Vv a3222">
							<select id="icategory" name="icategory" >
								<option selected>${goods.icategory}</option>
								<option>여성의류</option>
								<option>패션잡화</option>
								<option>남성의류</option>
								<option>디지털/가전</option>
								<option>도서/티켓/취미/애완</option>
							</select>
						</div>
					</li>
					<li class="sc-ve a2"> <!-- 가격 -->
						<div class="sc-TE a3111">가격</div>
						<div class="sc-Ge a322">
							<input type="text" id="price" name="price" value="${goods.price}"/>
						</div>
					</li>
					<li class="sc-ve a2"> <!-- 소개 -->
						<div class="sc-TE a3111">상품 설명</div>
						<div class="sc-Ge a322">
							<textarea rows="6" cols="50" id="icontent" name="icontent" class="sc-HA a4">${goods.icontent}</textarea>
						</div>
					</li>
					<li class="sc-ve a2">
						<div class="sc-Ff a33">
							<input type="button" id="update_Btn" value="완료" onclick="inputCheck()" />
							<button type="button" id="back_Btn" class="btn btn-warning">취소</button>
							<script>
								$("#back_Btn").click(function(){
									history.back();
								});
							</script>
						</div>
					</li>
				</ul>
			</form>
		</section>
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp"%>
			</div>
		</footer>
	</div>

</body>
</html>