<%--
  Created by IntelliJ IDEA.
  User: KTDS
  Date: 2024-02-06
  Time: 오전 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<%--    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
    <title>Login</title>
</head>
<body>
<h1>SignUp</h1>
<form action="/user/signup" method="post" >
    <input type="text" name="userID" placeholder="Id">
    <br>
    <input type="text" name="user_pw" placeholder="Password">
    <br>
    <input type="text" name="user_name" placeholder="Name">
    <br>
    <input type="text" name="user_age" placeholder="Age">
    <br>
    <input type="text" name="user_job" placeholder="Job">
    <br>
    <input type="text" name="user_email" placeholder="Email">
    <br>
    <input type="submit" value="SignUp" onclick="window.location.href='index.jsp'">
</form>

</body>

</html>


