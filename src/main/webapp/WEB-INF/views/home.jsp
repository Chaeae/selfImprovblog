<%--
  Created by IntelliJ IDEA.
  User: Hyundae HAN
  Date: 2024-02-09
  Time: 오후 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="resources/css/home.css">
<%--    boxicons css--%>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <div class="wrap">
        <div class="intro_bg">
            <div class ="header">
                <div id="logo">
                    <img src="/resources/image/improvLogo.png" width="81px" height="86px">
                </div>
<%--                <div class="searchArea">--%>
<%--                    <form>--%>
<%--                        <input type="search" placeholder="Search">--%>
<%--&lt;%&ndash;                        <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">&ndash;%&gt;--%>
<%--                        <span>검색</span>--%>
<%--                    </form>--%>
<%--                </div>--%>
                <ul class="upperNav">
                    <li><a href="#">인문학</a></li>
                    <li><a href="#">철학</a></li>
                    <li><a href="#">IT</a></li>
                    <li><a href="#">언어</a></li>
                </ul>

            </div>
        </div>
    </div>

    <nav class="sidebar">
        <header>

        </header>

        <div class="menu-bar">
            <div class="menu">
                <div class="circle">
                    <img class="profile" src="/resources/image/profileImg.jpg" alt="profile">
                </div>
                <div class="confirm">
                    chaeae 님 안녕하세요
                </div>
                <ul class="menu-links">
                    <li class="nav-link">
                        <a href="#">
                            <i class='bx bx-home icon'></i>
                            <span class="text nav-text">마이 홈</span>
                        </a>
                    </li>
                </ul>
                <ul class="menu-links">
                    <li class="nav-link">
                        <a href="#">
                            <i class='bx bx-edit-alt icon'></i>
                            <span class="text nav-text">새 글 작성</span>
                        </a>
                    </li>
                </ul>
            </div>

            <div class="bottom-content">
                <li class="">
                    <a href="#">
                        <i class='bx bx-log-out icon'></i>
                        <span class="text nav-text">로그아웃</span>
                    </a>
                </li>
            </div>

        </div>

    </nav>
    <div>
        <div class="box">
            <li class ="contentSearch">
                <i class='bx bx-search iconSearch'></i>
                    <input type="search" placeholder="Search">
            </li>
            <li class ="contentBox">
                <span>
                    <img class="boardImg" src="/resources/image/profileImg.jpg" alt="">
                </span>
                <span>
                    <h1 class="heading">HELLO WORLD!</h1>
                    <div class="data">
                        <span class="date">2024-02-11</span>
                        <span class="user-id">user ID</span>
                    </div>
                    <p class="texts">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit.
                    </p>
                </span>

            </li>



        </div>
    </div>
    <input type="input" class="bubble-element Input a1707626588944x4477" placeholder="Popular" maxlength="">

</body>
</html>
