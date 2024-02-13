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
    String userId = null; // 사용자 ID를 저장할 변수
    Integer userPk = null;
    Cookie[] cookies = request.getCookies(); // 요청으로부터 쿠키 배열 가져오기
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("user_ID".equals(cookie.getName())) {
                userId = cookie.getValue(); // user_ID 쿠키의 값을 찾아 변수에 저장
                request.setAttribute("userId", userId);
            }
            else if ("user_pk".equals(cookie.getName())) {
                userPk = Integer.parseInt(cookie.getValue()); // user_ID 쿠키의 값을 찾아 변수에 저장
                request.setAttribute("userPk", userPk);
            }
        }
    }
    else{
        response.sendRedirect("login.jsp"); // 로그인 페이지로 리다이렉션
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
                <%--                    <!-- 대표이미지 -->--%>
                <%--                    <figure class="featured-image">--%>
                <%--                        <img src="./src/featured_image.jpg" alt="blog featured-image">--%>
                <%--                    </figure>--%>

                <!-- 본문내용 -->
                <article class="post-content">
                    <p id="realContents">
                        ${board.post_contents}
                    </p>
                    <%--                        <h2>지나가는 위에 내 별빛이 무엇인지 별 버리었습니다.</h2>--%>
                    <%--                        <p>많은 하나에 별이 나는 오면 별 흙으로 남은 까닭입니다. 차 소녀들의 별을 어머님, 별 벌써 흙으로 버리었습니다. 하나 하나에 벌써 못 했던 어머니 이네들은 별에도 까닭입니다. 이네들은 이웃 않은 계집애들의 내린 봄이 별이 딴은 있습니다. 한 내 멀듯이, 위에도 나의 쓸쓸함과 비둘기, 별빛이 그리고 봅니다. 당신은 잠, 별 헤는 하나에 것은 별 같이 잔디가 봅니다. 프랑시스 가난한 무엇인지 이름과, 봅니다. 했던 멀리 청춘이 덮어 때 까닭이요, 까닭입니다. 별 북간도에 프랑시스 덮어 있습니다. 우는 애기 아름다운 된 하나에 가슴속에 너무나 있습니다. </p>--%>
                    <%--                        <h2>하나에 멀듯이, 이름자 까닭입니다.</h2>--%>
                    <%--                        <p>겨울이 아스라히 하나에 까닭입니다. 아직 아름다운 이 계집애들의 별에도 봅니다. 된 추억과 동경과 멀리 노루, 계십니다. 된 경, 너무나 하늘에는 그러나 언덕 있습니다. 덮어 별 옥 보고, 하늘에는 불러 이름과, 내린 못 봅니다. 잔디가 하나에 패, 북간도에 아스라히 멀듯이, 부끄러운 차 있습니다. 겨울이 하나에 이름과, 봄이 까닭입니다. 하나에 위에 걱정도 오면 거외다. 패, 잔디가 이름을 그리워 자랑처럼 너무나 까닭입니다. 위에도 비둘기, 내 다하지 어머니, 쓸쓸함과 이 새워 이제 까닭입니다.</p>--%>

                    <%--                        <div class="image">--%>
                    <%--                            <figure class="image__item">--%>
                    <%--                                <img src="./src/image_01.jpg" alt="">--%>
                    <%--                            </figure>--%>
                    <%--                            <figure class="image__item">--%>
                    <%--                                <img src="./src/image_02.jpg" alt="">--%>
                    <%--                            </figure>--%>
                    <%--                        </div>--%>

                    <%--                        <p>많은 나의 된 이름과, 계십니다. 아직 써 하나의 계십니다. 풀이 옥 동경과 지나고 하나에 남은 하나에 이름과, 듯합니다. 밤이 까닭이요, 멀리 어머니, 청춘이 버리었습니다. 밤이 슬퍼하는 그러나 비둘기, 계십니다. 그리워 않은 파란 새겨지는 별 슬퍼하는 헤는 봅니다. 이름과 노새, 나는 어머님, 가을로 하나에 내린 무엇인지 봅니다. 계절이 하나에 지나고 불러 오는 봅니다. 청춘이 가난한 북간도에 별 버리었습니다.</p>--%>

                    <%--                        <blockquote>별들을 까닭이요, 어머님, 이국 까닭입니다. 헤일 너무나 애기 계십니다. 아름다운 이름을 그리고 묻힌 딴은 까닭입니다. 어머니, 청춘이 했던 가을 이름과 쓸쓸함과 당신은 까닭입니다. </blockquote>--%>

                    <%--                        <h2>이웃 쓸쓸함과 우는 별 릴케 걱정도 아무 봅니다.</h2>--%>

                    <%--                        <p>남은 동경과 어머니, 속의 둘 별빛이 강아지, 아스라히 하나에 듯합니다. 다하지 보고, 멀듯이, 까닭입니다. 하늘에는 까닭이요, 마리아 이름과, 너무나 벌써 아무 써 잔디가 거외다. 쉬이 이름과, 써 계십니다. 라이너 무성할 별 헤는 이름과 하늘에는 버리었습니다. 없이 이름과, 이름과, 아직 봅니다. 시와 나의 한 사람들의 비둘기, 멀리 버리었습니다. 불러 피어나듯이 벌레는 버리었습니다.</p>--%>

                    <%--                        <p>언덕 시인의 멀듯이, 무엇인지 그러나 오면 하나 버리었습니다. 토끼, 패, 그러나 하나에 소학교 계집애들의 지나고 다 듯합니다. 남은 위에 위에도 청춘이 흙으로 멀듯이, 마리아 있습니다. 위에 불러 강아지, 멀리 별을 어머니, 남은 많은 위에도 버리었습니다. 아무 노새, 별 노루, 이웃 가득 까닭입니다. 계집애들의 다 별 까닭입니다. 무성할 계집애들의 한 그리고 까닭입니다. 패, 헤는 밤을 아이들의 거외다. 밤을 내일 소학교 어머니, 피어나듯이 잠, 별 계십니다. 못 이 나는 있습니다. 가득 가슴속에 다 나의 별 하나에 봅니다.</p>--%>







                    <!-- 해시태그 -->
                    <%--                        <div class="hashtag">--%>
                    <%--                            <i data-feather="hash"></i>--%>
                    <%--                            <ul>--%>
                    <%--                                <li class="hashtag__item">#일기</li>--%>
                    <%--                                <li class="hashtag__item">#일상</li>--%>
                    <%--                                <li class="hashtag__item">#이야기</li>--%>
                    <%--                            </ul>--%>
                    <%--                        </div>--%>

                    <div class="data">
                        <i class='bx bx-show-alt iconData'></i>
                        <span class="hits">${board.post_viewNum}</span>
                        <i class='bx bxs-heart iconData'></i>
                        <span class="likes">${board.post_likeNum}</span>

                    </div>
                    <!-- 댓글 -->
                    <div class="comment">
                        <h2 class="comment__title">
                            <i data-feather="message-circle"></i>
                            Comment
                        </h2>

                        <div class="write__comment">
                            <span>작성자: <%= userId%></span>
                            <textarea id="cmm_text" cols="105" rows="5" placeholder="내용을 입력하세요"></textarea>
                            <button id="comment-write-btn" onclick="commentWrite()">댓글작성</button>

                        </div>

                        <div class="comment__item">
                            <c:forEach var="comment" items="${commentList}">
                                <div class="user">
                                    <div class="comment-contents">
                                        <div class="user__top">
                                                <%--                                            <figure class="user__avatar">--%>
                                                <%--                                                <img src="./src/comment_user_01.png" alt="">--%>
                                                <%--                                            </figure>--%>
                                            <ul>
                                                <li class="user__job"></li>
                                                <li class="user__name">${comment.cmm_writer}</li>
                                            </ul>
                                        </div>
                                        <div class="user__commentDate">
                                            <fmt:formatDate value="${board.post_postDate}" pattern="yyyy.MM.dd. HH:mm"/>
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
                    let output = "<table>";

                    for(let i in commentList){
                        console.log(commentList[i]);
                        output += "<tr>";
                        output += "<td>"+commentList[i].cmm_commentId+"</td>";
                        output += "<td>"+commentList[i].cmm_writer+"</td>";
                        output += "<td>"+commentList[i].cmm_text+"</td>";
                        output += "<td>"+commentList[i].cmm_commentDate+"</td>";
                        output += "</tr>";
                    }
                    output += "</table>";

                    console.log(output)
                    console.log(document.getElementById('comment-list'));
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
                    let output = "<table>";

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
</script>
</html>
