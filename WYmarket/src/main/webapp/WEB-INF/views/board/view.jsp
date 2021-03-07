<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"   %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
 <script type="text/javascript"  src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
 <script>
 $(function(){
		$("#btnDelete").click(function(){
			if(confirm("삭제하시겠습니까?")){
				document.form1.action="./delete";
				document.form1.submit();
			}
		});
		
		$("#btnUpdate").click(function(){
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
			document.form1.action="./update";
			document.form1.submit();
			
		});
	});
 </script> 
  
</head>
<body>

	<form method="post" name="form1">
		<div>
			작성일자 : <fmt:formatDate value="${vo.ndate}" pattern="yyyy-MM-dd a HH:mm:ss"/>
		</div>
		<div>
			조회수 :${vo.nviewcnt}
		</div>
		<div>
			제목
			<input name="ntitle" id="ntitle" size="80" value="${vo.ntitle}" placeholder="제목을 입력해주세요" />
		</div>
		<div>
			내용
			<textarea name="ncontent" id="ncontent" rows="20" cols="80" placeholder="내용을 입력해주세요" >${vo.ncontent}</textarea>
		</div>
		<div>
			이름
			<input name="adminNick" id="adminNick" value="${vo.adminNick}" placeholder="이름을 입력해주세요" />
		</div>
		<div style="width:650px; text-align: center;">
			<input type="hidden" name="noticeID" value="${vo.noticeID }" />
			<button type="button" id="btnUpdate">수정</button>
			<button type="button" id="btnDelete">삭제</button>
		</div>
	</form>  

</body>
</html>