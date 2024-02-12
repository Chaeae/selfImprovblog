<%--
  Created by IntelliJ IDEA.
  User: Hyundae HAN
  Date: 2024-02-09
  Time: 오후 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/resources/css/home.css">
    <%--    boxicons css--%>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
<div id="totalWrapper">
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
                        <a href="/board/save">
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
            <div class="container">
                <c:forEach items="${boardList}" var="board">
                    <div class="ele" onclick="location.href='/board?id=${board.post_id}';">
                        <div class ="contentBox">
                            <div class="subbox1">
                                <img class="boardImg" src="" alt="">
                            </div>
                            <div class="subbox2">
                                    <span class="date">
                                            <fmt:formatDate value="${board.post_postDate}" pattern="yyyy.MM.dd. HH:mm"/>
                                        </span>
                                <p class="writerID">${board.post_author}</p>
                                <br>
                                <h2 class="heading">${board.post_title}</h2>
                                <br>
                                <p class="texts" >
                                        ${board.post_contents}
                                        <%--                                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. 만약에 문장이 엄청 ㅇ길어지면 이거 넘어가는지 테스트akdjlfjsljdlfjsljflksdfkskjflsjlfskdfjksjlfkajldkfj;slfiowlkdflksjfoiwejfjlejfd 여기서 더길어지면 세줄 넘는데 이게 되는지 한번 테스트 해보기 이정도면 됐으려나 마지막한번더 한줄--%>
                                </p>
                                <a href="/board?id=${board.post_id}">더보기</a>
                                <div class="data">
                                    <i class='bx bx-show-alt iconData'></i>
                                    <span class="hits">${board.post_viewNum}</span>
                                    <i class='bx bxs-heart iconData'></i>
                                    <span class="likes">${board.post_likeNum}</span>

                                </div>
                            </div>

                        </div>
                    </div>
                </c:forEach>

            </div>








        </div>
    </div>
</div>
<footer></footer>

</body>
</html>
