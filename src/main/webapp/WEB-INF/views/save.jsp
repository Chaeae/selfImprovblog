
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.sql.*" %>

<%
    String userId = null;
    Integer userPk = null;
    Cookie[] cookies = request.getCookies(); // 요청으로부터 쿠키 배열 가져오기
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("user_ID".equals(cookie.getName())) {
                userId = cookie.getValue();
                request.setAttribute("userId", userId);
            }
            else if ("user_pk".equals(cookie.getName())) {
                userPk = Integer.parseInt(cookie.getValue());
                request.setAttribute("userPk", userPk);
            }
        }
    }
    else{
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Save</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/resources/css/save.css">
    <%--    boxicons css--%>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <!-- feather icon -->
    <script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>

</head>
<body>
<div id="totalWrapper">
    <div class="wrap">
        <div class="intro_bg">
            <div class ="header">
                <%--                <div id="logo">--%>
                <%--                    <img src="/resources/image/improvLogo.png" width="81px" height="86px">--%>
                <%--                </div>--%>
                <%--                &lt;%&ndash;                <div class="searchArea">&ndash;%&gt;--%>
                <%--                &lt;%&ndash;                    <form>&ndash;%&gt;--%>
                <%--                &lt;%&ndash;                        <input type="search" placeholder="Search">&ndash;%&gt;--%>
                <%--                &lt;%&ndash;&lt;%&ndash;                        <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">&ndash;%&gt;&ndash;%&gt;--%>
                <%--                &lt;%&ndash;                        <span>검색</span>&ndash;%&gt;--%>
                <%--                &lt;%&ndash;                    </form>&ndash;%&gt;--%>
                <%--                &lt;%&ndash;                </div>&ndash;%&gt;--%>
                <%--                <ul class="upperNav">--%>
                <%--                    <li><a href="#">인문학</a></li>--%>
                <%--                    <li><a href="#">철학</a></li>--%>
                <%--                    <li><a href="#">IT</a></li>--%>
                <%--                    <li><a href="#">언어</a></li>--%>
                <%--                </ul>--%>

                <%--            </div>--%>
            </div>
        </div>
    </div>


    <nav class="sidebar">
        <header>
            <div class="image-text" onclick="location.href='/board/home/';">
                        <span class="imageHome">
                            <img src="/resources/image/homelogoB.png" alt="logo">
                        </span>
                <div class="header-text">
                    <span class="homeName">SelfImprovment</span>
                    <span class="Blog">Blog</span>
                </div>
            </div>
        </header>
        <div class="menu-bar">
            <div class="menu">
                <div class="circle">
                    <img class="profile" src="/resources/image/free-icon-user.png" alt="profile">
                </div>
                <div class="confirm">
                    <% if (userId != null) { %>
                    <%= userId %> 님 안녕하세요
                    <% } else { %>
                    게스트님 안녕하세요
                    <% } %>
                </div>
                <ul class="menu-links">
                    <li class="nav-link">
                        <a href="board/home/myhome/">
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
                    <a href="/user/logout">
                        <i class='bx bx-log-out icon'></i>
                        <span class="text nav-text">로그아웃</span>
                    </a>
                </li>
            </div>

        </div>

    </nav>

    <div class="board_wrap">
        <div class="board_title">
            <strong>새 글 작성</strong>
        </div>
        <form id='frm' action="/board/save" method="post">
            <div class="board_write_wrap">
                <div class="board_write">
                    <div class="title">
                        <dl>
                            <dt>제목</dt>
                            <dd><input type="text" name="post_title" placeholder="제목"></dd>
                        </dl>
                    </div>
                    <div class="info">
                        <dl>
                            <dt>글쓴이</dt>
                            <dd><input type="hidden" name="post_author" value="<%=userPk%>" placeholder="작성자"></dd>
                            <dd><p><%= userId %></p></dd>
                        </dl>
                        <dl>
<%--                            <dt>카테고리</dt>--%>
                            <dd><input type="hidden" name="post_categoryId" value="<%=1%>" placeholder="카테고리 아이디"></dd>--%>
<%--                            <dd><input type="text" name="post_categoryId" placeholder="카테고리 아이디"></dd>--%>
                        </dl>

                    </div>
                    <div class="cont">
                        <textarea name="post_contents" placeholder="내용 입력"></textarea>
                    </div>
                </div>
                <div class="bt_wrap">
                    <%--                    <a href="detail.jsp">작성</a>--%>
<%--                    <dd><input type="submit" value="작성" class="on"></dd>--%>
                    <%--                    <input type="submit" value="등록" class="on">--%>
                        <a href="javascript:void(0);" onclick="document.forms['frm'].submit();">작성</a>
                    <a href="home.jsp">취소</a>
                </div>
            </div>
        </form>

    </div>
</div>
<footer>

</footer>
</body>
<script>
    console.log("submit")
</script>
</html>