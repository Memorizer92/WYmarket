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
	 
		$("#btnBack").click(function(){
			 
			location.href = "/wymarket/board/list";
			
		});
	});
 </script> 
  
</head>
<body>

	 
		<div>
			작성일자 : <fmt:formatDate value="${vo.ndate}" pattern="yyyy-MM-dd a HH:mm:ss"/>
		</div>
		<div>
			조회수 :${vo.nviewcnt}
		</div>
		<div>
			제목 :${vo.ntitle}
			 
		</div>
		<div>
			내용 : ${vo.ncontent}
			 
		</div>
		<div>
			이름 : ${vo.adminNick}
		</div>
		 
		 <button type="button" id="btnBack">목록으로 가기</button>
 

</body>
</html>