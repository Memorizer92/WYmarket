<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="icon" href="../image/wyfavicon.ico">
    <link rel="shortcut icon" href="../image/wyfavicon.ico">
    <title>header</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
        crossorigin="anonymous"></script>
    <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>

    <style>
        * {
            box-sizing: border-box;
        }



        .dropbtn {
            background-color: rgb(224, 123, 40);
            color: white;
            padding: 16px;
            font-size: 16px;
            border: none;
            cursor: pointer;
            width: 100px;

        }

        .dropdown {
            position: relative;
            float: left;
            margin-right: 20px;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color: rgb(231, 149, 149);
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown:hover .dropbtn {
            background-color: #1b5ac2;
        }

        .logo {
            float: left;
            margin-right: 20px;
            margin-top: 20px;
        }

        .search {
            height: 48px;
            width: 450px;
            border: 2px solid #1b5ac2;
            background: #ffffff;
            margin-right: 0px;
            float: left;
            margin-right: 20px;
            margin-top: 20px;
        }

        .searchinput {
            font-size: 16px;
            width: 370px;
            padding: 10px;
            border: 0px;
            outline: blue;
            float: left;

        }

        .searchbtn {
            margin-left: 18px;
            width: 60px;
            height: 45px;
            border: 0px;
            background: #1b5ac2;
            outline: none;
            float: right;
            color: #ffffff;
            ;

        }

        .sale {
            color: #1b5ac2;;
            float: left;
            margin-top: 20px;
            margin-right: 20px;
        }

        .mypage {
            color: #1b5ac2;;
            float: left;
            margin-top: 20px;
              margin-right: 20px;
        }
	.chat{
	color: #1b5ac2;;
            float: left;
            margin-top: 20px;
	
	}
        .mid {
            font-size: 20px;
        }

        .big {
            font-size: 30px;
        }

        .biggest {
            font-size: 40px;
        }

        .navis { 
        padding-top: 10px;
            width: 1130px;
            margin-left: auto;
            margin-right: auto;
            display: flex;
            flex-direction: row;
            flex-wrap: nowrap;
            justify-content: center; 
        }

        .head1 {
            width: 100%;
            background-color: rgb(241, 239, 235);
        }

        menu {
            margin: 0px;
            list-style: none;

        }

        .nick {
            position: relative;
            float: left;
            padding-right: 9px;
            width: 80px;
        }

        .search {
            display: flex;
            flex-direction: row;
            flex-wrap: nowrap;
        }

        .head2 {
            width: 1130px;
            display: flex;
            flex-direction: row;
            flex-wrap: nowrap;
            justify-content: flex-end; 
        }

         
        a{ 
            text-decoration: none;
            color: black;
        }

        .tt{
            
         padding: 15px;
             
        }
        .test{
    border-bottom: 2px solid rgb(244, 244, 250);
             padding: 6px;}
	.myStor:hover{
		color: gray;
	}
    </style>
</head>
<body>

    <article class="head1">
        <menu>
            <div class="head2 container-xl">
                <li class="nick"><strong>${userNick}</strong>님</li>
              	<li id = "myStore" class="nick myStor" style="cursor: pointer;"><strong>내 상점</strong></li>
                <li id="kakaoLogout" class="logout">로그아웃</li>
            </div>
        </menu>
    </article>

    <div class="navis container-xl">

        <div class="dropdown">
            <button class="dropbtn"><i class="fas fa-bars fontsize big"></i><br>카테고리</button>
            <div class="dropdown-content">
                <a href="/wymarket/main?category=전체">전체</a>
                <a href="/wymarket/main?category=남성의류">남성의류</a>
                <a href="/wymarket/main?category=전자기기">전자기기</a>
                <a href="/wymarket/main?category=기타">기타</a>
            </div>
        </div>

        <a class="logo" href="/wymarket/main">
            <img src="<%=application.getContextPath() %>/image/wylogo.jpg" alt="" width="160" height="45">
        </a>
        
  <form action="/wymarket/main" method="get">
        <div class="search">
            <input class="searchinput" type="text" name="search" placeholder="검색어 입력">
            <button class="searchbtn"><i class="fas fa-search mid"></i></button>
        </div>
  </form>
  
        <a class="sale" href="/wymarket/goods/register"><i class="fas fa-won-sign biggest"></i></a>
        <a class="mypage" href=""><i class="fas fa-user biggest"></i></a>
		<a class="chat" href="/wymarket/chats/chatting"><i class="far fa-comments biggest"></i></a>
    </div>
<div class = "test"></div>
 
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/main.js"></script>
 
</body>
<script>
	 document.getElementById('kakaoLogout').addEventListener('click',()=>{
				ajaxLogOut();
 				setTimeout(function(){
					window.location.href = "https://kauth.kakao.com/oauth/logout?client_id=f5c99e47d61ce4b7e521d120e1f04199&logout_redirect_uri=http://localhost:8080/wymarket/login";
		        }, 1000); 
			});
	 document.getElementById('myStore').addEventListener('click',()=>{				
		 
		 location.href = '<%=application.getContextPath()%>/param/myPage';
			});
		 
	</script>
</html>