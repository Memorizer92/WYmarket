<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
 <script type="text/javascript"
   src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script>
	$(function(){
		$("#btnSave").click(function(){
			var title = $("#ntitle").val();
			var content = $("#ncontent").val();
			var writer = $("#adminNick").val();
			if(title==""){
				alert("제목을 입력하세요");
				document.form1.title.focus();
				return;
			}
			if(content==""){
				alert("내용을 입력하세요");
				document.form1.content.focus();
				return;
			}
			if(writer==""){
				alert("이름을 입력하세요");
				document.form1.writer.focus();
				return;
			}
			//데이터 전송	 
		   document.form1.submit();   
			
		});
	})
</script>
</head>
<body>

<h2>공지사항 작성</h2>

<form method="post" name="form1" action="./insert">
	<div>
		제목
		<input name="ntitle" id="ntitle" size="80" placeholder="제목을 입력해주세요" />
	</div>
	<div>
		내용
		<textarea name="ncontent" id="ncontent" rows="20" cols="80" placeholder="내용을 입력해주세요" ></textarea>
	</div>
	<div>
		이름
		<input name="adminNick" id="adminNick" placeholder="이름을 입력해주세요" />
	</div>
	<div style="width:650px;  text-align: center;">
	<button type="button" id="btnSave">확인</button>
	<button type="reset" >취소</button>
	</div>


</form>











</body>
</html>