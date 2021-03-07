<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<title>kubg</title>

<style>
	section#content ul li { display:inline-block; margin:10px; padding-left: 55px}
	section#content div.iimagepath img { width:200px; height:200px; }
	section#content div.ititle { padding:10px 0; text-align:center; }
	section#content div.ititle a { color:#000; }
</style>
	
</head>
<body>
<div id="root">
	
	<section id="container">
		<div id="container_box">
		
			<section id="content">
				
				<ul>
					<c:forEach items="${goods}" var="goods">
					<li>
						<div class="iimagepath">
						<a href="goods/view?n=${goods.itemID}">
							<img src="${pageContext.request.contextPath}${goods.simagePath}">
						</a>
						</div>	
						<div class="ititle">
							${goods.stitle}
						</div>
						<div class="icategory">
							${goods.scategory}
						</div>
						<div class="price">
							<fmt:formatNumber value="${goods.price}" pattern="###,###,###"/>
						</div>
						<div class="refreshtime">
							<fmt:formatDate value="${goods.refreshTime}" pattern="yyyy-MM-dd"/>
						</div>
					</li>
					</c:forEach>
				</ul>

			</section>
	
			
		</div>
	</section>

</div>
</body>
</html>