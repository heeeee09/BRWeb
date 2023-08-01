<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보 수정</title>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../resource/css/join.css">
    <link rel="stylesheet" href="../resource/css/reset.css">
    <link rel="stylesheet" href="../resource/css/logo_nav_footer.css">
    <style>
        #prevBtn {
            background-color: #402022;
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
            <div id="joinBox">
            <p>회원 정보 수정</p>
            <form action="/member/modify.do" method="post">
	            <div id="join_info">
	                <div id="id" class="infoBox">
	                    <label for="user-id" class="labels">아이디</label>
	                    <input type="text" value="${sessionScope.memberId }" readonly>
	                </div>
	                <div id="line"></div>
	                <div id="pw" class="infoBox">
	                    <label for="user-pw" class="labels">비밀번호</label>
	                    <input type="password" name="member-pw" placeholder="  수정할 비밀번호를 입력해주세요">
	                </div>
	                <div id="line"></div>
	                <div id="pw-confirm" class="infoBox">
	                    <label for="user-pw-confirm" class="labels">비밀번호 확인</label>
	                    <input type="password" placeholder="  수정할 비밀번호를 다시 입력해주세요">
	                </div>
	                <div id="line"></div>
	                <div id="name" class="infoBox">
	                    <label for="user-name" class="labels">이름</label>
	                    <input type="text"  value="${sessionScope.memberName }" readonly>
	                </div>
	                <div id="line"></div>
	                <div id="birthday" class="infoBox">
	                    <label for="user-birthday" class="labels">생년월일</label>
	                    <p>${sessionScope.memberBirth }</p>
	                </div>
	                <div id="line"></div>
	                <div id="gender" class="infoBox">
	                    <label for="user-gender" class="labels">성별</label>
						<input type="hidden" value="${sessionScope.memberGender }" name="member-gender" id="member-gender" readonly>
						<c:if test="${sessionScope.memberGender eq 'M'}" >남자</c:if>
						<c:if test="${sessionScope.memberGender eq 'F'}">여자</c:if>
	                </div>
	                <div id="line"></div>
	                <div id="email" class="infoBox">
	                    <label for="user-email" class="labels">이메일</label>
	                    <input type="text" name="member-email">
	                </div>
	                <div id="line"></div>
	                <div id="tell" class="infoBox">
	                    <label for="uer-tell" class="labels">연락처</label>
	                    <input type="text" name="member-phone">
	                </div>
	                <div id="line"></div>
	                <div id="address" class="infoBox">
	                    <label for="uer-address" class="labels">주소</label>
	                    <input type="text" name="member-address" >
	                </div>
	                <div id="line"></div>
	            </div>
	            <div id="button">
	                <button type="submit" value="수정하기">수정하기</button>
            </form>
<!--                 <button type="submit" value="수정하기"><a href="/user_Information_Modify_Complite.html" class="whiteFont">수정하기</a></button> -->
                <button type="submit" id="prevBtn"><a href="/member/myPage.do" class="whiteFont">이전 페이지로 이동</button></a>
            </div>
            </div>
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
    </script>
</body>
</html>