<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../resource/css/login.css">
    <link rel="stylesheet" href="../resource/css/reset.css">
    <link rel="stylesheet" href="../resource/css/logo_nav_footer.css">
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
        <main>
            <section id="login-field">
	            <p>로그인</p>
            	<form action="/member/login.do" method="post">
	                <div id="loginBox">
	                    <div class="id">
	                        <label for="user-id">아이디</label>
	                        <div>
	                            <input type="text" name="member-id" placeholder="  아이디를 입력하세요">
	                        </div>
	                    </div>
	                    <div id="line"></div>
	                    <div class="password">
	                        <label for="user-pw">비밀번호</label>
	                        <div>
	                            <input type="password" name="member-pw" placeholder="  비밀번호를 입력하세요">
	                        </div>
	                    </div>
	                    <div id="line"></div>
	                    <button id="loginbtn" type="submit">로그인</button></a>
	                </div>
                </form>
                	     <a href="/member/registor.do"><button id="pwbtn">회원가입</button></a>
            </section>
        </main>
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
            location.href = "/product/menu.html"
        }
        function storeLink() {
            location.href = "../etc/storeSearch.html"
        }
//         function success() {
//             let left = (screen.availWidth -400) / 2;
//             let top = (screen.availHeight -300) / 2;
//             var viewOpt = "left=" + left + ", top=" + top + ", width=400, height=300";
//             window.open("/popup/loginSuccess.jsp","", viewOpt)
//         }
    </script>
</body>
</html>