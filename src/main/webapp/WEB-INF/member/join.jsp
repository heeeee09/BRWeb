<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../resource/css/join.css">
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
                <a href="#" onclick="loginLink()" style="color: #F04DA3">LOGIN</a>
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
            <form action="/member/registor.do" method="post">
            <div id="joinBox">
            <p>회원가입</p>
            <div id="join_info">
                <div id="id" class="infoBox">
                    <label for="user-id" class="labels">아이디</label>
                    <input type="text" name="member-id" placeholder="  아이디를 입력해주세요">
                </div>
                <div id="line"></div>
                <div id="pw" class="infoBox">
                    <label for="user-pw" class="labels">비밀번호</label>
                    <input type="password" name="member-pw" placeholder="  비밀번호를 입력해주세요">
                </div>
                <div id="line"></div>
                <div id="pw-confirm" class="infoBox">
                    <label for="user-pw-confirm" class="labels">비밀번호 확인</label>
                    <input type="password" name="member-pw-config" placeholder="  비밀번호를 다시 입력해주세요">
                </div>
                <div id="line"></div>
                <div id="name" class="infoBox">
                    <label for="user-name" class="labels">이름</label>
                    <input type="text" name="member-name" placeholder="  이름을 입력해주세요">
                </div>
                <div id="line"></div>
                <div id="birthday" class="infoBox">
                    <label for="user-birthday" class="labels">생년월일</label>
                    <input type="date" name="member-birthday" >
                </div>
                <div id="line"></div>
                <div id="gender" class="infoBox">
                    <label for="user-gender" class="labels">성별</label>
                    <input type="radio" name="member-gender" value="M" id="male"><label for="male" id="genderM"> 남 </label>
                    <input type="radio" name="member-gender" value="F" id="female"><label for="female" id="genderF"> 여 </label>
                </div>
                <div id="line"></div>
                <div id="email" class="infoBox">
                    <label for="user-email" class="labels">이메일</label>
                    <input type="text" name="member-email" >
                </div>
                <div id="line"></div>
                <div id="tell" class="infoBox">
                    <label for="uer-tell" class="labels">연락처</label>
                    <input type="text" name="member-phone" >
                </div>
                <div id="line"></div>
                <div id="address" class="infoBox">
                    <label for="uer-address" class="labels">주소</label>
                    <input type="text" name="member-address" >
                </div>
                <div id="line"></div>
            </div>
            <div id="button">
                <button type="submit" value="가입하기">회원가입</a></button>
<!--                 <a href="./join_Complite.html" class="whiteFont"> -->
            </div>
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
            location.href = "../index.jsp"
        }
        function loginLink() {
            location.href = "./login.jsp"
        }
        function mypageLink() {
            location.href = "./myPage.jsp"
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