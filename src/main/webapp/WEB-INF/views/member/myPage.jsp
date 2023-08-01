<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../resource/css/myPage.css">
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
        <section>
            <div id="mypageBox">
                <div id="mypageList">
                    <div id="welcome">${sessionScope.memberName }님 <br>환영합니다</div>
                    <div id="line"></div>
                    <div class="mpList"><a href="./myBasket.html">장바구니</a></div>
                    <div class="mpList"><a href="/member/modify.do?${sessionScope.memberId }">회원정보 수정</a></div>
                    <div class="mpList"><a href="/member/delete.do">회원탈퇴</a></div>
                    <div class="mpList"><a href="/member/noticeList.do">1:1문의 내역</a></div>
                </div>
                <div id="linecol"></div>
                <div>
                    <div id="mpMain">
                        <p id="mpMain1">최근 주문내역</p>
                        <p id="mpMain2">최근 3개월 내의 주문내역입니다.</p>
                        <button id="recentbtn" value="이전내역">이전내역보기</button>
                    </div>
                    <div>
                        <table>
                            <tr id="list1">
                                <th>수령방법</th>
                                <th>주문일자</th>
                                <th>주문명</th>
                                <th>가격</th>
                                <th>상세보기</th>
                            </tr>
                            <tr>
                                <td>배달</td>
                                <td>2023-05-24</td>
                                <td>싱글레귤러 <br>외 2건</td>
                                <td>10,500</td>
                                <td><button class="detailbtn">상세보기</button></td>
                            </tr>
                            <tr>
                                <td>포장</td>
                                <td>2023-04-06</td>
                                <td>하프갤런</td>
                                <td>29,000</td>
                                <td><button class="detailbtn">상세보기</button></td>
                            </tr>
                            <tr>
                                <td>포장</td>
                                <td>2023-03-14</td>
                                <td>골라먹는<br>스노우볼</td>
                                <td>28,000</td>
                                <td><button class="detailbtn">상세보기</button></td>
                            </tr>
                        </table>
                    </div>
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