<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>save</title>
</head>
<body>
<form action="/board/save" method="post">
    <input type="text" name="post_author" placeholder="작성자">
    <input type="text" name="post_categoryId" placeholder="카테고리 아이디">
    <input type="text" name="post_title" placeholder="제목">
    <textarea name="post_contents" cols="60" rows="20" placeholder="내용을 입력하세요"></textarea>

    <input type="submit" value="작성">
</form>
</body>
<script>
    console.log("submit")
</script>
</html>






<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.sql.*" %>

<%
    String userId = null; // 사용자 ID를 저장할 변수
    String userPk = null;
    Cookie[] cookies = request.getCookies(); // 요청으로부터 쿠키 배열 가져오기
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("user_ID".equals(cookie.getName())) {
                userId = cookie.getValue(); // user_ID 쿠키의 값을 찾아 변수에 저장
            }
            else if ("user_pk".equals(cookie.getName())) {
                userPk = cookie.getValue(); // user_ID 쿠키의 값을 찾아 변수에 저장
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
    <title>save</title>

    <title>Title</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
</head>
<body>
<form action="/board/save" method="post">
    <input type="text" name="post_author" placeholder="작성자">
    <input type="text" name="post_categoryId" placeholder="카테고리 아이디">
    <input type="text" name="post_title" placeholder="제목">
    <textarea name="post_contents" cols="60" rows="20" placeholder="내용을 입력하세요"></textarea>

    <input type="submit" value="작성">
</form>
</body>
<script>
    console.log("submit")
</script>
</html>