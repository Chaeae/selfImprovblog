<%--
  Created by IntelliJ IDEA.
  User: KTDS
  Date: 2024-02-06
  Time: 오전 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
</head>
<body>
<h1>LogIn</h1>
<form action="/user/login" method="post" >
    <input type="text" name="user_ID" placeholder="Id">
    <br>
    <input type="text" name="user_pw" placeholder="Password">
    <br>
    <input type="submit" value="Login">
</form>

</body>
<%--<script>--%>
<%--    const loginReqFn = () => {--%>
<%--        const userIdInput = document.getElementById("user_ID").value;--%>
<%--        const userPwInput = document.getElementById("user_pw").value;--%>
<%--        const passDB = '${user.user_pw}';--%>
<%--        if (userPwInput == passDB) {--%>
<%--            document.updateForm.submit();--%>
<%--        } else {--%>
<%--            alert("비밀번호가 일치하지 않습니다!!");--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>
</html>

