


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.sql.*" %>

<%
    String userId = null;
    String userPk = null;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("user_ID".equals(cookie.getName())) {
                userId = cookie.getValue();
            }
            else if ("user_pk".equals(cookie.getName())) {
                userPk = cookie.getValue();
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
    <title>save</title>

    <title>Title</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
</head>
<body>
<form action="/board/save" method="post">
    <p><%= userId %></p>
    <input type="hidden" name="post_author" value="<%=userPk%>>" placeholder="작성자"></input>
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