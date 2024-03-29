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
    <title>detail.jsp</title>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
</head>
<body>
<table>
    <tr>
        <th>글번호</th>
        <td>${board.post_id}</td>
    </tr>
    <tr>
        <th>작성자</th>
        <td>${board.post_author}</td>
    </tr>
    <tr>
        <th>작성일</th>
        <td>${board.post_postDate}</td>
    </tr>
    <tr>
        <th>조회수</th>
        <td>${board.post_viewNum}</td>
    </tr>
    <tr>
        <th>카테고리ID</th>
        <td>${board.post_categoryId}</td>
    </tr>
    <tr>
        <th>제목</th>
        <td>${board.post_title}</td>
    </tr>
    <tr>
        <th>글 내용</th>
        <td>${board.post_contents}</td>
    </tr>
</table>
<button onclick="listFn()">목록</button>
<%--<button onclick="updateFn()">수정</button>--%>
<%--<button onclick="deleteFn()">삭제</button>--%> <!-- 현재 로그인한 사용자가 글 작성자와 동일한 경우에만 수정 및 삭제 버튼 표시 -->
<c:if test="${board.post_author == userPk}">
    <button onclick="location.href='/board/update?id=${board.post_id}'">수정</button>
    <button onclick="location.href='/board/delete?id=${board.post_id}'">삭제</button>
</c:if>

<div>
    <input type="text" id="cmm_writer" placeholder="작성자">
    <input type="text" id="cmm_text" placeholder="내용">
    <button id="comment-write-btn" onclick="commentWrite()">댓글작성</button>
    <%--    <button id="comment-update-btn" onclick="commentUpdate()">댓글수정</button>--%>
    <%--    <button id="comment-delte-btn" onclick="commentDelete()">댓글삭제</button>--%>
</div>

<div id="comment-list">
    <table>
        <tr>
            <th>댓글번호</th>
            <th>작성자</th>
            <th>내용</th>
            <th>작성시간</th>
        </tr>
        <c:forEach var="comment" items="${commentList}">
            <tr>
                <td>${comment.cmm_commentId}</td>
                <td>${comment.cmm_writer}</td>
                <td>${comment.cmm_text}</td>
                <td>${comment.cmm_commentDate}</td>
                <td>
                    <c:if test="${comment.cmm_writer == userPk}">
                        <!-- 현재 로그인한 사용자가 댓글 작성자와 동일한 경우에만 버튼 표시 -->
                        <button onclick="updateComment(${comment.cmm_commentId})">수정</button>
                        <button onclick="deleteComment(${comment.cmm_commentId})">삭제</button>
                    </c:if>
                </td>
            </tr>
        </c:forEach>

    </table>
</div>
</body>
<script>
    const listFn = () => {
        const page = '${page}';
        location.href = "/board/paging?page=" + page;
    }
    <%--const updateFn = () => {--%>
    <%--    const post_id = '${board.post_id}'; //그래서 여기서 board.~~로 쓸 수 있음0000000000--%>
    <%--    location.href = "/board/update?id=" + post_id; //location: 전환할 페이지 주소--%>
    <%--}--%>
    <%--const deleteFn = () => {--%>
    <%--    const post_id = '${board.post_id}';--%>
    <%--    location.href = "/board/delete?id=" + post_id;--%>
    <%--}--%>

    const commentWrite = () => {
        const writer = document.getElementById("cmm_writer").value;
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

    //document.getElementById란 html 전체를 돔이라고 하는데 거기서 element를 가져온다라는 의미

    const commentUpdate = () => {
        <%--const post_id = '${board.post_id}';--%>
        // location.href = "/board/updateComment?id=" + post_id + "&cmm_commentId=" + cmm_commentId;
        let cmmId = prompt("수정할 댓글 번호를 입력하세요")

        // document.getElementById('cmm_writer').value='';
        // document.getElementById('cmm_text').value='';
        <%--const commentId = '${comment.cmm_commentId}';--%>
        const writer = document.getElementById("cmm_writer").value;
        const text = document.getElementById("cmm_text").value;
        const postId = '${board.post_id}';
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
    const commentDelete = () => {
        let cmmId = prompt("삭제할 댓글 번호를 입력하세요")
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
</script>
</html>