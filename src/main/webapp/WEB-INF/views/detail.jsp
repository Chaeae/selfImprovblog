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

<%
    String userId = null;
    Integer userPk = null;
    Cookie[] cookies = request.getCookies();
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
    <title>Title</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/resources/css/detail.css">
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
                    <img class="profile" src="/resources/image/profileImg.jpg" alt="profile">
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
                        <a href="board/home/myhome">
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
        <!-- 새로 추가된 container -->
        <div class="container">

            <!-- 새로 추가된 content -->
            <div class="content">

                <!-- 기존에 있던 header 영역 -->
                <header class="post-header">
                    <h2 class="post-header__title">${board.post_title}</h2>
                    <ul class="post-header__info">
                        <li class="post-header__date">
                            <i data-feather="calendar"></i>
                            <fmt:formatDate value="${board.post_postDate}" pattern="yyyy.MM.dd. HH:mm"/>
                        </li>
                        <li class="post-header__author">
                            <i data-feather="user"></i>
                            ${board.post_author}
                        </li>
                    </ul>
                </header>

                <c:if test="${board.post_author == userPk}">
                    <div class="commentBtn">
                        <i class='bx bxs-edit-alt commentBtnIcon' onclick="updateFn()">수정</i>
                        <i class='bx bxs-trash commentBtnIcon' onclick="deleteFn()">삭제</i>
                    </div>
                </c:if>

                <!-- 본문내용 -->
                <article class="post-content">
                    <p id="realContents">
                        ${board.post_contents}
                    </p>

                    <div class="data">
                        <i class='bx bx-show-alt iconData'></i>
                        <span class="hits">${board.post_viewNum}</span>
                        <i class='bx bxs-heart iconData'></i>
                        <span class="likes">${board.post_likeNum}</span>

                    </div>
                    <!-- 댓글 -->
                    <div id="comment-list">
                        <h2 class="comment__title">
                            <i data-feather="message-circle"></i>
                            Comment
                        </h2>

                        <div class="write__comment">
                            <span>작성자: <%= userId%></span>
                            <textarea id="cmm_text" cols="105" rows="5" placeholder="내용을 입력하세요"></textarea>
                            <button id="comment-write-btn" onclick="commentWrite()">댓글작성</button>

                        </div>

                        <div id="comment__item" class="comment__item">
                            <c:forEach var="comment" items="${commentList}">
                                <div id="user" class="user">
                                    <div class="comment-contents">
                                        <div class="user__top">
                                                <%--                                            <figure class="user__avatar">--%>
                                                <%--                                                <img src="./src/comment_user_01.png" alt="">--%>
                                                <%--                                            </figure>--%>
                                            <ul>
                                                <li class="user__name">${comment.cmm_writer}</li>
                                            </ul>
                                        </div>
                                        <div class="user__commentDate">
                                            <fmt:formatDate value="${comment.cmm_commentDate}" pattern="yyyy.MM.dd. HH:mm"/>
                                        </div>
                                        <div class="user__comment">
                                                ${comment.cmm_text}
                                        </div>
                                    </div>
                                    <c:if test="${comment.cmm_writer == userPk}">
                                        <div class="commentBtn">
                                            <i class='bx bxs-edit-alt commentBtnIcon' onclick="commentUpdate(${comment.cmm_commentId})"></i>
                                            <i class='bx bxs-trash commentBtnIcon' onclick="commentDelete(${comment.cmm_commentId})"></i>
                                        </div>
                                    </c:if>

                                </div>
                            </c:forEach>
                        </div>

                    </div>
                </article>

            </div>
        </div>


    </div>
</div>
<footer>

</footer>

</body>
<script src="//code.jquery.com/jquery-3.5.1.min.js" ></script>
<script>
    feather.replace();

    const updateFn = () => {
        const post_id = '${board.post_id}'; //그래서 여기서 board.~~로 쓸 수 있음0000000000
        location.href = "/board/update?id=" + post_id; //location: 전환할 페이지 주소
    }
    const deleteFn = () => {
        const post_id = '${board.post_id}';
        location.href = "/board/delete?id=" + post_id;
    }

    const commentWrite = () => {
        // const writer = document.getElementById("cmm_writer").value;
        const writer = '${userPk}';
        const text = document.getElementById("cmm_text").value;
        const postId = '${board.post_id}';
        $.ajax({
                type: "post",
                url: "/comment/save",
                data: {
                    cmm_writer: writer,
                    cmm_text: text,
                    cmm_postId: postId
                },
                dataType: "json",
                success: function(commentList) {
                    console.log("작성성공");
                    console.log(commentList);
                    let output = "";
                    commentList.forEach(comment => {
                        output += `
                            <div id="user">
                                <div class="comment-contents">
                                    <div class="user__top">
                                        <ul>
                                            <li class="user__name">${comment.cmm_writer}</li>
                                        </ul>
                                    </div>
                                    <div class="user__commentDate">${comment.cmm_commentDate}</div>
                                    <div class="user__comment">${comment.cmm_text}</div>
                                </div>
            <%--                    ${comment.cmm_writer == writer ? `<div class="commentBtn">--%>
            <%--                        <i class='bx bxs-edit-alt commentBtnIcon' onclick="commentUpdate(${comment.cmm_commentId})"></i>--%>
            <%--                        <i class='bx bxs-trash commentBtnIcon' onclick="commentDelete(${comment.cmm_commentId})"></i>--%>
            <%--                    </div>` : ''}--%>
                            </div>`;
                    });
                    document.getElementById('user').innerHTML = output;
                    document.getElementById('cmm_text').value = ''; // Reset textarea after posting
                },
            error: function() {
                console.log("실패");
            }
        });
    }

    //document.getElementById란 html 전체를 돔이라고 하는데 거기서 element를 가져온다라는 의미

    const commentUpdate = (cmm_commentId) => {
        <%--const post_id = '${board.post_id}';--%>
        // location.href = "/board/updateComment?id=" + post_id + "&cmm_commentId=" + cmm_commentId;
        //let cmmId = prompt("수정할 댓글 번호를 입력하세요")

        // document.getElementById('cmm_writer').value='';
        // document.getElementById('cmm_text').value='';
        <%--const commentId = '${comment.cmm_commentId}';--%>
        //const writer = document.getElementById("cmm_writer").value;
        let cmmId = cmm_commentId;
        const writer = '${userPk}';
        const text = document.getElementById("cmm_text").value;
        const postId = '${board.post_id}';
        console.log(typeof postId);
        $.ajax({
                type: "post",
                url: "/comment/updateComment",
                data: {
                    cmm_commentId: cmmId,
                    cmm_writer: writer,
                    cmm_text: text,
                    cmm_postId: postId
                },
                dataType: "json",
                success: function(commentList) {
                    console.log("댓글 수정 성공");
                    console.log(commentList);
                    let output = "<table>";
                    output += "<tr><th>댓글번호</th>";
                    output += "<th>작성자</th>";
                    output += "<th>내용</th>";
                    output += "<th>작성시간</th></tr>";
                    for(let i in commentList){
                        output += "<tr>";
                        output += "<td>"+commentList[i].cmm_commentId+"</td>";
                        output += "<td>"+commentList[i].cmm_writer+"</td>";
                        output += "<td>"+commentList[i].cmm_text+"</td>";
                        output += "<td>"+commentList[i].cmm_commentDate+"</td>";
                        output += "</tr>";
                    }
                    output += "</table>";
                    document.getElementById('comment-list').innerHTML = output;
                    document.getElementById('cmm_writer').value='';
                    document.getElementById('cmm_text').value='';
                },
                error: function() {
                    console.log("실패");
                }
            }
        );
    }
    const commentDelete = (cmm_commentId) => {
        //let cmmId = prompt("삭제할 댓글 번호를 입력하세요")
        let cmmId = cmm_commentId;
        const postId = '${board.post_id}';
        $.ajax({
                type: "post",
                url: "/comment/deleteComment",
                data: {
                    cmm_commentId: cmmId,
                    cmm_postId: postId
                },
                dataType: "json",
                success: function(commentList) {
                    console.log("댓글 삭제 성공");
                    console.log(commentList);
                    let output = "";
                    commentList.forEach(comment => {
                        output += `
                            <div id="user">
                                <div class="comment-contents">
                                    <div class="user__top">
                                        <ul>
                                            <li class="user__name">${comment.cmm_writer}</li>
                                        </ul>
                                    </div>
                                    <div class="user__commentDate">${comment.cmm_commentDate}</div>
                                    <div class="user__comment">${comment.cmm_text}</div>
                                </div>
            <%--                    ${comment.cmm_writer == writer ? `<div class="commentBtn">--%>
            <%--                        <i class='bx bxs-edit-alt commentBtnIcon' onclick="commentUpdate(${comment.cmm_commentId})"></i>--%>
            <%--                        <i class='bx bxs-trash commentBtnIcon' onclick="commentDelete(${comment.cmm_commentId})"></i>--%>
            <%--                    </div>` : ''}--%>
                            </div>`;
                    });
                    document.getElementById('user').innerHTML = output;
                    document.getElementById('cmm_text').value = ''; // Reset textarea after posting
                },
            error: function() {
                console.log("실패");
            }
        });
    }
</script>
</html>
