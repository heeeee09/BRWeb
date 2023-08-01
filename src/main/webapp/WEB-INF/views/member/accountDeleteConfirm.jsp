<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>탈퇴 여부</title>
	    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	    <link rel="stylesheet" href="../resource/css/join_complite.css">
	    <link rel="stylesheet" href="../resource/css/reset.css">
	    <link rel="stylesheet" href="../resource/css/logo_nav_footer.css">
	    <style>
	        #listMove {
	            background-color: #402022;
	        }
	        #closebtn {
	            display: flex;
	            justify-content: center;
	        }
	        button {
	            width: 250px;
	            height: 80px;
	            margin: 10px;
	            margin-bottom: 180px;
	            border-radius: 50px;
	            font-size: 30px;
	            font-family: 'Nanum Gothic', sans-serif;
	            border: 0px;
	            font-weight: lighter;
	            color: white;
	            background-color: #F04DA3;
	            cursor: pointer !important;
	        }
	        #deleteBtn {
	            background-color: #402022;
	        }
	        #complite {
	        	margin-top: 160px;
	        	margin-bottom: 160px;
	        }
	    </style>
	</head>
	<body>
	    <div id="container">
	        <header>
	            <div id="logo">
	                <a href="#"><img id="logoimg" onclick="logoLink()" src="../resource/image/header_Logo.png" alt="로고이미지"></a>
	            </div>
	            <div id="login">
	            	<c:if test="${sessionScope.memberId eq null}">
	                <a href="#" onclick="loginLink()" style="color: #F04DA3">LOGIN</a>
	                </c:if>
	            	<c:if test="${sessionScope.memberId ne null}">
	                <a href="/member/logout.do" style="color: #F04DA3">LOGOUT</a>
	                </c:if>
	            </div>
	            <div id="mypage">
	                <a href="#" onclick="mypageLink()">MYPAGE</a>
	            </div>
	            <div id="basket">
	                <a href="#" onclick="basketLink()"><img  id="basketlink" src="../resource/image/header_Basket_Img.png" alt="장바구니 링크"></a>
	            </div>
	            <nav>
	                <ul id="menu">
	                    <li><a href="#" onclick="menuLink()">MENU</a></li>
	                    <li style="text-align: center;"><a href="#">영양정보 및 <br>알레르기</a></li>
	                    <li><a href="#">EVENT</a></li>
	                    <li><a href="#" onclick="storeLink()">STORE</a></li>
	                    <li><a href="#">BRAND</a></li>
	                    <li><a href="#">DELIVERY</a></li>
	                </ul>
	            </nav>
	        </header>
		        <section>
		        <form action="/member/deleteConfirm.do" method="post">
			        <p id="complite">정말 탈퇴하시겠습니까?<br>
			        	탈퇴 후 취소할 수 없습니다.</p>
			        <div id="closebtn">
			        <button id="deleteBtn" type="submit" value="탈퇴하기">탈퇴하기</button>
			        <button type="reset" onclick="backMyPage()">취소</button>
			        </div>
		        </form>
		        </section>
	        <footer class="flex">
	            <section>
	                <ul id="bottomMenu1" class="footers">
	                    <li><a href="#">1:1 문의</a></li>
	                    <li><a href="#">자주묻는질문</a></li>
	                    <li><a href="#">이용약관</a></li>
	                    <li><a href="#">개인정보처리방침</a></li>
	                    <li><a href="#">위치서비스기반이용약관</a></li>
	                </ul>
	                <ul id="bottomMenu2">
	                    <li>사업자 등록번호 : 303-81-09535 비알코리아(주) 대표이사 이주연
	                        서울특별시 서초구 남부순환로 2620(양재동 11-149번지)
	                    </li>
	                    <li>TEL : 080-555-3131 개인정보관이책임자 : 김경우</li>
	                    <li>Copyrightⓒ 2016 BRKOREA Company. All Rights Reserved.</li>
	                </ul>
	            </section>
	        </footer>
	    </div>
	    <script>
	        function logoLink() {
	            location.href = "/index.jsp"
	        }
	        function loginLink() {
	            location.href = "/member/login.do"
	        }
	        function mypageLink() {
	            location.href = "/member/myPage.do"
	        }
	        function basketLink() {
	            location.href = "./myBasket.html"
	        }
	        function menuLink() {
	            location.href = "../product/menu.html"
	        }
	        function storeLink() {
	            location.href = "../etc/storeSearch.html"
	        }
	        function backMyPage() {
	        	location.href = "/member/myPage.do";
	        }
	    </script>
	</body>
</html>